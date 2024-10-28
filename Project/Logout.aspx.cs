using System;

namespace Project
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["confirm"] == "yes")
            {
                // Clear the session
                Session.Clear();
                Session.Abandon();

                // Redirect to login page
                Response.Redirect("Login.aspx");
            }
        }
    }
}