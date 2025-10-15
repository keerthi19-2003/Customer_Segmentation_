using System;
using System.Web.UI;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class Login_page : Page
    {
        Visitor obj = new Visitor();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Any page load logic if needed
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string username = txt_username.Text.Trim();
            string password = txt_password.Text.Trim();

            bool isValid = obj.CheckLogin(username, password);

            if (isValid)
            {
                Session["username"] = username;
                Response.Redirect("Homepage.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
        }
    }
}
