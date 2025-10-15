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
    public partial class Member_Homepage : System.Web.UI.Page
    {
        Visitor obj1 = new Visitor();
        DataTable tab = new DataTable();
        TableCell[] c;
        int z = 0;
        Member_Class memObj = new Member_Class();
        Admin_Class obj = new Admin_Class();
        DataTable tab1 = new DataTable();
        DataTable tab2 = new DataTable();
        Dictionary<string, double> DictionaryAllFrequentItems = new Dictionary<string, double>();

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
                    try
                    {
                        GetAllItems();
                    }
                    catch
                    {

                    }
                }
            }
            catch
            {

            }
        }

        private void GetAllItems()
        {
            Table5.Rows.Clear();
            //first for loop           
            if (ListBox2.Items.Count > 0)
            {
                foreach (ListItem item in ListBox2.Items)
                {
                    string[] rule = item.Text.Split('>');

                    if (rule[0].Contains(','))
                    {
                        TableHeaderRow mainrow = new TableHeaderRow();
                        TableHeaderCell maincell = new TableHeaderCell();

                        Label lbl_rulex = new Label();
                        lbl_rulex.Text = "RULE X";
                        maincell.Controls.Add(lbl_rulex);
                        mainrow.Controls.Add(maincell);
                        Table5.Controls.Add(mainrow);

                        DataTable tab2 = new DataTable();
                        tab2.Rows.Clear();

                        string[] s = rule[0].Split(',');

                        int count = 0;
                        c = new TableCell[s.Length];
                        TableRow row = new TableRow();

                        //for loop to display items in rule X
                        for (int k = 0; k < s.Length; k++)
                        {
                            tab2 = obj1.GetItemDetails_ItemName(s[k].ToString());

                            c[count] = new TableCell();

                            Table t = new Table();
                            t.Width = 250;
                            TableCell c1 = new TableCell();
                            c1.ColumnSpan = 3;
                            c1.Height = 30;
                            c1.Text = "<b><font color='#006699' size='2px'>" + tab2.Rows[0]["Item_Name"].ToString() + "</font></b>";
                            TableRow R1 = new TableRow();
                            R1.Controls.Add(c1);
                            t.Controls.Add(R1);
                            TableCell c2 = new TableCell();

                            c2.RowSpan = 3;
                            c2.Width = 70;
                            c2.Text = "<img src='" + tab2.Rows[0]["Item_Image"].ToString() + "' width=75px height=100px border=0 />";
                            TableCell c3 = new TableCell();
                            c3.HorizontalAlign = HorizontalAlign.Left;
                            c3.ColumnSpan = 2;

                            c3.Text = "<b><font color='#993366' size='2px'> Rs. " + tab2.Rows[0]["Item_Cost"].ToString() + " /- </font></b>";
                            ImageButton imgA = new ImageButton();
                            imgA.ImageUrl = "../images/cart.gif";

                            imgA.ToolTip = "Click to add the Item into the cart";
                            imgA.ID = tab2.Rows[0]["Item_ID"].ToString() + "_" + z;
                            imgA.Click += new ImageClickEventHandler(imgA_Click);
                            TableCell txt = new TableCell();
                            txt.HorizontalAlign = HorizontalAlign.Left;
                            int totalquantity = 0;
                            //totalquantity = obj.ItemSaledQuantity(int.Parse(tab.Rows[k + cnt]["Item_ID"].ToString()));

                            totalquantity = int.Parse(tab2.Rows[0]["Quantity"].ToString());

                            LinkButton li = new LinkButton();
                            if (totalquantity > 0)
                            {
                                li.Enabled = true;
                                imgA.Enabled = true;
                            }
                            else
                            {
                                li.Enabled = false;
                                imgA.Enabled = false;
                            }

                            ++z;

                            li.Font.Underline = false;
                            li.Text = "<font size='2px'>Add To Cart</font>";
                            li.ToolTip = "Click here to add to Cart";
                            li.ID = tab2.Rows[0]["Item_ID"].ToString() + "_" + z;
                            li.Click += new EventHandler(li_Click);
                            txt.Controls.Add(li);

                            TableCell cartimg = new TableCell();
                            cartimg.Width = 25;
                            cartimg.HorizontalAlign = HorizontalAlign.Left;
                            cartimg.Controls.Add(imgA);

                            ++z;

                            LinkButton l = new LinkButton();
                            l.Font.Underline = false;
                            l.Text = "<font size='1px' color='#006699'>More Details</font>";
                            l.ToolTip = "Click here to view the details";
                            l.Font.Underline = true;
                            l.ID = tab2.Rows[0]["Item_ID"].ToString() + "_" + z;
                            l.Click += new EventHandler(l_Click);
                            TableCell c5 = new TableCell();
                            c5.ColumnSpan = 2;
                            //c5.Width = 100;
                            c5.HorizontalAlign = HorizontalAlign.Left;
                            c5.Controls.Add(l);
                            TableRow R2 = new TableRow();
                            R2.Controls.Add(c2);
                            R2.Controls.Add(c3);
                            TableRow R3 = new TableRow();
                            R3.Controls.Add(cartimg);
                            R3.Controls.Add(txt);
                            TableRow R4 = new TableRow();

                            R4.Controls.Add(c5);

                            t.Controls.Add(R2);
                            t.Controls.Add(R3);
                            t.Controls.Add(R4);
                            c[count].Controls.Add(t);

                            row.Controls.Add(c[count]);

                            count++;

                            ++z;
                        }

                        Table5.Controls.Add(row);
                    }
                    //rule x with out ,
                    else
                    {
                        TableHeaderRow mainrow = new TableHeaderRow();
                        TableHeaderCell maincell = new TableHeaderCell();

                        Label lbl_rulex = new Label();
                        lbl_rulex.Text = "RULE X";
                        maincell.Controls.Add(lbl_rulex);
                        mainrow.Controls.Add(maincell);
                        Table5.Controls.Add(mainrow);


                        DataTable tab1 = new DataTable();
                        tab1.Rows.Clear();

                        tab1 = obj1.GetItemDetails_ItemName(rule[0]);

                        Table t = new Table();
                        t.Width = 250;
                        TableCell c1 = new TableCell();
                        c1.ColumnSpan = 3;
                        c1.Height = 30;
                        c1.Text = "<b><font color='#006699' size='2px'>" + tab1.Rows[0]["Item_Name"].ToString() + "</font></b>";
                        TableRow R1 = new TableRow();
                        R1.Controls.Add(c1);
                        t.Controls.Add(R1);
                        TableCell c2 = new TableCell();

                        c2.RowSpan = 3;
                        c2.Width = 70;
                        c2.Text = "<img src='" + tab1.Rows[0]["Item_Image"].ToString() + "' width=75px height=100px border=0 />";
                        TableCell c3 = new TableCell();
                        c3.HorizontalAlign = HorizontalAlign.Left;
                        c3.ColumnSpan = 2;

                        c3.Text = "<b><font color='#993366' size='2px'> Rs. " + tab1.Rows[0]["Item_Cost"].ToString() + " /- </font></b>";
                        ImageButton imgA = new ImageButton();
                        imgA.ImageUrl = "../images/cart.gif";

                        imgA.ToolTip = "Click to add the Item into the cart";
                        imgA.ID = tab1.Rows[0]["Item_ID"].ToString() + "_" + z;
                        imgA.Click += new ImageClickEventHandler(imgA_Click);
                        TableCell txt = new TableCell();
                        txt.HorizontalAlign = HorizontalAlign.Left;
                        int totalquantity = 0;

                        totalquantity = int.Parse(tab1.Rows[0]["Quantity"].ToString());

                        LinkButton li = new LinkButton();
                        if (totalquantity > 0)
                        {
                            li.Enabled = true;
                            imgA.Enabled = true;
                        }
                        else
                        {
                            li.Enabled = false;
                            imgA.Enabled = false;
                        }

                        ++z;

                        li.Font.Underline = false;
                        li.Text = "<font size='2px'>Add To Cart</font>";
                        li.ToolTip = "Click here to add to Cart";
                        li.ID = tab1.Rows[0]["Item_ID"].ToString() + "_" + z;
                        li.Click += new EventHandler(li_Click);
                        txt.Controls.Add(li);

                        TableCell cartimg = new TableCell();
                        cartimg.Width = 25;
                        cartimg.HorizontalAlign = HorizontalAlign.Left;
                        cartimg.Controls.Add(imgA);

                        ++z;

                        LinkButton l = new LinkButton();
                        l.Font.Underline = false;
                        l.Text = "<font size='1px' color='#006699'>More Details</font>";
                        l.ToolTip = "Click here to view the details";
                        l.Font.Underline = true;
                        l.ID = tab1.Rows[0]["Item_ID"].ToString() + "_" + z;
                        l.Click += new EventHandler(l_Click);
                        TableCell c5 = new TableCell();
                        c5.ColumnSpan = 2;
                        c5.HorizontalAlign = HorizontalAlign.Left;
                        c5.Controls.Add(l);
                        TableRow R2 = new TableRow();
                        R2.Controls.Add(c2);
                        R2.Controls.Add(c3);
                        TableRow R3 = new TableRow();
                        R3.Controls.Add(cartimg);
                        R3.Controls.Add(txt);
                        TableRow R4 = new TableRow();

                        R4.Controls.Add(c5);

                        t.Controls.Add(R2);
                        t.Controls.Add(R3);
                        t.Controls.Add(R4);

                        TableRow row = new TableRow();
                        TableCell cell0 = new TableCell();
                        cell0.Controls.Add(t);
                        row.Controls.Add(cell0);
                        Table5.Controls.Add(row);

                        ++z;
                    }

                    //check for rule y with ,
                    if (rule[1].Contains(','))
                    {
                        TableHeaderRow mainrow = new TableHeaderRow();
                        TableHeaderCell maincell = new TableHeaderCell();

                        Label lbl_ruley = new Label();
                        lbl_ruley.Text = "RULE Y";
                        maincell.Controls.Add(lbl_ruley);
                        mainrow.Controls.Add(maincell);
                        Table5.Controls.Add(mainrow);


                        DataTable tab3 = new DataTable();
                        tab3.Rows.Clear();

                        string[] s = rule[1].Split(',');

                        int count = 0;
                        c = new TableCell[s.Length];
                        TableRow row = new TableRow();

                        //for loop to display the items

                        for (int k = 0; k < s.Length; k++)
                        {
                            tab3 = obj1.GetItemDetails_ItemName(s[k].ToString());

                            c[count] = new TableCell();

                            Table t = new Table();
                            t.Width = 250;
                            TableCell c1 = new TableCell();
                            c1.ColumnSpan = 3;
                            c1.Height = 30;
                            c1.Text = "<b><font color='#006699' size='2px'>" + tab3.Rows[0]["Item_Name"].ToString() + "</font></b>";
                            TableRow R1 = new TableRow();
                            R1.Controls.Add(c1);
                            t.Controls.Add(R1);
                            TableCell c2 = new TableCell();

                            c2.RowSpan = 3;
                            c2.Width = 70;
                            c2.Text = "<img src='" + tab3.Rows[0]["Item_Image"].ToString() + "' width=75px height=100px border=0 />";
                            TableCell c3 = new TableCell();
                            c3.HorizontalAlign = HorizontalAlign.Left;
                            c3.ColumnSpan = 2;

                            c3.Text = "<b><font color='#993366' size='2px'> Rs. " + tab3.Rows[0]["Item_Cost"].ToString() + " /- </font></b>";
                            ImageButton imgA = new ImageButton();
                            imgA.ImageUrl = "../images/cart.gif";

                            imgA.ToolTip = "Click to add the Item into the cart";
                            imgA.ID = tab3.Rows[0]["Item_ID"].ToString() + "_" + z;
                            imgA.Click += new ImageClickEventHandler(imgA_Click);
                            TableCell txt = new TableCell();
                            txt.HorizontalAlign = HorizontalAlign.Left;
                            int totalquantity = 0;
                            //totalquantity = obj.ItemSaledQuantity(int.Parse(tab.Rows[k + cnt]["Item_ID"].ToString()));

                            totalquantity = int.Parse(tab3.Rows[0]["Quantity"].ToString());

                            LinkButton li = new LinkButton();
                            if (totalquantity > 0)
                            {
                                li.Enabled = true;
                                imgA.Enabled = true;
                            }
                            else
                            {
                                li.Enabled = false;
                                imgA.Enabled = false;
                            }

                            ++z;

                            li.Font.Underline = false;
                            li.Text = "<font size='2px'>Add To Cart</font>";
                            li.ToolTip = "Click here to add to Cart";
                            li.ID = tab3.Rows[0]["Item_ID"].ToString() + "_" + z;
                            li.Click += new EventHandler(li_Click);
                            txt.Controls.Add(li);

                            TableCell cartimg = new TableCell();
                            cartimg.Width = 25;
                            cartimg.HorizontalAlign = HorizontalAlign.Left;
                            cartimg.Controls.Add(imgA);

                            ++z;

                            LinkButton l = new LinkButton();
                            l.Font.Underline = false;
                            l.Text = "<font size='1px' color='#006699'>More Details</font>";
                            l.ToolTip = "Click here to view the details";
                            l.Font.Underline = true;
                            l.ID = tab3.Rows[0]["Item_ID"].ToString() + "_" + z;
                            l.Click += new EventHandler(l_Click);
                            TableCell c5 = new TableCell();
                            c5.ColumnSpan = 2;
                            //c5.Width = 100;
                            c5.HorizontalAlign = HorizontalAlign.Left;
                            c5.Controls.Add(l);
                            TableRow R2 = new TableRow();
                            R2.Controls.Add(c2);
                            R2.Controls.Add(c3);
                            TableRow R3 = new TableRow();
                            R3.Controls.Add(cartimg);
                            R3.Controls.Add(txt);
                            TableRow R4 = new TableRow();

                            R4.Controls.Add(c5);

                            t.Controls.Add(R2);
                            t.Controls.Add(R3);
                            t.Controls.Add(R4);

                            c[count].Controls.Add(t);

                            row.Controls.Add(c[count]);

                            count++;

                            ++z;
                        }

                        Table5.Controls.Add(row);

                        TableCell cell = new TableCell();
                        cell.ColumnSpan = 8;
                        cell.Text = "<br/><br/>------------------------------------------------------------------------------------------------------------------------<br/>";
                        TableRow row1 = new TableRow();
                        row1.Controls.Add(cell);
                        Table5.Controls.Add(row1);
                    }

                    //rule y without ,
                    else
                    {
                        TableHeaderRow mainrow = new TableHeaderRow();
                        TableHeaderCell maincell = new TableHeaderCell();

                        Label lbl_ruley = new Label();
                        lbl_ruley.Text = "RULE Y";
                        maincell.Controls.Add(lbl_ruley);
                        mainrow.Controls.Add(maincell);
                        Table5.Controls.Add(mainrow);


                        DataTable tab4 = new DataTable();
                        tab4.Rows.Clear();

                        tab4 = obj1.GetItemDetails_ItemName(rule[1]);

                        Table t = new Table();
                        t.Width = 250;
                        TableCell c1 = new TableCell();
                        c1.ColumnSpan = 3;
                        c1.Height = 30;
                        c1.Text = "<b><font color='#006699' size='2px'>" + tab4.Rows[0]["Item_Name"].ToString() + "</font></b>";
                        TableRow R1 = new TableRow();
                        R1.Controls.Add(c1);
                        t.Controls.Add(R1);
                        TableCell c2 = new TableCell();

                        c2.RowSpan = 3;
                        c2.Width = 70;
                        c2.Text = "<img src='" + tab4.Rows[0]["Item_Image"].ToString() + "' width=75px height=100px border=0 />";
                        TableCell c3 = new TableCell();
                        c3.HorizontalAlign = HorizontalAlign.Left;
                        c3.ColumnSpan = 2;

                        c3.Text = "<b><font color='#993366' size='2px'> Rs. " + tab4.Rows[0]["Item_Cost"].ToString() + " /- </font></b>";
                        ImageButton imgA = new ImageButton();
                        imgA.ImageUrl = "../images/cart.gif";

                        imgA.ToolTip = "Click to add the Item into the cart";
                        imgA.ID = tab4.Rows[0]["Item_ID"].ToString() + "_" + z;
                        imgA.Click += new ImageClickEventHandler(imgA_Click);
                        TableCell txt = new TableCell();
                        txt.HorizontalAlign = HorizontalAlign.Left;
                        int totalquantity = 0;
                        //totalquantity = obj.ItemSaledQuantity(int.Parse(tab.Rows[k + cnt]["Item_ID"].ToString()));

                        totalquantity = int.Parse(tab4.Rows[0]["Quantity"].ToString());

                        LinkButton li = new LinkButton();
                        if (totalquantity > 0)
                        {
                            li.Enabled = true;
                            imgA.Enabled = true;
                        }
                        else
                        {
                            li.Enabled = false;
                            imgA.Enabled = false;
                        }

                        ++z;

                        li.Font.Underline = false;
                        li.Text = "<font size='2px'>Add To Cart</font>";
                        li.ToolTip = "Click here to add to Cart";
                        li.ID = tab4.Rows[0]["Item_ID"].ToString() + "_" + z;
                        li.Click += new EventHandler(li_Click);
                        txt.Controls.Add(li);

                        TableCell cartimg = new TableCell();
                        cartimg.Width = 25;
                        cartimg.HorizontalAlign = HorizontalAlign.Left;
                        cartimg.Controls.Add(imgA);

                        ++z;

                        LinkButton l = new LinkButton();
                        l.Font.Underline = false;
                        l.Text = "<font size='1px' color='#006699'>More Details</font>";
                        l.ToolTip = "Click here to view the details";
                        l.Font.Underline = true;
                        l.ID = tab4.Rows[0]["Item_ID"].ToString() + "_" + z;
                        l.Click += new EventHandler(l_Click);
                        TableCell c5 = new TableCell();
                        c5.ColumnSpan = 2;
                        //c5.Width = 100;
                        c5.HorizontalAlign = HorizontalAlign.Left;
                        c5.Controls.Add(l);
                        TableRow R2 = new TableRow();
                        R2.Controls.Add(c2);
                        R2.Controls.Add(c3);
                        TableRow R3 = new TableRow();
                        R3.Controls.Add(cartimg);
                        R3.Controls.Add(txt);
                        TableRow R4 = new TableRow();

                        R4.Controls.Add(c5);

                        t.Controls.Add(R2);
                        t.Controls.Add(R3);
                        t.Controls.Add(R4);

                        TableRow row = new TableRow();
                        //row.Controls.Add(c[0]);
                        //row.Controls.Add(c[1]);
                        //row.Controls.Add(c[2]);
                        TableCell cell0 = new TableCell();
                        cell0.Controls.Add(t);
                        row.Controls.Add(cell0);
                        Table5.Controls.Add(row);

                        TableCell cell = new TableCell();
                        cell.ColumnSpan = 8;
                        cell.Text = "<br/><br/>------------------------------------------------------------------------------------------------------------------------<br/>";
                        TableRow row1 = new TableRow();
                        row1.Controls.Add(cell);
                        Table5.Controls.Add(row1);

                        ++z;
                    }

                }
            }
        }

        void li_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Or = (LinkButton)sender;
                string[] id = Or.ID.ToString().Split('_');
                Session["Item_ID"] = id[0];
                if (obj1.CountItem(int.Parse(id[0]), Session["Customer_ID"].ToString()))
                {
                    if (obj1.AddCartDetails(Session["Customer_ID"].ToString(), int.Parse(id[0]), 1))
                    {
                        Response.Redirect("MemberCart.aspx");
                    }
                }
                else
                    Response.Redirect("MemberCart.aspx");
            }
            catch
            {

            }
        }

        void imgA_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton Or = (ImageButton)sender;
                string[] id = Or.ID.ToString().Split('_');
                Session["Item_ID"] = id[0];
                if (obj1.CountItem(int.Parse(id[0]), Session["Customer_ID"].ToString()))
                {
                    if (obj1.AddCartDetails(Session["Customer_ID"].ToString(), int.Parse(id[0]), 1))
                    {
                        Response.Redirect("MemberCart.aspx");
                    }
                }
                else
                    Response.Redirect("MemberCart.aspx");
            }
            catch
            {

            }
        }

        void l_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton link = (LinkButton)sender;
                string[] id = link.ID.ToString().Split('_');
                Session["Item_ID"] = id[0];
                Response.Redirect("MemberViewDetails.aspx");
            }
            catch
            {

            }
        }

        #region -- Algorithm Steps ---

        private void GetDistinctTransactions()
        {
            tab2.Rows.Clear();

            DataTable tabCustomer = new DataTable();
            tabCustomer = obj.GetCustomerDetails(Session["Customer_ID"].ToString());

            int totalCount = 900;
            DateTime currentDate;
            currentDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            DateTime startDate;
            startDate = currentDate.AddDays(-totalCount);

            DateTime endDate;
            endDate = currentDate.AddDays(1);

            if (DropDownList1.SelectedIndex == 0)
            {
                tab2 = memObj.GetTransactionsByDate(startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 1)
            {
                tab2 = memObj.GetTransactionsByGender(tabCustomer.Rows[0]["Gender"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                string currentyear;
                currentyear = DateTime.Now.ToShortDateString();

                string[] s = currentyear.Split('/');

                int maxage = int.Parse(s[2].ToString()) - int.Parse(tabCustomer.Rows[0]["DateOfBirth"].ToString()) + 3;
                int minage = int.Parse(s[2].ToString()) - int.Parse(tabCustomer.Rows[0]["DateOfBirth"].ToString()) - 3;

                int minyear = int.Parse(s[2].ToString()) - minage;
                int maxyear = int.Parse(s[2].ToString()) - maxage;

                tab2 = memObj.GetTransactionsByDOB(maxyear.ToString(), minyear.ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                tab2 = memObj.GetTransactionsByMartialStatus(tabCustomer.Rows[0]["MartialStatus"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 4)
            {
                tab2 = memObj.GetTransactionsByEducation(tabCustomer.Rows[0]["Education"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 5)
            {
                tab2 = memObj.GetTransactionsByOccupation(tabCustomer.Rows[0]["Occupation"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 6)
            {
                tab2 = memObj.GetTransactionsByIncome(tabCustomer.Rows[0]["Income"].ToString(), startDate, endDate);
            }

            if (tab2.Rows.Count > 0)
            {
                Table2.Rows.Clear();
                lv_Transactions.Items.Clear();

                Table2.GridLines = GridLines.Both;

                TableHeaderRow mainrow2 = new TableHeaderRow();
                mainrow2.ForeColor = System.Drawing.Color.SteelBlue;
                mainrow2.BackColor = System.Drawing.Color.AliceBlue;

                TableHeaderCell cell2 = new TableHeaderCell();
                cell2.Text = "Transaction Dataset";
                mainrow2.Controls.Add(cell2);

                Table2.Controls.Add(mainrow2);

                for (int i = 0; i < tab2.Rows.Count; i++)
                {
                    string constraints = null;

                    TableRow row2 = new TableRow();

                    TableCell cell_transaction = new TableCell();
                    cell_transaction.HorizontalAlign = HorizontalAlign.Left;
                    DataTable tab4 = new DataTable();
                    tab4.Rows.Clear();
                    tab4 = obj.GetTransactionDetails_ID(int.Parse(tab2.Rows[i]["Transaction_ID"].ToString()));

                    for (int k = 0; k < tab4.Rows.Count; k++)
                    {
                        DataTable tab5 = new DataTable();
                        tab5 = obj.GetItemDetails(int.Parse(tab4.Rows[k]["Item_ID"].ToString()));


                        constraints += tab5.Rows[0]["Item_Name"].ToString() + ",";
                    }

                    cell_transaction.Text = constraints.Substring(0, constraints.Length - 1).ToString();

                    row2.Controls.Add(cell_transaction);
                    Table2.Controls.Add(row2);

                    lv_Transactions.Items.Add(cell_transaction.Text.ToString());
                }

            }
            else
            {
                Table2.Rows.Clear();
                Table2.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.ColumnSpan = 5;
                cell.Text = "No Transactions Found";
                row.Controls.Add(cell);

                Table2.Controls.Add(row);

            }
        }

        private void GetDistinctItems()
        {
            tab1.Rows.Clear();

            DataTable tabCustomer = new DataTable();
            tabCustomer = obj.GetCustomerDetails(Session["Customer_ID"].ToString());

            int totalCount = 900;
            DateTime currentDate;
            currentDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());

            DateTime startDate;
            startDate = currentDate.AddDays(-totalCount);

            DateTime endDate;
            endDate = currentDate.AddDays(1);

            if (DropDownList1.SelectedIndex == 0)
            {
                tab1 = memObj.GetDistinctItemsByDate(startDate, endDate);
            }
            
            else if (DropDownList1.SelectedIndex == 1)
            {
                tab1 = memObj.GetDistinctItemsByGender(tabCustomer.Rows[0]["Gender"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 2)
            {
                string currentyear;
                currentyear = DateTime.Now.ToShortDateString();

                string[] s = currentyear.Split('/');

                int maxage = int.Parse(s[2].ToString()) - int.Parse(tabCustomer.Rows[0]["DateOfBirth"].ToString()) + 3;
                int minage = int.Parse(s[2].ToString()) - int.Parse(tabCustomer.Rows[0]["DateOfBirth"].ToString()) - 3;

                int minyear = int.Parse(s[2].ToString()) - minage;
                int maxyear = int.Parse(s[2].ToString()) - maxage;

                tab1 = memObj.GetDistinctItemsByDOB(maxyear.ToString(), minyear.ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 3)
            {
                tab1 = memObj.GetDistinctItemsByMartialStatus(tabCustomer.Rows[0]["MartialStatus"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 4)
            {
                tab1 = memObj.GetDistinctItemsByEducation(tabCustomer.Rows[0]["Education"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 5)
            {
                tab1 = memObj.GetDistinctItemsByOccupation(tabCustomer.Rows[0]["Occupation"].ToString(), startDate, endDate);
            }
            else if (DropDownList1.SelectedIndex == 6)
            {
                tab1 = memObj.GetDistinctItemsByIncome(tabCustomer.Rows[0]["Income"].ToString(), startDate, endDate);
            }

            if (tab1.Rows.Count > 0)
            {
                Table1.Rows.Clear();
                lv_Items.Items.Clear();

                Table1.GridLines = GridLines.Both;

                TableHeaderRow mainrow1 = new TableHeaderRow();
                mainrow1.ForeColor = System.Drawing.Color.SteelBlue;
                mainrow1.BackColor = System.Drawing.Color.AliceBlue;

                TableHeaderCell cell1 = new TableHeaderCell();
                cell1.Text = "Item Set";
                mainrow1.Controls.Add(cell1);

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

                    Table1.Controls.Add(row);

                    lv_Items.Items.Add(tab3.Rows[0]["Item_Name"].ToString());
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

        private void Solve()
        {
            double MinSupport = 0.1;
            double MinConfidence = 0.5;
            ////Scan the transaction database to get the support S of each 1-itemset,
            Dictionary<string, double> DictionaryFrequentItemsList1 = GetList1FrequentItems(MinSupport);
            Dictionary<string, double> DictionaryFrequentItemsMain = DictionaryFrequentItemsList1;
            Dictionary<string, double> DictionaryCandidates = new Dictionary<string, double>();
            do
            {
                DictionaryCandidates = GenerateCandidates(DictionaryFrequentItemsMain);
                DictionaryFrequentItemsMain = GetFrequentItems(DictionaryCandidates, MinSupport);
            }
            while (DictionaryCandidates.Count != 0);
            //MessageBox.Show("Hello");
            List<ClassRules> RulesList = GenerateRules();
            List<ClassRules> StrongRules = GetStrongRules(MinConfidence, RulesList);
            Result(DictionaryAllFrequentItems, StrongRules);
            //SolutionObject.ShowDialog();
        }

        //FUNCTION TO GET THE FIRST LIST OF FREQUENT ITEMS OCCURING IN THE SET OF TRANSACTIONS
        private Dictionary<string, double> GetList1FrequentItems(double MinSupport)
        {
            Dictionary<string, double> DictionaryFrequentItemsReturn = new Dictionary<string, double>();
            for (int i = 0; i < lv_Items.Items.Count; i++)
            {
                double Support = GetSupport(lv_Items.Items[i].Text.ToString());
                if ((Support / (double)(lv_Transactions.Items.Count) >= MinSupport))
                {
                    DictionaryFrequentItemsReturn.Add(lv_Items.Items[i].Text.ToString(), Support);

                    DictionaryAllFrequentItems.Add(lv_Items.Items[i].Text.ToString(), Support);
                }
            }
            return DictionaryFrequentItemsReturn;
        }

        //FUNCTION GETS THE SUPPORT FOR EACH INDIVIDUAL ITEMS IN SET OF TRANSACTIONS
        private double GetSupport(string GeneratedCandidate)
        {
            double SupportReturn = 0;

            string[] AllTransactions = new string[lv_Transactions.Items.Count];
            for (int i = 0; i < lv_Transactions.Items.Count; i++)
            {
                AllTransactions[i] = lv_Transactions.Items[i].Text.ToString();
            }
            foreach (string Transaction in AllTransactions)
            {
                if (IsSubstring(GeneratedCandidate, Transaction))
                {
                    SupportReturn++;
                }
            }

            return SupportReturn;
        }

        //FUNCTION TO CHECK IF THE ITEM EXISTS IN A GIVEN TRANSACTION
        private bool IsSubstring(string Child, string Parent)
        {
            string[] TransactionArray = Child.Split(',');
            //string value = null;
            foreach (string Item in TransactionArray)
            {
                if (!Parent.Contains(Item))
                    return false;
            }
            return true;
        }

        //FUNCTION TO GENERATE CANDIDATES FROM THE FREQUENT ITEM LIST
        //GET THE FIRST ITEM - ADD THE NEXT ITEM - SORT ITEMS
        //GET THE CANDIDATES EXCLUDING THE SIMILAR ITEMS
        //GET SUPPORT AND ADD TO DICTIONARY

        private Dictionary<string, double> GenerateCandidates(Dictionary<string, double> MainFrequentItems)
        {
            Dictionary<string, double> DictionaryCandidatesReturn = new Dictionary<string, double>();
            for (int i = 0; i < MainFrequentItems.Count - 1; i++)
            {
                string[] FirstItem = Alphabetize(MainFrequentItems.Keys.ElementAt(i));
                string FirstItemString = null;
                for (int k = 0; k < FirstItem.Length; k++)
                {
                    FirstItemString += FirstItem[k].ToString() + ",";
                }
                FirstItemString = FirstItemString.Remove(FirstItemString.Length - 1);
                for (int j = i + 1; j < MainFrequentItems.Count; j++)
                {
                    string[] SecondItem = Alphabetize(MainFrequentItems.Keys.ElementAt(j));
                    string SecondItemString = null;
                    for (int l = 0; l < SecondItem.Length; l++)
                    {
                        SecondItemString += SecondItem[l].ToString() + ",";
                    }
                    SecondItemString = SecondItemString.Remove(SecondItemString.Length - 1);
                    string GeneratedCandidate = GetCandidate(FirstItemString, SecondItemString);
                    //MessageBox.Show("A " + GeneratedCandidate);
                    //string GeneratedCandidate = GetCandidate("Brush,Lace,Socks,Shoe", "Brush,Lace,Socks,Polish");
                    if (GeneratedCandidate != string.Empty)
                    {
                        string[] CandidateArray = Alphabetize(GeneratedCandidate);
                        GeneratedCandidate = "";
                        for (int m = 0; m < CandidateArray.Length; m++)
                        {
                            GeneratedCandidate += CandidateArray[m].ToString() + ",";
                        }

                        GeneratedCandidate = GeneratedCandidate.Remove(GeneratedCandidate.Length - 1);
                        double Support = GetSupport(GeneratedCandidate);
                        DictionaryCandidatesReturn.Add(GeneratedCandidate, Support);
                    }
                }
            }
            return DictionaryCandidatesReturn;
        }

        //FUNCTION TO SORT THE GIVEN ITEMS IN ALPHABETICAL ORDER
        private string[] Alphabetize(string Token)
        {
            // Convert to char array, then sort and return
            string[] TokenArray = Token.Split(',');
            Array.Sort(TokenArray);
            return TokenArray;
        }

        //FUNCTION TO GET CANDIDATE EXCLUDING THE SIMILAR ITEMS.
        private string GetCandidate(string FirstItemString, string SecondItemString)
        {
            string CandidateJoin = null;
            if (FirstItemString.Contains(',') || SecondItemString.Contains(','))
            {
                string[] First = FirstItemString.Split(',');
                string[] Second = SecondItemString.Split(',');
                if (First[0] != Second[0])
                {
                    return string.Empty;
                }
                else
                {
                    string firstString = FirstItemString.Substring(0, FirstItemString.LastIndexOf(','));
                    string secondString = SecondItemString.Substring(0, SecondItemString.LastIndexOf(','));
                    if (firstString == secondString)
                    {
                        return FirstItemString + SecondItemString.Substring(SecondItemString.LastIndexOf(','));
                    }
                    else
                    {
                        return string.Empty;
                    }
                }
                ////int i=0;
                ////int x = 0;
                ////for ( i = 0; i < First.Length; i++)
                ////{
                ////    if (Second.Length > i)
                ////    {
                ////        if (First[i] == Second[i])
                ////        {
                ////            CandidateJoin = CandidateJoin + "," + First[i];
                ////            x = i;
                ////        }
                ////    }
                ////}

                ////for (i=x+1; i < First.Length; i++)
                ////{
                ////    CandidateJoin = CandidateJoin + "," + First[i];
                ////}
                ////for (x=x+1; x < Second.Length; x++)
                ////{
                ////    CandidateJoin = CandidateJoin + "," + Second[x];
                ////}
                ////return CandidateJoin.Substring(1);


                //string FirstSubString = FirstItemString.Substring(0, FirstItemString.IndexOf(','));
                //string SecondSubString = SecondItemString.Substring(0, SecondItemString.IndexOf(','));
                //if (FirstSubString == SecondSubString)
                //{
                //    return FirstItemString + SecondItemString.Substring(SecondItemString.IndexOf(','));
                //}
                //else
                //    return string.Empty;
            }
            else
            {
                return FirstItemString + "," + SecondItemString;
            }
        }

        //FUNCTION TO GET FREQUENT ITEMS THROUGH GIVEN SUPPORT
        private Dictionary<string, double> GetFrequentItems(Dictionary<string, double> CandidatesDictionary, double MinimumSupport)
        {
            Dictionary<string, double> FrequentReturn = new Dictionary<string, double>();
            for (int i = CandidatesDictionary.Count - 1; i >= 0; i--)
            {
                string Item = CandidatesDictionary.Keys.ElementAt(i);
                double Support = CandidatesDictionary[Item];
                if ((Support / (double)(lv_Transactions.Items.Count) >= MinimumSupport))
                {
                    FrequentReturn.Add(Item, Support);
                    DictionaryAllFrequentItems.Add(Item, Support);
                }
            }
            return FrequentReturn;
        }

        //FUNCTION TO GENERATE RULES
        private List<ClassRules> GenerateRules()
        {
            List<ClassRules> RulesReturnList = new List<ClassRules>();
            foreach (string Item in DictionaryAllFrequentItems.Keys)
            {
                string[] ItemArray = Item.Split(',');
                if (ItemArray.Length > 1)
                {
                    int MaxCombinationLength = ItemArray.Length / 2;
                    GenerateCombination(Item, MaxCombinationLength, ref RulesReturnList);
                }
            }
            return RulesReturnList;
        }

        private void GenerateCombination(string Item, int CombinationLength, ref List<ClassRules> RulesReturnList)
        {
            string[] ItemArray = Item.Split(',');
            int ItemLength = ItemArray.Length;
            if (ItemLength == 2)
            {
                AddItem(ItemArray[0].ToString(), Item, ref RulesReturnList);
                return;
            }
            else if (ItemLength == 3)
            {
                for (int i = 0; i < ItemLength; i++)
                {
                    AddItem(ItemArray[i].ToString(), Item, ref RulesReturnList);
                }
                return;
            }
            else
            {
                for (int i = 0; i < ItemLength; i++)
                {
                    GetCombinationRecursive(ItemArray[i].ToString(), Item, CombinationLength, ref RulesReturnList);
                }
            }
        }

        private void AddItem(string Combination, string Item, ref List<ClassRules> RulesReturnList)
        {
            string Remaining = GetRemaining(Combination, Item);
            ClassRules Rule = new ClassRules(Combination, Remaining, 0);
            RulesReturnList.Add(Rule);
        }

        private string GetCombinationRecursive(string Combination, string Item, int CombinationLength, ref List<ClassRules> RulesReturnList)
        {
            AddItem(Combination, Item, ref RulesReturnList);
            string LastTokenItem = Combination;
            if (Combination.Contains(','))
                LastTokenItem = Combination.Substring(Combination.LastIndexOf(',') + 1);

            string NextItem = null; ;
            string LastItem = Item.Substring(Item.LastIndexOf(',') + 1);
            if (Combination.Split(',').Length == CombinationLength)
            {
                if (LastTokenItem != LastItem)
                {
                    string TempCombination = null;
                    foreach (string str in Combination.Split(','))
                    {
                        if (str != LastTokenItem)
                        {
                            TempCombination = TempCombination + "," + str;
                        }
                    }
                    Combination = TempCombination.Substring(1);
                    string[] strs = Item.Split(',');
                    for (int i = 0; i < strs.Length; i++)
                    {
                        if (strs[i] == LastTokenItem)
                        {
                            NextItem = strs[i + 1];
                        }
                    }
                    //Combination = Combination.Remove(nLastTokenCharcaterIndex, 1);
                    //NextItem = Item[nLastTokenCharcaterIndexInParent + 1];
                    string strNewToken = Combination + "," + NextItem;
                    return (GetCombinationRecursive(strNewToken, Item, CombinationLength, ref RulesReturnList));
                }
                else
                {
                    return string.Empty;
                }
            }
            else
            {
                if (Combination != LastItem.ToString())
                {
                    string[] strs = Item.Split(',');
                    for (int i = 0; i < strs.Length; i++)
                    {
                        if (strs[i] == LastTokenItem)
                        {
                            NextItem = strs[i + 1];
                        }
                    }
                    //NextItem = Item[nLastTokenCharcaterIndexInParent + 1];
                    string strNewToken = Combination + "," + NextItem;
                    return (GetCombinationRecursive(strNewToken, Item, CombinationLength, ref RulesReturnList));
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        private string GetRemaining(string Child, string Parent)
        {
            string[] childArray = Child.Split(',');
            for (int i = 0; i < childArray.Length; i++)
            {
                string Remaining = null;
                string[] ParentArray = Parent.Split(',');
                for (int j = 0; j < ParentArray.Length; j++)
                {
                    if (childArray[i] != ParentArray[j])
                    {
                        Remaining = Remaining + "," + ParentArray[j];
                    }
                }
                if (Remaining.Contains(','))
                    Parent = Remaining.Substring(1);
                else
                    Parent = Remaining;
            }
            return Parent;
        }

        private List<ClassRules> GetStrongRules(double MinConfidence, List<ClassRules> RulesList)
        {
            List<ClassRules> StrongRulesReturn = new List<ClassRules>();
            foreach (ClassRules Rule in RulesList)
            {
                string[] XY = Alphabetize(Rule.X + "," + Rule.Y);
                string XYString = null;
                for (int i = 0; i < XY.Length; i++)
                {
                    XYString += XY[i] + ",";
                }
                XYString = XYString.Remove(XYString.Length - 1);
                AddStrongRule(Rule, XYString, ref StrongRulesReturn, MinConfidence);
            }
            StrongRulesReturn.Sort();
            return StrongRulesReturn;
        }

        private void AddStrongRule(ClassRules Rule, string XY, ref List<ClassRules> StrongRulesReturn, double MinConfidence)
        {
            double Confidence = GetConfidence(Rule.X, XY);
            ClassRules NewRule;
            if (Confidence >= MinConfidence)
            {
                NewRule = new ClassRules(Rule.X, Rule.Y, Confidence);
                StrongRulesReturn.Add(NewRule);
            }
            Confidence = GetConfidence(Rule.Y, XY);
            if (Confidence >= MinConfidence)
            {
                NewRule = new ClassRules(Rule.Y, Rule.X, Confidence);
                StrongRulesReturn.Add(NewRule);
            }
        }

        private double GetConfidence(string X, string XY)
        {
            double Support_X, Support_XY;
            Support_X = DictionaryAllFrequentItems[X];
            Support_XY = DictionaryAllFrequentItems[XY];
            return Support_XY / Support_X;
        }

        public void Result(Dictionary<string, double> AllFrequentItems, List<ClassRules> StrongRulesList)
        {
            LoadFrequentItems(AllFrequentItems);
            LoadRules(StrongRulesList);
        }

        private void LoadFrequentItems(Dictionary<string, double> AllFrequentItems)
        {
            Table3.Rows.Clear();

            Table3.GridLines = GridLines.Both;

            TableHeaderRow mainrow1 = new TableHeaderRow();
            mainrow1.ForeColor = System.Drawing.Color.SteelBlue;
            mainrow1.BackColor = System.Drawing.Color.AliceBlue;

            TableHeaderCell cell1 = new TableHeaderCell();
            cell1.Text = "Frequent ItemSet";
            mainrow1.Controls.Add(cell1);

            TableHeaderCell cell2 = new TableHeaderCell();
            cell2.Text = "SC";
            mainrow1.Controls.Add(cell2);

            Table3.Controls.Add(mainrow1);


            foreach (string Item in AllFrequentItems.Keys)
            {
                //ListViewItem LVItem = new ListViewItem(Item);
                //LVItem.SubItems.Add(AllFrequentItems[Item].ToString());
                //lv_Frequent.Items.Add(LVItem);

                ListItem items = new ListItem(Item);
                ListBox1.Items.Add(items);

                TableRow row = new TableRow();

                TableCell cell_item = new TableCell();
                cell_item.HorizontalAlign = HorizontalAlign.Left;
                cell_item.Width = 500;
                cell_item.Text = Item.ToString();
                row.Controls.Add(cell_item);

                TableCell cell_support = new TableCell();
                cell_support.HorizontalAlign = HorizontalAlign.Left;
                cell_support.Width = 100;
                cell_support.Text = AllFrequentItems[Item].ToString();
                row.Controls.Add(cell_support);

                Table3.Controls.Add(row);

            }
        }

        private void LoadRules(List<ClassRules> StrongRulesList)
        {
            Table4.Rows.Clear();
            Table4.GridLines = GridLines.Both;

            TableHeaderRow mainrow1 = new TableHeaderRow();
            mainrow1.ForeColor = System.Drawing.Color.SteelBlue;
            mainrow1.BackColor = System.Drawing.Color.AliceBlue;

            TableHeaderCell cell1 = new TableHeaderCell();
            cell1.Width = 450;
            cell1.Text = "LHS";
            mainrow1.Controls.Add(cell1);

            TableHeaderCell cell3 = new TableHeaderCell();
            cell3.Width = 100;
            cell3.Text = "->";
            mainrow1.Controls.Add(cell3);

            TableHeaderCell cell4 = new TableHeaderCell();
            cell4.Width = 450;
            cell4.Text = "RHS";
            mainrow1.Controls.Add(cell4);

            TableHeaderCell cell2 = new TableHeaderCell();
            cell2.Text = "Confidence";
            mainrow1.Controls.Add(cell2);

            Table4.Controls.Add(mainrow1);

            int i = 0;

            ListBox2.Items.Clear();

            if (StrongRulesList.Count > 0)
            {
                //Session["patterns"] = StrongRulesList;

                foreach (ClassRules Rule in StrongRulesList)
                {
                    ListItem items = new ListItem(Rule.X + ">" + Rule.Y);
                    ListBox2.Items.Add(items);

                    TableRow row = new TableRow();


                    TableCell cellX1 = new TableCell();

                    cellX1.Text = Rule.X;
                    row.Controls.Add(cellX1);


                    TableCell cell_rule2 = new TableCell();
                    //cell_rule2.HorizontalAlign = HorizontalAlign.Center;
                    cell_rule2.Width = 100;
                    cell_rule2.Text = "->";
                    row.Controls.Add(cell_rule2);


                    TableCell cellY1 = new TableCell();

                    cellY1.Text = Rule.Y;

                    row.Controls.Add(cellY1);


                    TableCell cell_confidence = new TableCell();
                    cell_confidence.HorizontalAlign = HorizontalAlign.Left;
                    cell_confidence.Width = 100;
                    cell_confidence.Text = String.Format("{0:0.00}", (Rule.Confidence * 100)) + "%";
                    row.Controls.Add(cell_confidence);

                    Table4.Controls.Add(row);
                    ++i;
                }
            }
            else
            {
                Table4.Rows.Clear();
                Table4.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.HorizontalAlign = HorizontalAlign.Center;
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.ColumnSpan = 5;
                cell.Text = "No Pattrens Found for the Input!!!";
                row.Controls.Add(cell);

                Table4.Controls.Add(row);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                GetDistinctItems();
                GetDistinctTransactions();

                Solve();

                GetAllItems();
            }
            catch
            {

            }

        }

        #endregion

    }
}
