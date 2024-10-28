using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ///// this is session validation is the user logged in
            // Check if the user is logged in by verifying the session variable
            //if (Session["Username"] == null)
            //{
                // If the session is null, redirect to the login page
              //  Response.Redirect("Login.aspx");
            //}
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            if (ValidateInput())
            {
                try
                {
                    // Retrieve the username from the session
                    string username = Session["Username"] as string;

                    if (string.IsNullOrEmpty(username))
                    {
                        // If the username is null, redirect to login
                        Response.Redirect("Login.aspx");
                        return;
                    }

                    // Generate the meal plan based on user inputs
                    string mealPlan = GenerateMealPlan(
                        Convert.ToInt32(txtAge.Text),
                        Convert.ToDecimal(txtHeight.Text),
                        Convert.ToDecimal(txtWeight.Text),
                        ddlActivityLevel.SelectedValue,
                        ddlDietType.SelectedValue
                    );

                    // Use the DataAccessLayer to insert or update the meal plan
                    DataAccessLayer dataAccessLayer = new DataAccessLayer();
                    bool isInserted = dataAccessLayer.InsertOrUpdateDietPlan(
                        username, // Pass the session username to associate the plan with the user
                        txtName.Text,
                        ddlGender.SelectedValue,
                        Convert.ToInt32(txtAge.Text),
                        Convert.ToInt32(txtHeight.Text),
                        Convert.ToInt32(txtWeight.Text),
                        ddlActivityLevel.SelectedValue,
                        ddlDietType.SelectedValue,
                        mealPlan // Pass the generated meal plan
                    );

                    if (isInserted)
                    {
                        // Clear form fields after successful insertion
                        ClearFormFields();

                        // Show success toast notification
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showSuccessToast", "showToast('success', 'Your Plan Generated');", true);

                        // Optionally, show a modal
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "createStrategicPlanModal", "createStrategicPlanModal();", true);
                    }
                    else
                    {
                        // If insertion fails, show error toast
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorToast", "showToast('error', 'Insertion failed.');", true);
                    }
                }
                catch (Exception ex)
                {
                    // Show error toast notification in case of a database failure
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorToast", $"showToast('error', 'Database error: {ex.Message}');", true);
                }
            }
        }

        // Method to generate the meal plan based on inputs
        private string GenerateMealPlan(int age, decimal height, decimal weight, string activityLevel, string dietType)
        {
            string mealPlan = "Meal Plan for " + dietType + " diet:\n";

            if (activityLevel == "Sedentary")
            {
                mealPlan += "Breakfast: Oatmeal\nLunch: Salad with chickpeas\nDinner: Grilled vegetables and quinoa";
            }
            else if (activityLevel == "Moderate")
            {
                mealPlan += "Breakfast: Smoothie bowl\nLunch: Chicken salad\nDinner: Stir-fried tofu and rice";
            }
            else if (activityLevel == "Heavy")
            {
                mealPlan += "Breakfast: Eggs and avocado toast\nLunch: Grilled chicken wrap\nDinner: Beef stir-fry with vegetables";
            }

            // Customize meal plan based on diet type
            if (dietType == "Veg")
            {
                mealPlan += "\nSnacks: Fruit, nuts, and seeds";
            }
            else
            {
                mealPlan += "\nSnacks: Greek yogurt, boiled eggs, and protein shakes";
            }

            return mealPlan;
        }

        // Input validation
        private bool ValidateInput()
        {
            string errorMessage = "";

            // Validate Name
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                errorMessage += "Name is required.<br/>";
            }
            else if (txtName.Text.Length > 50)
            {
                errorMessage += "Name must be 50 characters or less.<br/>";
            }

            // Validate Gender
            if (ddlGender.SelectedValue == "")
            {
                errorMessage += "Please select a gender.<br/>";
            }

            // Validate Age
            if (!int.TryParse(txtAge.Text, out int age) || age < 1 || age > 120)
            {
                errorMessage += "Age must be a number between 1 and 120.<br/>";
            }

            // Validate Height
            if (!int.TryParse(txtHeight.Text, out int height) || height < 50 || height > 300)
            {
                errorMessage += "Height must be a number between 50 and 300 cm.<br/>";
            }

            // Validate Weight
            if (!int.TryParse(txtWeight.Text, out int weight) || weight < 20 || weight > 500)
            {
                errorMessage += "Weight must be a number between 20 and 500 kg.<br/>";
            }

            // Validate Activity Level
            if (ddlActivityLevel.SelectedValue == "")
            {
                errorMessage += "Please select an activity level.<br/>";
            }

            // Validate Diet Type
            if (ddlDietType.SelectedValue == "")
            {
                errorMessage += "Please select a diet type.<br/>";
            }

            // Show error toast if validation fails
            if (!string.IsNullOrEmpty(errorMessage))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showErrorToast", $"showToast('error', '{errorMessage}');", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "keepModalOpen", "$('#generateplanmodal').modal('show');", true);
                return false;
            }

            return true;
        }

        // Method to clear form fields after successful insertion
        private void ClearFormFields()
        {
            txtName.Text = "";
            ddlGender.SelectedIndex = 0;
            txtAge.Text = "";
            txtHeight.Text = "";
            txtWeight.Text = "";
            ddlActivityLevel.SelectedIndex = 0;
            ddlDietType.SelectedIndex = 0;
        }
    }
}
