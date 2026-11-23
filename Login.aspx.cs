using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

public partial class Login : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["FitTrackConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Retrieve Email from Cookie if "Remember Me" was checked previously
            if (Request.Cookies["FitTrackUserEmail"] != null)
            {
                txtEmail.Text = Request.Cookies["FitTrackUserEmail"].Value;
                chkRemember.Checked = true;
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT FullName, Email FROM Users WHERE Email=@Email AND Password=@Password";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Store user data in Session
                    Session["UserName"] = reader["FullName"].ToString();
                    Session["UserEmail"] = reader["Email"].ToString();

                    // Save or remove Cookie based on Remember Me checkbox
                    if (chkRemember.Checked)
                    {
                        HttpCookie userCookie = new HttpCookie("FitTrackUserEmail", email);
                        userCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(userCookie);
                    }
                    else
                    {
                        HttpCookie userCookie = new HttpCookie("FitTrackUserEmail");
                        userCookie.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(userCookie);
                    }

                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password. Please try again.";
                }
            }
        }
    }
}
