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
    public partial class MyTransactions : System.Web.UI.Page
    {
        Member_Class obj = new Member_Class();
        DataTable tab = new DataTable();
        static string status = "All";

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
                    if(!this.IsPostBack)
                    {
                        status = "All";
                        GetCustomerAllTransactions();
                    }
                    else if (status.Equals("All"))
                    {
                        GetCustomerAllTransactions();
                    }
                    else
                    {
                        GetCustomerTranBasedonStatus(status);
                    }
                }
            }
            catch
            {

            }
        }

        private void GetCustomerAllTransactions()
        {
            tab.Rows.Clear();
            tab = obj.GetCustomerTransactions(Session["Customer_ID"].ToString());

            if (tab.Rows.Count > 0)
            {
                Table1.Rows.Clear();
                Table1.GridLines = GridLines.Both;
                Table1.BorderStyle = BorderStyle.Double;

                TableHeaderRow mainrow = new TableHeaderRow();
                mainrow.BackColor = System.Drawing.Color.AliceBlue;
                mainrow.Height = 20;

                TableHeaderCell cell1 = new TableHeaderCell();
                cell1.Text = "ID";
                mainrow.Controls.Add(cell1);

                TableHeaderCell cell2 = new TableHeaderCell();
                cell2.Text = "Transaction Date";
                mainrow.Controls.Add(cell2);

                TableHeaderCell cell3 = new TableHeaderCell();
                cell3.Text = "Dispatched Date";
                mainrow.Controls.Add(cell3);

                TableHeaderCell cell4 = new TableHeaderCell();
                cell4.Text = "Status";
                mainrow.Controls.Add(cell4);

                Table1.Controls.Add(mainrow);

                for (int i = 0; i < tab.Rows.Count; i++)
                {
                    TableRow row = new TableRow();

                    TableCell cell_ID = new TableCell();
                    cell_ID.Width = 150;
                    cell_ID.Text = tab.Rows[i]["Transaction_ID"].ToString();
                    row.Controls.Add(cell_ID);

                    TableCell cell_transDate = new TableCell();
                    cell_transDate.Width = 200;
                    cell_transDate.Text = tab.Rows[i]["Transaction_Date"].ToString();
                    row.Controls.Add(cell_transDate);

                    TableCell cell_dispatchedDate = new TableCell();
                    cell_dispatchedDate.Width = 200;
                    cell_dispatchedDate.Text = tab.Rows[i]["Dispatched_Date"].ToString();
                    row.Controls.Add(cell_dispatchedDate);

                    TableCell cell_status = new TableCell();
                    cell_status.Width = 150;
                    cell_status.Text = tab.Rows[i]["Status"].ToString();
                    row.Controls.Add(cell_status);

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

        public void GetCustomerTranBasedonStatus(string status)
        {
            tab.Rows.Clear();
            tab = obj.GetCustomerTransactionsBasedonStatus(Session["Customer_ID"].ToString(),status);

            if (tab.Rows.Count > 0)
            {
                Table1.Rows.Clear();
                Table1.GridLines = GridLines.Both;
                Table1.BorderStyle = BorderStyle.Double;

                TableHeaderRow mainrow = new TableHeaderRow();
                mainrow.ForeColor = System.Drawing.Color.SteelBlue;
                mainrow.BackColor = System.Drawing.Color.AliceBlue;
                mainrow.Height = 20;

                TableHeaderCell cell1 = new TableHeaderCell();
                cell1.Text = "ID";
                mainrow.Controls.Add(cell1);

                TableHeaderCell cell2 = new TableHeaderCell();
                cell2.Text = "Transaction Date";
                mainrow.Controls.Add(cell2);

                TableHeaderCell cell3 = new TableHeaderCell();
                cell3.Text = "Dispatched Date";
                mainrow.Controls.Add(cell3);

                TableHeaderCell cell4 = new TableHeaderCell();
                cell4.Text = "Status";
                mainrow.Controls.Add(cell4);

                TableHeaderCell cell5 = new TableHeaderCell();
                cell5.Text = "Details";
                mainrow.Controls.Add(cell5);

                Table1.Controls.Add(mainrow);

                for (int i = 0; i < tab.Rows.Count; i++)
                {
                    TableRow row = new TableRow();

                    TableCell cell_ID = new TableCell();
                    cell_ID.Width = 150;
                    cell_ID.Text = tab.Rows[i]["Transaction_ID"].ToString();
                    row.Controls.Add(cell_ID);

                    TableCell cell_transDate = new TableCell();
                    cell_transDate.Width = 200;
                    cell_transDate.Text = tab.Rows[i]["Transaction_Date"].ToString();
                    row.Controls.Add(cell_transDate);

                    TableCell cell_dispatchedDate = new TableCell();
                    cell_dispatchedDate.Width = 200;
                    cell_dispatchedDate.Text = tab.Rows[i]["Dispatched_Date"].ToString();
                    row.Controls.Add(cell_dispatchedDate);

                    TableCell cell_status = new TableCell();
                    cell_status.Width = 150;
                    cell_status.Text = tab.Rows[i]["Status"].ToString();
                    row.Controls.Add(cell_status);

                    TableCell cell_Details = new TableCell();

                    Button btn_transactiondetails = new Button();
                    btn_transactiondetails.ID = "Transaction~" + tab.Rows[i]["Transaction_ID"].ToString();
                    btn_transactiondetails.Text = "View Details";
                    btn_transactiondetails.Click += new EventHandler(btn_transactiondetails_Click);
                    cell_Details.Controls.Add(btn_transactiondetails);
                    row.Controls.Add(cell_Details);

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

        void btn_transactiondetails_Click(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            Button btn = (Button)sender;
            string[] s = btn.ID.ToString().Split('~');
            Response.Redirect(string.Format("TransactionDetails.aspx?value={0}", s[1].ToString()));
        }
               
        protected void lbtn_pending_Click(object sender, EventArgs e)
        {
            try
            {
                status = "Pending";
                GetCustomerTranBasedonStatus(status);
            }
            catch
            {

            }
        }

        protected void lbtn_Dispatched_Click(object sender, EventArgs e)
        {
            try
            {
                status = "Dispatched";
                GetCustomerTranBasedonStatus(status);
            }
            catch
            {

            }
        }

        protected void lbtn_All_Click(object sender, EventArgs e)
        {
            try
            {
                status = "All";
                GetCustomerAllTransactions();
            }
            catch
            {

            }
        }


    }
}
