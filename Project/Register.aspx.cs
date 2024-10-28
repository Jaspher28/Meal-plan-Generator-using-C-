using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Project
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            // Clear previous error messages
            usernameError.Text = "";
            emailError.Text = "";
            passwordError.Text = "";

            bool isValid = true;

            // Validate Username
            if (string.IsNullOrWhiteSpace(username.Text))
            {
                usernameError.Text = "<span class='error-message'>Username is required.</span>";
                isValid = false;
            }

            // Validate Email
            if (string.IsNullOrWhiteSpace(email.Text))
            {
                emailError.Text = "<span class='error-message'>Email is required.</span>";
                isValid = false;
            }
            else if (!IsValidEmail(email.Text))
            {
                emailError.Text = "<span class='error-message'>Invalid email format.</span>";
                isValid = false;
            }

            // Validate Password
            if (string.IsNullOrWhiteSpace(password.Text))
            {
                passwordError.Text = "<span class='error-message'>Password is required.</span>";
                isValid = false;
            }

            // If all inputs are valid, proceed with registration (e.g., save to database)
            if (isValid)
            {
                // Proceed with saving user data to the database
                RegisterAccess registerAccess = new RegisterAccess();
                bool success = registerAccess.SaveUser(username.Text.Trim(), email.Text.Trim(), password.Text.Trim());

                if (success)
                {
                    // After successful registration, redirect to login page
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Registration failed. Please try again.');</script>");
                }
            }
        }

        // Helper function to validate email format
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}
