using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class PostItemFeedbacks : System.Web.UI.Page
    {
        Member_Class obj = new Member_Class();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)

                DropDownListRating.SelectedIndex = 0;

            lblItemName.Font.Bold = true;
            lblItemName.ForeColor = System.Drawing.Color.SteelBlue;
            lblItemName.Text = "Item Name: " + Request.QueryString["ItemName"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (obj.CheckCustomerRating(Session["Customer_ID"].ToString(), int.Parse(Request.QueryString["ItemId"].ToString())))
            {
                obj.NewItemFeedback(int.Parse(Request.QueryString["ItemId"].ToString()), Session["Customer_ID"].ToString(), int.Parse(DropDownListRating.SelectedValue), System.DateTime.Now);
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Item Rated Successfully')</script>");
            }
            else
            {
                DataTable tab = new DataTable();
                tab = obj.GetCustomerRating(Session["Customer_ID"].ToString(), int.Parse(Request.QueryString["ItemId"].ToString()));

                obj.DeleteRating(int.Parse(tab.Rows[0]["RatingId"].ToString()));
                obj.NewItemFeedback(int.Parse(Request.QueryString["ItemId"].ToString()), Session["Customer_ID"].ToString(), int.Parse(DropDownListRating.SelectedValue), System.DateTime.Now);

                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Item Rated Successfully')</script>");
            }
        }
    }
}