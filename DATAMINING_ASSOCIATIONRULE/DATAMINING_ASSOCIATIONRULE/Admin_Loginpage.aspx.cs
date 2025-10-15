using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class Admin_Loginpage : System.Web.UI.Page
    {
        Visitor obj = new Visitor();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hide error message on initial load
                Label1.Visible = false;
            }
        }

        protected void btn_submit_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                // Clear any previous error message
                Label1.Visible = false;

                if (obj.Check_Adminlogin(tb_uname.Text.Trim(), tb_pass.Text.Trim()))
                {
                    // Store admin session information
                    Session["Admin_ID"] = tb_uname.Text.Trim();
                    Session["Login"] = "Admin";

                    // Redirect to admin homepage
                    Response.Redirect("Admin_Homepage.aspx");
                }
                else
                {
                    // Show error message
                    Label1.Text = "Invalid Admin ID or Password. Please try again.";
                    Label1.Visible = true;

                    // Clear the password field for security
                    tb_pass.Text = "";

                    // Re-focus on username field
                    tb_uname.Focus();
                }
            }
            catch (Exception ex)
            {
                // Log the error if you have logging
                // Logger.LogError(ex);

                Label1.Text = "An error occurred during login. Please try again.";
                Label1.Visible = true;

                // Clear both fields
                tb_uname.Text = "";
                tb_pass.Text = "";
                tb_uname.Focus();
            }
        }
    }
}