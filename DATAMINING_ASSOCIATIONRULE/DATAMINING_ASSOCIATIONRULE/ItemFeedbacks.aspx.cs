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
using System.Collections.Generic;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class ItemFeedbacks : System.Web.UI.Page
    {
        Member_Class obj = new Member_Class();
        DataTable tab1 = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetCustomerDistinctItems();
        }

        private void GetCustomerDistinctItems()
        {
            tab1.Rows.Clear();
            tab1 = obj.GetCustomerDistinctItems(Session["Customer_ID"].ToString());

            if (tab1.Rows.Count > 0)
            {
                Table1.Rows.Clear();

                Table1.GridLines = GridLines.Both;

                TableHeaderRow mainrow1 = new TableHeaderRow();
                mainrow1.ForeColor = System.Drawing.Color.SteelBlue;
                mainrow1.BackColor = System.Drawing.Color.AliceBlue;

                TableHeaderCell cell1 = new TableHeaderCell();
                cell1.Text = "Item Set";
                mainrow1.Controls.Add(cell1);

                TableHeaderCell cell2 = new TableHeaderCell();
                cell2.Text = "Feedback";
                mainrow1.Controls.Add(cell2);
                               
                Table1.Controls.Add(mainrow1);

                for (int i = 0; i < tab1.Rows.Count; i++)
                {
                    TableRow row = new TableRow();

                    TableCell cell_item = new TableCell();
                    cell_item.HorizontalAlign = HorizontalAlign.Left;
                    cell_item.Width = 150;
                    DataTable tab3 = new DataTable();
                    tab3.Rows.Clear();

                    tab3 = obj.GetItemDetails(int.Parse(tab1.Rows[i]["Item_ID"].ToString()));
                    cell_item.Text = tab3.Rows[0]["Item_Name"].ToString();
                    row.Controls.Add(cell_item);

                    TableCell cellfeedback = new TableCell();
                    LinkButton lbtbFdback = new LinkButton();
                    lbtbFdback.Text = "Post Feedback";
                    lbtbFdback.ID = "ItemFeedback~" + tab3.Rows[0]["Item_ID"].ToString() + "~" + tab3.Rows[0]["Item_Name"].ToString();
                    lbtbFdback.Click += new EventHandler(lbtbFdback_Click);
                    cellfeedback.Controls.Add(lbtbFdback);
                    row.Controls.Add(cellfeedback);


                    Table1.Controls.Add(row);
                }

            }
            else
            {
                Table1.Rows.Clear();
                Table1.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.ColumnSpan = 5;
                cell.Text = "No Transactions Found";
                row.Controls.Add(cell);

                Table1.Controls.Add(row);
            }
        }

       

        void lbtbFdback_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            string[] s = lbtn.ID.ToString().Split('~');

            Response.Redirect(string.Format("PostItemFeedbacks.aspx?ItemId={0}&ItemName={1}", s[1], s[2]));
        }

    }
}