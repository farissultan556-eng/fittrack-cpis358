using System;

public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] != null)
        {
            lblSessionStatus.Text = "Active Session: Logged in as " + Session["UserName"].ToString();
        }
        else
        {
            lblSessionStatus.Text = "Session Status: Browsing as Guest";
        }
    }
}
