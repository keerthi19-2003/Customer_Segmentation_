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
    public partial class Admin_Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Admin_ID"] == null)
                {
                    Session.Abandon();
                    Response.Redirect("Home_page.aspx?value=a");
                }
                else
                {
                    Label1.Text = "<i class='fas fa-clock me-1'></i>Welcome " + Session["Admin_ID"].ToString() + " - Current Time: " + DateTime.Now.ToString();
                    GetAllCustomers();
                }
            }
            catch
            {

            }
        }

        private void GetAllCustomers()
        {
            DataTable tab = new DataTable();
            Admin_Class adminObj = new Admin_Class();

            tab.Rows.Clear();
            tab = adminObj.GetAllCustomers();

            if (tab.Rows.Count > 0)
            {
                Table1.Rows.Clear();

                // Create modern table header
                TableHeaderRow headerRow = new TableHeaderRow();
                headerRow.TableSection = TableRowSection.TableHeader;

                TableHeaderCell headerCell1 = new TableHeaderCell();
                headerCell1.Text = "Customer";
                headerRow.Controls.Add(headerCell1);

                TableHeaderCell headerCell2 = new TableHeaderCell();
                headerCell2.Text = "Country";
                headerRow.Controls.Add(headerCell2);

                TableHeaderCell headerCell3 = new TableHeaderCell();
                headerCell3.Text = "Date of Birth";
                headerRow.Controls.Add(headerCell3);

                TableHeaderCell headerCell4 = new TableHeaderCell();
                headerCell4.Text = "Contact";
                headerRow.Controls.Add(headerCell4);

                TableHeaderCell headerCell5 = new TableHeaderCell();
                headerCell5.Text = "Actions";
                headerRow.Controls.Add(headerCell5);

                Table1.Controls.Add(headerRow);

                // Add data rows
                for (int cnt = 0; cnt < tab.Rows.Count; cnt++)
                {
                    TableRow row = new TableRow();

                    // Customer info cell with avatar and details
                    TableCell cellCustomer = new TableCell();
                    string customerName = tab.Rows[cnt]["Name"].ToString();
                    string customerEmail = tab.Rows[cnt]["Email_ID"].ToString();
                    string customerAddress = tab.Rows[cnt]["Address"].ToString();
                    
                    // Get initials for avatar
                    string initials = "";
                    string[] nameParts = customerName.Split(' ');
                    foreach (string part in nameParts)
                    {
                        if (!string.IsNullOrEmpty(part))
                        {
                            initials += part[0].ToString().ToUpper();
                        }
                        if (initials.Length >= 2) break;
                    }
                    if (string.IsNullOrEmpty(initials))
                    {
                        initials = customerEmail.Length > 0 ? customerEmail[0].ToString().ToUpper() : "U";
                    }

                    cellCustomer.Text = string.Format(@"
                        <div class='customer-info'>
                            <div class='customer-avatar'>{0}</div>
                            <div class='customer-details'>
                                <div class='customer-name'>{1}</div>
                                <div class='customer-email'>{2}</div>
                                <div class='customer-address'>{3}</div>
                            </div>
                        </div>", 
                        initials, 
                        customerName, 
                        customerEmail,
                        !string.IsNullOrEmpty(customerAddress) ? customerAddress : "No address provided");
                    
                    row.Controls.Add(cellCustomer);

                    // Country cell (using Gender field as country for now based on your original code)
                    TableCell cellCountry = new TableCell();
                    cellCountry.Text = !string.IsNullOrEmpty(tab.Rows[cnt]["Gender"].ToString()) ? 
                                      tab.Rows[cnt]["Gender"].ToString() : "Not specified";
                    row.Controls.Add(cellCountry);

                    // Date of Birth cell
                    TableCell cellDOB = new TableCell();
                    DateTime dob;
                    if (DateTime.TryParse(tab.Rows[cnt]["DateOfBirth"].ToString(), out dob))
                    {
                        cellDOB.Text = dob.ToString("MMM dd, yyyy");
                    }
                    else
                    {
                        cellDOB.Text = tab.Rows[cnt]["DateOfBirth"].ToString();
                    }
                    row.Controls.Add(cellDOB);

                    // Contact cell
                    TableCell cellContact = new TableCell();
                    string contact = tab.Rows[cnt]["ContactNo"].ToString();
                    cellContact.Text = !string.IsNullOrEmpty(contact) ? contact : "No contact info";
                    row.Controls.Add(cellContact);

                    // Actions cell with modern delete button
                    TableCell cellActions = new TableCell();
                    Button btnDelete = new Button();
                    btnDelete.Text = "<i class='fas fa-trash me-1'></i>Delete";
                    btnDelete.ID = "btn_" + cnt.ToString();
                    btnDelete.CommandArgument = tab.Rows[cnt]["Email_ID"].ToString();
                    btnDelete.CssClass = "btn btn-modern btn-delete btn-sm";
                    btnDelete.OnClientClick = "return confirm('Are you sure you want to delete this customer?');";
                    btnDelete.Click += new EventHandler(btn_del_Click);
                    
                    cellActions.Controls.Add(btnDelete);
                    row.Controls.Add(cellActions);

                    Table1.Controls.Add(row);
                }

                // Add JavaScript to update stats after table is populated
                ClientScript.RegisterStartupScript(this.GetType(), "UpdateStats", 
                    "setTimeout(function() { if(typeof updateStats === 'function') updateStats(); }, 100);", true);
            }
            else
            {
                Table1.Rows.Clear();
                
                TableRow noDataRow = new TableRow();
                TableCell noDataCell = new TableCell();
                noDataCell.ColumnSpan = 5;
                noDataCell.CssClass = "no-data-container";
                noDataCell.Text = @"
                    <div class='no-data-icon'>
                        <i class='fas fa-users-slash'></i>
                    </div>
                    <h5>No Registered Users Found</h5>
                    <p class='text-muted'>There are no customers in the database yet.</p>";
                
                noDataRow.Controls.Add(noDataCell);
                Table1.Controls.Add(noDataRow);
            }
        }

        void btn_del_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            DataTable tab = new DataTable();
            Admin_Class adminObj = new Admin_Class();

            string emailId = btn.CommandArgument.ToString();

            tab.Rows.Clear();
            Member_Class memObj = new Member_Class();
            tab = memObj.GetCustomerTransactions(emailId);

            if (tab.Rows.Count > 0)
            {
                for (int i = 0; i < tab.Rows.Count; i++)
                {
                    DataTable tab1 = new DataTable();
                    tab1 = memObj.GetTransactionDetails(int.Parse(tab.Rows[i]["Transaction_Id"].ToString()));

                    for (int j = 0; j < tab1.Rows.Count; j++)
                    {
                        adminObj.DeleteTransactionDetails(int.Parse(tab1.Rows[j]["Details_ID"].ToString()));
                    }
                }

                adminObj.DeleteCustomerTransactions(emailId);
                adminObj.DeleteCustomer(emailId);

                // Modern success message
                ClientScript.RegisterStartupScript(this.GetType(), "DeleteSuccess", 
                    @"
                    setTimeout(function() {
                        const toast = document.createElement('div');
                        toast.className = 'alert alert-success alert-dismissible fade show position-fixed';
                        toast.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
                        toast.innerHTML = '<i class=\"fas fa-check-circle me-2\"></i>Customer deleted successfully!<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>';
                        document.body.appendChild(toast);
                        setTimeout(() => { if(toast.parentElement) toast.remove(); }, 3000);
                    }, 100);
                    ", true);

                GetAllCustomers();
            }
            else
            {
                adminObj.DeleteCustomer(emailId);

                // Modern success message
                ClientScript.RegisterStartupScript(this.GetType(), "DeleteSuccess", 
                    @"
                    setTimeout(function() {
                        const toast = document.createElement('div');
                        toast.className = 'alert alert-success alert-dismissible fade show position-fixed';
                        toast.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px;';
                        toast.innerHTML = '<i class=\"fas fa-check-circle me-2\"></i>Customer deleted successfully!<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\"></button>';
                        document.body.appendChild(toast);
                        setTimeout(() => { if(toast.parentElement) toast.remove(); }, 3000);
                    }, 100);
                    ", true);

                GetAllCustomers();
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Label1.Text = "<i class='fas fa-clock me-1'></i>Welcome " + Session["Admin_ID"].ToString() + " - Current Time: " + DateTime.Now.ToString();
        }
    }
}