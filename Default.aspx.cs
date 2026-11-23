using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

public partial class _Default : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["FitTrackConn"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 1. Check Session for Logged-in User
        if (Session["UserName"] != null)
        {
            lblSessionUser.Text = "Welcome, " + Session["UserName"].ToString() + " (" + Session["UserEmail"].ToString() + ")";
            btnLogout.Visible = true;
        }
        else
        {
            lblSessionUser.Text = "Welcome, Guest! Please Login to start a session.";
            btnLogout.Visible = false;
        }

        // 2. Read & Write Cookie (Last Visit Timestamp)
        if (Request.Cookies["FitTrackLastVisit"] != null)
        {
            lblCookieInfo.Text = "Last Visit (from Cookie): " + Request.Cookies["FitTrackLastVisit"].Value;
        }
        else
        {
            lblCookieInfo.Text = "First visit! A tracking cookie has been created.";
        }

        HttpCookie visitCookie = new HttpCookie("FitTrackLastVisit", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
        visitCookie.Expires = DateTime.Now.AddDays(7);
        Response.Cookies.Add(visitCookie);

        if (!IsPostBack)
        {
            LoadWorkouts();
        }
    }

    // RETRIEVE all workouts from database
    private void LoadWorkouts(string searchKeyword = "")
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT WorkoutID, WorkoutDay, MuscleGroup, Duration, Intensity FROM Workouts";
            if (!string.IsNullOrWhiteSpace(searchKeyword))
            {
                query += " WHERE WorkoutDay LIKE @Search OR MuscleGroup LIKE @Search";
            }

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                if (!string.IsNullOrWhiteSpace(searchKeyword))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + searchKeyword + "%");
                }
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvWorkouts.DataSource = dt;
                gvWorkouts.DataBind();
            }
        }
    }

    // INSERT workout
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtDay.Text) || string.IsNullOrWhiteSpace(txtMuscle.Text))
        {
            lblCrudStatus.CssClass = "msg-error";
            lblCrudStatus.Text = "Please enter at least Day and Muscle Group to insert.";
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "INSERT INTO Workouts (WorkoutDay, MuscleGroup, Duration, Intensity) VALUES (@Day, @Muscle, @Duration, @Intensity)";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Day", txtDay.Text.Trim());
                cmd.Parameters.AddWithValue("@Muscle", txtMuscle.Text.Trim());
                cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.Trim());
                cmd.Parameters.AddWithValue("@Intensity", ddlIntensity.SelectedValue);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
        lblCrudStatus.CssClass = "msg-success";
        lblCrudStatus.Text = "Workout inserted successfully!";
        ClearFields();
        LoadWorkouts();
    }

    // UPDATE workout
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id;
        if (!int.TryParse(txtWorkoutID.Text.Trim(), out id))
        {
            lblCrudStatus.CssClass = "msg-error";
            lblCrudStatus.Text = "Please enter a valid numeric Workout ID to update.";
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "UPDATE Workouts SET WorkoutDay=@Day, MuscleGroup=@Muscle, Duration=@Duration, Intensity=@Intensity WHERE WorkoutID=@ID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@ID", id);
                cmd.Parameters.AddWithValue("@Day", txtDay.Text.Trim());
                cmd.Parameters.AddWithValue("@Muscle", txtMuscle.Text.Trim());
                cmd.Parameters.AddWithValue("@Duration", txtDuration.Text.Trim());
                cmd.Parameters.AddWithValue("@Intensity", ddlIntensity.SelectedValue);
                con.Open();
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblCrudStatus.CssClass = "msg-success";
                    lblCrudStatus.Text = "Workout ID " + id + " updated successfully!";
                }
                else
                {
                    lblCrudStatus.CssClass = "msg-error";
                    lblCrudStatus.Text = "Workout ID not found.";
                }
            }
        }
        ClearFields();
        LoadWorkouts();
    }

    // DELETE workout
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int id;
        if (!int.TryParse(txtWorkoutID.Text.Trim(), out id))
        {
            lblCrudStatus.CssClass = "msg-error";
            lblCrudStatus.Text = "Please enter a valid numeric Workout ID to delete.";
            return;
        }

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "DELETE FROM Workouts WHERE WorkoutID=@ID";
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@ID", id);
                con.Open();
                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    lblCrudStatus.CssClass = "msg-success";
                    lblCrudStatus.Text = "Workout ID " + id + " deleted successfully!";
                }
                else
                {
                    lblCrudStatus.CssClass = "msg-error";
                    lblCrudStatus.Text = "Workout ID not found.";
                }
            }
        }
        ClearFields();
        LoadWorkouts();
    }

    // SEARCH workouts
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadWorkouts(txtSearch.Text.Trim());
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        LoadWorkouts();
    }

    // LOGOUT (Clear Session)
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    private void ClearFields()
    {
        txtWorkoutID.Text = "";
        txtDay.Text = "";
        txtMuscle.Text = "";
        txtDuration.Text = "";
    }
}
