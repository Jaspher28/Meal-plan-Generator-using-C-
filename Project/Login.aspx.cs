using System;
using System.Data.SqlClient;
using System.Configuration;

namespace Project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void LoginUser(object sender, EventArgs e)
        {
            // Clear previous error messages
            usernameError.Text = "";
            passwordError.Text = "";

            bool isValid = true;

            // Validate Username
            if (string.IsNullOrWhiteSpace(username.Text))
            {
                usernameError.Text = "<span class='error-message'>Username is required.</span>";
                isValid = false;
            }

            // Validate Password
            if (string.IsNullOrWhiteSpace(password.Text))
            {
                passwordError.Text = "<span class='error-message'>Password is required.</span>";
                isValid = false;
            }

            if (isValid)
            {
                // Perform login logic (e.g., check credentials in the database)
                string connectionString = ConfigurationManager.ConnectionStrings["DietDBConnection"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(1) FROM Register WHERE Username = @Username AND Password = @Password";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", password.Text.Trim());

                        con.Open();
                        int count = Convert.ToInt32(cmd.ExecuteScalar());

                        if (count == 1)
                        {
                            // Login successful
                            // Store the username in session
                            Session["Username"] = username.Text.Trim();
                            Response.Redirect("Index.aspx");  // Redirect to the index page after successful login
                        }
                        else
                        {
                            // Login failed
                            passwordError.Text = "<span class='error-message'>Invalid username or password.</span>";
                        }
                    }
                }
            }
        }
    }
}
