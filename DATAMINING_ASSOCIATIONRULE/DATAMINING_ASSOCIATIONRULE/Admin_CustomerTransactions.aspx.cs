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
    public partial class Admin_CustomerTransactions : System.Web.UI.Page
    {
        Admin_Class obj = new Admin_Class();
        Visitor vobj = new Visitor();
        static DataTable tab_order = null;
        static int i = 0;
        static int j = 15;
        TableCell h4, Ch4, Ch5, h6, Ch6, h7, C24, Ch14, Ch15, C26, Ch16, C27, h8, C28, Ch17, Ch7, celldel;
        string tno = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Admin_ID"] == null)
                {
                    Session.Abandon();
                    Response.Redirect("Home_page.aspx");
                }
                else
                {
                    if (this.IsPostBack == false)
                    {
                        i = 0;
                        j = 15;
                        DDListO_Status.SelectedIndex = 0;
                    }

                    view_orderdetails();
                }
            }
            catch
            {

            }
        }

        protected void DDListO_Status_SelectedIndexChanged(object sender, EventArgs e)
        {
            view_orderdetails();
        }

        private void view_orderdetails()
        {
            MultiView1.SetActiveView(View1);

            if (DDListO_Status.SelectedIndex == 0)
                view_All();
            else
                view_Status();
        }

        private void view_All()
        {
            TableOr.Rows.Clear();

            // Create modern header row
            TableCell h1 = new TableCell();
            h1.Text = "Transaction ID";
            h1.CssClass = "table-header transaction-id-header";

            TableCell h2 = new TableCell();
            h2.Text = "Customer Details";
            h2.CssClass = "table-header";

            TableCell h3 = new TableCell();
            h3.Text = "Transaction Date";
            h3.CssClass = "table-header";

            TableCell h4 = new TableCell();
            h4.Text = "Status";
            h4.CssClass = "table-header";

            TableRow headerRow = new TableRow();
            headerRow.CssClass = "table-header-row";
            headerRow.Controls.Add(h1);
            headerRow.Controls.Add(h2);
            headerRow.Controls.Add(h3);
            headerRow.Controls.Add(h4);

            TableOr.Controls.Add(headerRow);

            tab_order = obj.GetAllCustomerTransactions();

            if (tab_order.Rows.Count > 0)
            {
                for (int cnt = i; cnt < j; cnt++)
                {
                    if (cnt < tab_order.Rows.Count)
                    {
                        string msg;
                        PnlOrBtns.Visible = true;
                        if (j < tab_order.Rows.Count)
                        {
                            msg = string.Format("Showing {0} - {1} of {2} records", i + 1, j, tab_order.Rows.Count);
                        }
                        else
                        {
                            msg = string.Format("Showing {0} - {1} of {2} records", i + 1, tab_order.Rows.Count, tab_order.Rows.Count);
                        }
                        LblMsg_order.Text = msg;

                        TableCell C21 = new TableCell();
                        C21.Text = "#" + tab_order.Rows[cnt]["Transaction_ID"].ToString();
                        C21.CssClass = "transaction-id-cell";

                        TableCell C22 = new TableCell();
                        C22.CssClass = "customer-info";
                        DataTable tab = vobj.GetCustomerDetails(tab_order.Rows[cnt]["Email_ID"].ToString());
                        C22.Text = string.Format(
                            "<a href='#'>{0}<span>Name: {1}<br/>Address: {2}<br/>Country: {3}<br/>Phone: {4}</span></a>",
                            tab.Rows[0]["Email_ID"].ToString(),
                            tab.Rows[0]["Name"].ToString(),
                            tab.Rows[0]["Address"].ToString(),
                            tab.Rows[0]["Country"].ToString(),
                            tab.Rows[0]["ContactNo"].ToString()
                        );

                        TableCell C23 = new TableCell();
                        DateTime transDate = DateTime.Parse(tab_order.Rows[cnt]["Transaction_Date"].ToString());
                        C23.Text = transDate.ToString("MMM dd, yyyy");

                        TableCell C24 = new TableCell();
                        string status = tab_order.Rows[cnt]["Status"].ToString();

                        // Enhanced status display with icons and different colors
                        if (status.ToLower() == "pending")
                        {
                            C24.Text = string.Format("<span class='status-badge status-pending'><i class='status-icon'>⏳</i> {0}</span>", status);
                        }
                        else if (status.ToLower() == "dispatched")
                        {
                            C24.Text = string.Format("<span class='status-badge status-dispatched'><i class='status-icon'>🚚</i> {0}</span>", status);
                        }
                        else
                        {
                            C24.Text = string.Format("<span class='status-badge status-default'><i class='status-icon'>📋</i> {0}</span>", status);
                        }

                        TableRow dataRow = new TableRow();

                        // Apply different row styling based on status
                        if (status.ToLower() == "pending")
                        {
                            dataRow.CssClass = "table-row pending-row";
                        }
                        else if (status.ToLower() == "dispatched")
                        {
                            dataRow.CssClass = "table-row dispatched-row";
                        }
                        else
                        {
                            dataRow.CssClass = "table-row";
                        }

                        dataRow.Controls.Add(C21);
                        dataRow.Controls.Add(C22);
                        dataRow.Controls.Add(C23);
                        dataRow.Controls.Add(C24);

                        TableOr.Controls.Add(dataRow);
                    }
                }
            }
            else
            {
                PnlOrBtns.Visible = false;
                TableRow noDataRow = new TableRow();
                TableCell noDataCell = new TableCell();
                noDataCell.CssClass = "no-records";
                noDataCell.ColumnSpan = 4;
                noDataCell.Text = "No customer transactions found";
                noDataRow.Controls.Add(noDataCell);
                TableOr.Controls.Add(noDataRow);
            }
        }

        private void view_Status()
        {
            TableOr.Rows.Clear();

            // Create modern header row for status view
            TableCell h1 = new TableCell();
            h1.Text = "Transaction ID";
            h1.CssClass = "table-header transaction-id-header";

            TableCell h2 = new TableCell();
            h2.Text = "Customer Details";
            h2.CssClass = "table-header";

            TableCell h3 = new TableCell();
            h3.Text = "Transaction Date";
            h3.CssClass = "table-header";

            h4 = new TableCell();
            h4.Text = "Dispatched Date";
            h4.CssClass = "table-header";

            TableCell h5 = new TableCell();
            h5.Text = "Actions";
            h5.CssClass = "table-header";

            h6 = new TableCell();
            h6.Text = "Dispatch";
            h6.CssClass = "table-header";

            TableCell h7 = new TableCell();
            h7.Text = "Delete";
            h7.CssClass = "table-header";

            TableRow headerRow = new TableRow();
            headerRow.CssClass = "table-header-row";
            headerRow.Controls.Add(h1);
            headerRow.Controls.Add(h2);
            headerRow.Controls.Add(h3);
            headerRow.Controls.Add(h4);
            headerRow.Controls.Add(h5);
            headerRow.Controls.Add(h6);
            headerRow.Controls.Add(h7);

            TableOr.Controls.Add(headerRow);

            tab_order = obj.GetTransactionsBasedonStatus(DDListO_Status.SelectedValue.ToString());

            if (tab_order.Rows.Count > 0)
            {
                for (int cnt = i; cnt < j; cnt++)
                {
                    if (cnt < tab_order.Rows.Count)
                    {
                        string msg;
                        PnlOrBtns.Visible = true;
                        if (j < tab_order.Rows.Count)
                        {
                            msg = string.Format("Showing {0} - {1} of {2} records", i + 1, j, tab_order.Rows.Count);
                        }
                        else
                        {
                            msg = string.Format("Showing {0} - {1} of {2} records", i + 1, tab_order.Rows.Count, tab_order.Rows.Count);
                        }
                        LblMsg_order.Text = msg;

                        TableCell C21 = new TableCell();
                        C21.Text = "#" + tab_order.Rows[cnt]["Transaction_ID"].ToString();
                        C21.CssClass = "transaction-id-cell";

                        TableCell C22 = new TableCell();
                        C22.CssClass = "customer-info";
                        DataTable tab = vobj.GetCustomerDetails(tab_order.Rows[cnt]["Email_ID"].ToString());
                        C22.Text = string.Format(
                            "<a href='#'>{0}<span>Name: {1}<br/>Address: {2}<br/>Country: {3}<br/>Phone: {4}</span></a>",
                            tab.Rows[0]["Email_ID"].ToString(),
                            tab.Rows[0]["Name"].ToString(),
                            tab.Rows[0]["Address"].ToString(),
                            tab.Rows[0]["Country"].ToString(),
                            tab.Rows[0]["ContactNo"].ToString()
                        );

                        TableCell C23 = new TableCell();
                        DateTime transDate = DateTime.Parse(tab_order.Rows[cnt]["Transaction_Date"].ToString());
                        C23.Text = transDate.ToString("MMM dd, yyyy");

                        C24 = new TableCell();
                        string dispatchDate = tab_order.Rows[cnt]["Dispatched_Date"].ToString();
                        C24.Text = string.IsNullOrEmpty(dispatchDate) ? "-" : DateTime.Parse(dispatchDate).ToString("MMM dd, yyyy");

                        TableCell C25 = new TableCell();
                        Button view = new Button();
                        view.ToolTip = "View transaction details";
                        view.Text = "View Details";
                        view.CssClass = "modern-button btn-primary";
                        view.ID = tab_order.Rows[cnt]["Transaction_ID"].ToString() + "_00" + cnt;
                        view.Click += new EventHandler(view_Click);
                        C25.Controls.Add(view);

                        C26 = new TableCell();
                        if (DDListO_Status.SelectedValue.ToString() == "Pending")
                        {
                            Button dispatch = new Button();
                            dispatch.ToolTip = "Dispatch this order";
                            dispatch.Text = "Dispatch";
                            dispatch.CssClass = "modern-button btn-success";
                            dispatch.ID = tab_order.Rows[cnt]["Transaction_ID"].ToString() + "_01" + cnt;
                            dispatch.Click += new EventHandler(dispatch_Click);
                            C26.Controls.Add(dispatch);
                        }
                        else
                        {
                            C26.Text = "Dispatched";
                            C26.CssClass = "dispatched-label";
                        }

                        C27 = new TableCell();
                        Button delete = new Button();
                        delete.ToolTip = "Delete this transaction";
                        delete.Text = "Delete";
                        delete.CssClass = "modern-button btn-danger";
                        delete.ID = tab_order.Rows[cnt]["Transaction_ID"].ToString() + "_02" + cnt;
                        delete.Click += new EventHandler(delete_Click);
                        delete.Attributes.Add("onclick", "return confirm('Are you sure you want to delete this transaction?');");
                        C27.Controls.Add(delete);

                        TableRow dataRow = new TableRow();

                        // Apply different row styling based on status
                        string status = tab_order.Rows[cnt]["Status"].ToString();
                        if (status.ToLower() == "pending")
                        {
                            dataRow.CssClass = "table-row pending-row";
                        }
                        else if (status.ToLower() == "dispatched")
                        {
                            dataRow.CssClass = "table-row dispatched-row";
                        }
                        else
                        {
                            dataRow.CssClass = "table-row";
                        }

                        dataRow.Controls.Add(C21);
                        dataRow.Controls.Add(C22);
                        dataRow.Controls.Add(C23);
                        dataRow.Controls.Add(C24);
                        dataRow.Controls.Add(C25);
                        dataRow.Controls.Add(C26);
                        dataRow.Controls.Add(C27);

                        TableOr.Controls.Add(dataRow);
                    }
                }
            }
            else
            {
                PnlOrBtns.Visible = false;
                TableRow noDataRow = new TableRow();
                TableCell noDataCell = new TableCell();
                noDataCell.CssClass = "no-records";
                noDataCell.ColumnSpan = 7;
                noDataCell.Text = string.Format("No {0} transactions found", DDListO_Status.SelectedValue.ToString().ToLower());
                noDataRow.Controls.Add(noDataCell);
                TableOr.Controls.Add(noDataRow);
            }
        }

        // Add placeholder event handlers (implement these based on your business logic)
        protected void view_Click(object sender, EventArgs e)
        {
            // Implementation for viewing transaction details
        }

        protected void dispatch_Click(object sender, EventArgs e)
        {
            // Implementation for dispatching orders
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            // Implementation for deleting transactions
        }

        protected void LBtnOPrev_Click(object sender, EventArgs e)
        {
            // Implementation for previous page navigation
        }

        protected void LBtnNext_Click(object sender, EventArgs e)
        {
            // Implementation for next page navigation
        }

        protected void LBtn_Back_Click(object sender, EventArgs e)
        {
            // Implementation for back button
        }
    }
}