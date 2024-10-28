using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Project
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadMealPlan();
            }
        }

        private void LoadMealPlan()
        {
            // Check if the user is logged in
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString(); // Retrieve the Username from the session

                // Get the connection string
                string connectionString = ConfigurationManager.ConnectionStrings["DietDBConnection"].ConnectionString;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Query to get the meal plan for the logged-in user
                    string query = "SELECT MealPlan FROM DietPlan WHERE Username = @Username";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username); // Use the session username for the query

                        try
                        {
                            con.Open();
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    // Retrieve the MealPlan data and display it
                                    string mealPlan = reader["MealPlan"].ToString();
                                    lblMealPlan.Text = mealPlan; // Display the meal plan in the label
                                }
                                else
                                {
                                    // Display message if no meal plan exists
                                    lblMealPlan.Text = "No meal plan found.";
                                }
                            }
                        }
                        catch (SqlException sqlEx)
                        {
                            // Handle database errors
                            lblMealPlan.Text = "Database error: " + sqlEx.Message;
                        }
                        catch (Exception ex)
                        {
                            // Handle other errors
                            lblMealPlan.Text = "An error occurred: " + ex.Message;
                        }
                    }
                }
            }
            else
            {
                // Prompt for login if the session is null
                lblMealPlan.Text = "You need to log in to view your meal plan.";
            }
        }      
    }
}
