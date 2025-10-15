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
    public partial class TransactionDetails : System.Web.UI.Page
    {
        Member_Class obj = new Member_Class();
        DataTable tab = new DataTable();
        int value = 0;
        double TCost = 0;

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
                    value = int.Parse(Request.QueryString["value"].ToString());

                    //Label1.Text ="Transaction Date: " + Request.QueryString["Date"].ToString();

                    // GetTransactionDetails(value);
                    ViewTransactionDetails();
                }

            }
            catch
            {

            }
            

        }

        //private void GetTransactionDetails(int transactionID)
        //{
        //    tab.Rows.Clear();
        //    tab = obj.GetTransactionDetails(transactionID);

        //    if (tab.Rows.Count > 0)
        //    {
        //        Table1.Rows.Clear();
        //        Table1.GridLines = GridLines.Both;
        //        Table1.BorderStyle = BorderStyle.Double;

        //        TableHeaderRow mainrow = new TableHeaderRow();
        //        mainrow.ForeColor = System.Drawing.Color.SteelBlue;
        //        mainrow.BackColor = System.Drawing.Color.AliceBlue;
        //        mainrow.Height = 20;

        //        TableHeaderCell cell1 = new TableHeaderCell();
        //        cell1.Text = "SubCategory";
        //        mainrow.Controls.Add(cell1);

        //        TableHeaderCell cell2 = new TableHeaderCell();
        //        cell2.Text = "Item Name";
        //        mainrow.Controls.Add(cell2);

        //        TableHeaderCell cell3 = new TableHeaderCell();
        //        cell3.Text = "Quantity";
        //        mainrow.Controls.Add(cell3);

        //        TableHeaderCell cell4 = new TableHeaderCell();
        //        cell4.Text = "Total Cost";
        //        mainrow.Controls.Add(cell4);

        //        Table1.Controls.Add(mainrow);

        //        for (int i = 0; i < tab.Rows.Count; i++)
        //        {
        //            TableRow row = new TableRow();

        //            DataTable t1 = new DataTable();
        //            t1.Rows.Clear();
        //            t1 = obj.GetItemDetails(int.Parse(tab.Rows[i]["Item_ID"].ToString()));

        //            DataTable t2=new DataTable ();
        //            t2.Rows.Clear();
        //            t2=obj.GetSubCategoryDetails(int.Parse(t1.Rows[0]["SubCategory_ID"].ToString()));
                                        
        //            TableCell cell_subcategID = new TableCell();
        //            cell_subcategID.Width = 150;
        //            cell_subcategID.Text = t2.Rows[0]["SubCategory_Name"].ToString();
        //            row.Controls.Add(cell_subcategID);

        //            TableCell cell_ItemName = new TableCell();
        //            cell_ItemName.Width = 150;
        //            cell_ItemName.Text = t1.Rows[0]["Item_Name"].ToString();
        //            row.Controls.Add(cell_ItemName);

        //            TableCell cell_quantity = new TableCell();
        //            cell_quantity.Width = 150;
        //            cell_quantity.Text = tab.Rows[i]["Quantity"].ToString();
        //            row.Controls.Add(cell_quantity);

        //            TableCell cell_Cost = new TableCell();
        //            cell_Cost.Width = 150;
        //            double total = int.Parse(tab.Rows[i]["Quantity"].ToString()) * double.Parse(t1.Rows[0]["Item_Cost"].ToString());
        //            TCost += total;
        //            double Scost;
        //            DataTable tab_mem = obj.GetCustomerDetails(Session["Customer_ID"].ToString());
        //            if (tab_mem.Rows[0]["Country"].ToString().ToLower() == "india")
        //                Scost = 50.00;
        //            else
        //                Scost = 500.00;
        //            TCost += Scost;
                    
        //            cell_Cost.Text = TCost.ToString();
        //            row.Controls.Add(cell_Cost);
                                      

        //            Table1.Controls.Add(row);

        //        }

        //    }
        //    else
        //    {
        //        Table1.Rows.Clear();
        //        Table1.GridLines = GridLines.None;

        //        TableHeaderRow row = new TableHeaderRow();
        //        TableHeaderCell cell = new TableHeaderCell();
        //        cell.Font.Bold = true;
        //        cell.ForeColor = System.Drawing.Color.Red;
        //        cell.ColumnSpan = 5;
        //        cell.Text = "No Transactions Found";
        //        row.Controls.Add(cell);

        //        Table1.Controls.Add(row);
        //    }
        //}

        private void ViewTransactionDetails()
        {
            // PnlOF.Visible = false;
            PnlCTab.Visible = true;
            Table4.Rows.Clear();
            TableRow r1 = new TableRow();
            r1.Font.Size = 11;
            r1.Font.Bold = true;
            // r1.BackColor = System.Drawing.Color.RoyalBlue;
            Label l10 = new Label();
            l10.Text = "|";
            Label l11 = new Label();
            l11.Text = "|";
            Label l12 = new Label();
            l12.Text = "|";
            Label l13 = new Label();
            l13.Text = "|";
            Label l14 = new Label();
            l14.Text = "|";
            TableCell Ch0 = new TableCell();
            Ch0.Controls.Add(l10);
            TableCell Ch1 = new TableCell();
            Ch1.Controls.Add(l11);
            TableCell Ch2 = new TableCell();
            Ch2.Controls.Add(l12);
            TableCell Ch3 = new TableCell();
            Ch3.Controls.Add(l13);
            TableCell Ch4 = new TableCell();
            Ch4.Controls.Add(l14);

            TableCell h2 = new TableCell();
            h2.Width = 100;
            // h2.ForeColor = System.Drawing.Color.White;
            h2.Text = "SubCategory";
            TableCell h3 = new TableCell();
            h3.Width = 100;
            // h3.ForeColor = System.Drawing.Color.White;
            h3.Text = "Item_ID";

            TableCell h31 = new TableCell();
            h31.Width = 100;
            // h3.ForeColor = System.Drawing.Color.White;
            h31.Text = "Item_Name";

            TableCell h4 = new TableCell();
            h4.Width = 100;
            //  h4.ForeColor = System.Drawing.Color.White;
            h4.Text = "Quantity";
            TableCell h5 = new TableCell();
            h5.Width = 100;
            // h5.ForeColor = System.Drawing.Color.White;
            h5.Text = "Amount";

            r1.Controls.Add(Ch1);
            r1.Controls.Add(h2);
            r1.Controls.Add(Ch2);
            r1.Controls.Add(h3);
            r1.Controls.Add(Ch3);
            r1.Controls.Add(h31);
            r1.Controls.Add(Ch0);
            r1.Controls.Add(h4);
            r1.Controls.Add(Ch4);
            r1.Controls.Add(h5);
            Table4.Controls.Add(r1);
            TableCell Chr = new TableCell();
            Chr.ColumnSpan = 12;
            Chr.Text = "<hr/>";
            TableRow Rhr = new TableRow();
            Rhr.Controls.Add(Chr);
            Table4.Controls.Add(Rhr);
            DataTable cart = new DataTable();
            cart = obj.GetTransactionDetails(value);

            if (cart.Rows.Count > 0)
            {
                double TCost = 0;
                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    Label l20 = new Label();
                    l20.Text = "|";
                    Label l21 = new Label();
                    l21.Text = "|";
                    Label l22 = new Label();
                    l22.Text = "|";
                    Label l23 = new Label();
                    l23.Text = "|";
                    Label l24 = new Label();
                    l24.Text = "|";

                    TableCell Ch10 = new TableCell();
                    Ch10.Controls.Add(l20);
                    TableCell Ch11 = new TableCell();
                    Ch11.Controls.Add(l21);
                    TableCell Ch12 = new TableCell();
                    Ch12.Controls.Add(l22);
                    TableCell Ch13 = new TableCell();
                    Ch13.Controls.Add(l23);
                    TableCell Ch14 = new TableCell();
                    Ch14.Controls.Add(l24);

                    //CheckBox cb = new CheckBox();
                    //cb.AutoPostBack = true;
                    //cb.ToolTip = "click here to remove the book from the cart";
                    //cb.ID = cart.Rows[i]["Cart_ID"].ToString() + "_04" + i;
                    //cb.Checked = true;
                    //cb.CheckedChanged += new EventHandler(cb_CheckedChanged);
                    //TableCell c21 = new TableCell();
                    //c21.Controls.Add(cb);
                    DataTable Item = new DataTable();
                    Item = obj.GetItemDetails(int.Parse(cart.Rows[i]["Item_ID"].ToString()));
                    DataTable cat = new DataTable();
                    cat = obj.GetSubCategoryDetails(int.Parse(Item.Rows[0]["SubCategory_ID"].ToString()));
                    TableCell c22 = new TableCell();
                    c22.Text = cat.Rows[0]["SubCategory_Name"].ToString();
                    TableCell c23 = new TableCell();
                    Label lbl_ItemID = new Label();
                    lbl_ItemID.ID = "textmatrix" + i;
                    lbl_ItemID.Text = Item.Rows[0]["Item_ID"].ToString();
                    c23.Controls.Add(lbl_ItemID);
                    TableCell c203 = new TableCell();
                    Label lbl_ItemName = new Label();
                    lbl_ItemName.ID = "textmatrix0" + i;
                    lbl_ItemName.Text = Item.Rows[0]["Item_Name"].ToString();
                    c203.Controls.Add(lbl_ItemName);
                    TableCell c24 = new TableCell();
                    Label lbl_Quantity = new Label();
                    lbl_Quantity.ID = "textmatrix1" + i;
                    lbl_Quantity.Text = cart.Rows[i]["Quantity"].ToString();
                    c24.Controls.Add(lbl_Quantity);
                    TableCell c25 = new TableCell();
                    double total = int.Parse(cart.Rows[i]["Quantity"].ToString()) * double.Parse(Item.Rows[0]["Item_Cost"].ToString());
                    c25.Text = total.ToString();
                    TCost += total;
                    TableRow r2 = new TableRow();
                    //r2.Controls.Add(c21);
                    r2.Controls.Add(Ch11);
                    r2.Controls.Add(c22);
                    r2.Controls.Add(Ch12);
                    r2.Controls.Add(c23);
                    r2.Controls.Add(Ch13);

                    r2.Controls.Add(c203);
                    r2.Controls.Add(Ch10);

                    r2.Controls.Add(c24);
                    r2.Controls.Add(Ch14);
                    r2.Controls.Add(c25);
                    Table4.Controls.Add(r2);

                }
                TableCell c51 = new TableCell();
                c51.Text = "<hr>";
                c51.ColumnSpan = 11;
                TableRow r5 = new TableRow();
                r5.Controls.Add(c51);
                Table4.Controls.Add(r5);
                TableCell c31 = new TableCell();
                c31.ColumnSpan = 8;
                c31.HorizontalAlign = HorizontalAlign.Right;
                c31.Text = "<b>Shipping Cost</b>";
                double Scost;
                DataTable tab_mem = obj.GetCustomerDetails(Session["Customer_ID"].ToString());
                if (tab_mem.Rows[0]["Country"].ToString().ToLower() == "india")
                    Scost = 50.00;
                else
                    Scost = 500.00;
                TCost += Scost;
                TableCell C32 = new TableCell();
                C32.Text = "|";
                TableCell c33 = new TableCell();
                c33.Text = Scost.ToString();
                TableRow r3 = new TableRow();
                r3.Controls.Add(c31);
                r3.Controls.Add(C32);
                r3.Controls.Add(c33);
                Table4.Controls.Add(r3);
                LblCost.Text = TCost.ToString();
                TableCell c41 = new TableCell();
                c41.ColumnSpan = 8;
                c41.HorizontalAlign = HorizontalAlign.Right;
                c41.Text = "<b>Total</b>";
                TableCell C42 = new TableCell();
                C42.Text = "|";
                TableCell c43 = new TableCell();
                c43.Text = TCost.ToString();
                TableRow r4 = new TableRow();
                r4.Controls.Add(c41);
                r4.Controls.Add(C42);
                r4.Controls.Add(c43);
                Table4.Controls.Add(r4);

                CC.CurrencyConvertor obj1 = new DATAMINING_ASSOCIATIONRULE.CC.CurrencyConvertor();
                double d = obj1.ConversionRate(DATAMINING_ASSOCIATIONRULE.CC.Currency.INR, DATAMINING_ASSOCIATIONRULE.CC.Currency.USD);
                double Tdollar = TCost * d;
                Label5.Text = Tdollar.ToString();
            }
            else
            {
                //Session["Cart"] = "0";
                //Response.Redirect("ReviewOrder.aspx");
            }
        }

    }
}
