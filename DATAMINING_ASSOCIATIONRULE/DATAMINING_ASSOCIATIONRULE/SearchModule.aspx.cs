using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class SearchModule : System.Web.UI.Page
    {
        DataTable tab = new DataTable();
        Visitor obj = new Visitor();
        Member_Class obj1 = new Member_Class();
        static int incrementbyOne = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)

                TextBox1.Focus();

            LoadItemssbasedonKeywords();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            LoadItemssbasedonKeywords();
        }

        //function to display items based on the keywords
        private void LoadItemssbasedonKeywords()
        {
            try
            {
                DataTable tabItems = new DataTable();
                tabItems = obj.GetAllItems();

                if (tabItems.Rows.Count > 0)
                {
                    Table1.Rows.Clear();
                    Table1.Controls.Clear();
                    Table1.GridLines = GridLines.Both;

                    TableHeaderRow main_row = new TableHeaderRow();

                    TableHeaderCell cell1 = new TableHeaderCell();
                    cell1.Text = "Image";
                    main_row.Controls.Add(cell1);

                    TableHeaderCell cell2 = new TableHeaderCell();
                    cell2.Text = "Item";
                    main_row.Controls.Add(cell2);

                    TableHeaderCell cell3 = new TableHeaderCell();
                    cell3.Text = "Item Details";
                    main_row.Controls.Add(cell3);

                    TableHeaderCell cell4 = new TableHeaderCell();
                    cell4.Text = "Cost";
                    main_row.Controls.Add(cell4);

                    TableHeaderCell cell5 = new TableHeaderCell();
                    cell5.Text = "Quantity";
                    main_row.Controls.Add(cell5);

                    TableHeaderCell cell8 = new TableHeaderCell();
                    cell8.Text = "Cart";
                    main_row.Controls.Add(cell8);

                    Table1.Controls.Add(main_row);

                    for (int h = 0; h < tabItems.Rows.Count; h++)
                    {
                        DataTable tabI = new DataTable();
                        tabI = obj.GetItemDetails(int.Parse(tabItems.Rows[h]["Item_ID"].ToString()));

                        string[] s = tabItems.Rows[h]["Keywords"].ToString().Split(',');

                        if (s.Contains(TextBox1.Text, StringComparer.InvariantCultureIgnoreCase))
                        {
                            TableRow row = new TableRow();

                            TableCell cell_img = new TableCell();
                            Image img = new Image();
                            img.Height = 50;
                            img.Width = 50;
                            img.ImageUrl = tabI.Rows[0]["Item_Image"].ToString();
                            cell_img.Controls.Add(img);
                            row.Controls.Add(cell_img);

                            TableCell cell_name = new TableCell();
                            cell_name.Width = 100;
                            cell_name.Text = "<a href='#'>" + tabI.Rows[0]["Item_Name"].ToString() + "<span>Keywords : " + tabI.Rows[0]["Keywords"].ToString() + ".</br>Other : " + tabI.Rows[0]["OtherDetails"].ToString() + "</span></a>";
                            row.Controls.Add(cell_name);

                            TableCell cell_details = new TableCell();
                            cell_details.Width = 250;
                            cell_details.Text = tabI.Rows[0]["Item_Details"].ToString();
                            row.Controls.Add(cell_details);

                            TableCell cell_cost = new TableCell();
                            cell_cost.Width = 100;
                            cell_cost.Text = tabI.Rows[0]["Item_Cost"].ToString();
                            row.Controls.Add(cell_cost);

                            TableCell cell_quantity = new TableCell();
                            cell_quantity.Width = 100;
                            cell_quantity.Text = tabI.Rows[0]["Quantity"].ToString();
                            row.Controls.Add(cell_quantity);

                            TableCell cellCart = new TableCell();
                            ImageButton btnCart = new ImageButton();
                            btnCart.ID = "ItemCart~" + tabI.Rows[0]["Item_ID"].ToString() + "~" + incrementbyOne;
                            btnCart.Width = 25;
                            btnCart.Height = 25;
                            btnCart.ImageUrl = "~/images/cart6.jpg";
                            btnCart.Click += new ImageClickEventHandler(btnCart_Click);
                            cellCart.Controls.Add(btnCart);
                            row.Controls.Add(cellCart);

                            Table1.Controls.Add(row);
                        }
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
                    cell.Text = "No Matching Items Found";
                    row.Controls.Add(cell);

                    Table1.Controls.Add(row);
                }

                if (Table1.Rows.Count == 1)
                {
                    Table1.Rows.Clear();
                    Table1.BorderStyle = BorderStyle.None;
                    Table1.GridLines = GridLines.None;

                    TableRow row = new TableRow();

                    TableCell cell = new TableCell();
                    cell.ColumnSpan = 10;
                    cell.ForeColor = System.Drawing.Color.Red;
                    cell.Font.Size = 10;
                    cell.Text = "<b>No Matching Items Found</b>";
                    cell.HorizontalAlign = HorizontalAlign.Center;
                    row.Controls.Add(cell);
                    Table1.Controls.Add(row);
                }

            }
            catch
            {
                Table1.Rows.Clear();
                Table1.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.ColumnSpan = 5;
                cell.Text = "No Items Found";
                row.Controls.Add(cell);

                Table1.Controls.Add(row);
            }
        }

        void btnCart_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton Or = (ImageButton)sender;
            string[] id = Or.ID.Split('~');

            Session["Item_ID"] = id[1];

            if (obj.CountItem(int.Parse(id[1]), Session["Visitor"].ToString()))
            {
                if (obj.AddCartDetails(Session["Visitor"].ToString(), int.Parse(id[1]), 1))
                {
                    Response.Redirect("CartDetails.aspx");
                }
            }
            else
                Response.Redirect("CartDetails.aspx");
        }

    }
}