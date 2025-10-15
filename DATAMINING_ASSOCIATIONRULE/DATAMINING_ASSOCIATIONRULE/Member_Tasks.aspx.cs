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
    public partial class Member_Tasks : System.Web.UI.Page
    {
        Member_Class obj = new Member_Class();
        string value = null, comp_password = null;
        DataTable tab = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Customer_ID"] == null)
                {
                    Session.Abandon();
                    Response.Redirect("Home_page.aspx");
                }
                else
                {
                    value = Request.QueryString["value"].ToString();

                    if (value.Equals("Profile"))
                    {
                        LoadProfile();
                        MultiView1.SetActiveView(View1);
                    }

                    else if (value.Equals("Feedbacks"))
                    {
                        MultiView1.SetActiveView(View3);
                    }

                    else if (value.Equals("Changepassword"))
                    {
                        MultiView1.SetActiveView(View4);
                    }
                }
            }
            catch
            {

            }
        }

        public void LoadProfile()
        {
            tab.Rows.Clear();

            tab = obj.GetCustomerDetails(Session["Customer_ID"].ToString());

            if (tab.Rows.Count > 0)
            {
                DetailsView1.DataSource = tab.DefaultView;
                DetailsView1.DataBind();
            }

        }

        protected void btn_feedback_Click(object sender, EventArgs e)
        {
            try
            {
                obj.Insert_Feedback(Session["Customer_ID"].ToString(), txt_feedback.Text, DateTime.Now.ToShortDateString());
                txt_feedback.Text = string.Empty;

                ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('New Feedback Posted Successfully')</script>");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Server Error!')</script>");
            }
        }

        protected void btn_changepwd_Click(object sender, EventArgs e)
        {
            tab.Rows.Clear();

            tab = obj.GetCustomerDetails(Session["Customer_ID"].ToString());

            string original_pwd = tab.Rows[0]["Password"].ToString();

            if (txt_oldpassword.Text.Equals(original_pwd))
            {
                try
                {
                    obj.Customer_Changepwd(txt_newpwd.Text, Session["Customer_ID"].ToString());

                    ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Password changed successfully')</script>");
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Server Error!')</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Old password incorrect')</script>");
            }
        }

       
    }
}
