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
    public partial class Registration_page : System.Web.UI.Page
    {
        Visitor obj = new Visitor();

        protected void Page_Load(object sender, EventArgs e)
        {
            txt_EmailID.Focus();
        }

        public void cleartxtboxes()
        {
            txt_EmailID.Text = string.Empty;
            txt_Name.Text = string.Empty;
            txt_address.Text = string.Empty;
            txt_contactNo.Text = string.Empty;
            DropDownList1.SelectedIndex = 0;
            dropdownlistEducation.SelectedIndex = 0;
            dropdownlistGender.SelectedIndex = 0;
            dropdownlistIncome.SelectedIndex = 0;
            dropdownlistMartialstatus.SelectedIndex = 0;
            dropdownlistMonth.SelectedIndex = 0;
            dropdownlistOccupation.SelectedIndex = 0;
            dropdownlistYear.SelectedIndex = 0;
            dropdownlistDay.SelectedIndex = 0;
        }

        protected void btn_registration_Click(object sender, ImageClickEventArgs e)
        {
            if (obj.Check_CustomerID_Avail(txt_EmailID.Text) && obj.Check_AdminID(txt_EmailID.Text))
            {
                try
                {
                    //string[] s = txtDOB.Text.Split('/');

                    obj.NewRegistration(txt_EmailID.Text, txt_Name.Text, txt_password.Text, dropdownlistGender.SelectedValue, dropdownlistYear.SelectedValue, dropdownlistMartialstatus.SelectedValue, dropdownlistEducation.SelectedValue, dropdownlistOccupation.SelectedValue, dropdownlistIncome.SelectedValue, DropDownList1.SelectedValue.ToString(), txt_contactNo.Text, txt_address.Text);

                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Registered Successfully')</script>");
                    cleartxtboxes();
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Server Error!')</script>");
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "key", "<script>alert('Customer EmailID already exists')</script>");
            }
        }
    }
}
