using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Project
{
    public class RegisterAccess
    {
        public bool SaveUser(string username, string email, string password)
        {
            try
            {
                // Get the connection string from Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["DietDBConnection"].ConnectionString;

                // SQL query to insert the user data into the Register table
                string query = "INSERT INTO Register (Username, Email, Password) VALUES (@Username, @Email, @Password)";

                // Create a connection to the database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Create a SQL command object
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password); // Consider hashing passwords for security

                        // Open the database connection
                        con.Open();

                        // Execute the SQL command to insert the data
                        cmd.ExecuteNonQuery();
                    }
                }

                // Return success
                return true;
            }
            catch (Exception ex)
            {
                // Log the error (optional) and return failure
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }
    }
}
