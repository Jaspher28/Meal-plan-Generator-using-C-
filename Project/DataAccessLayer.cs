using System;
using System.Data.SqlClient;
using System.Configuration;

public class DataAccessLayer
{
    // Method to insert or update diet plan data into the database, including the meal plan
    public bool InsertOrUpdateDietPlan(string username, string name, string gender, int age, int height, int weight, string activityLevel, string dietType, string mealPlan)
    {
        // Get the connection string from the web.config file
        string connectionString = ConfigurationManager.ConnectionStrings["DietDBConnection"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connectionString))
        {
            try
            {
                // Open the database connection
                con.Open();

                // Check if the username already exists in the DietPlan table
                string checkQuery = "SELECT COUNT(1) FROM dbo.DietPlan WHERE Username = @Username";
                using (SqlCommand checkCmd = new SqlCommand(checkQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Username", username);
                    int userExists = (int)checkCmd.ExecuteScalar();

                    // If the user exists, delete the existing record
                    if (userExists > 0)
                    {
                        string deleteQuery = "DELETE FROM dbo.DietPlan WHERE Username = @Username";
                        using (SqlCommand deleteCmd = new SqlCommand(deleteQuery, con))
                        {
                            deleteCmd.Parameters.AddWithValue("@Username", username);
                            deleteCmd.ExecuteNonQuery();
                        }
                    }
                }

                // Insert the new meal plan data
                string insertQuery = @"INSERT INTO dbo.DietPlan (Username, Name, Gender, Age, Height, Weight, ActivityLevel, DietType, MealPlan) 
                                       VALUES (@Username, @Name, @Gender, @Age, @Height, @Weight, @ActivityLevel, @DietType, @MealPlan)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    // Add parameters to the SQL query
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Age", age);
                    cmd.Parameters.AddWithValue("@Height", height);
                    cmd.Parameters.AddWithValue("@Weight", weight);
                    cmd.Parameters.AddWithValue("@ActivityLevel", activityLevel);
                    cmd.Parameters.AddWithValue("@DietType", dietType);
                    cmd.Parameters.AddWithValue("@MealPlan", mealPlan);

                    // Execute the SQL query
                    int rowsAffected = cmd.ExecuteNonQuery();

                    // Return true if insertion was successful
                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during the database operation
                throw new Exception("Error while inserting or updating data: " + ex.Message);
            }
        }
    }
}
