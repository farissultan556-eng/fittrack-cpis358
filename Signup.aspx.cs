using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class Signup : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["FitTrackConn"].ConnectionString;

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = "INSERT INTO Users (FullName, Email, Password) VALUES (@FullName, @Email, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtRegEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", txtRegPass.Text.Trim());
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            lblSignupMsg.CssClass = "msg-success";
            lblSignupMsg.Text = "Account created successfully! You can now Login.";
            txtFullName.Text = "";
            txtRegEmail.Text = "";
            txtRegPass.Text = "";
        }
        catch (SqlException ex)
        {
            lblSignupMsg.CssClass = "msg-error";
            lblSignupMsg.Text = "Error: This email may already be registered. (" + ex.Message + ")";
        }
    }
}
