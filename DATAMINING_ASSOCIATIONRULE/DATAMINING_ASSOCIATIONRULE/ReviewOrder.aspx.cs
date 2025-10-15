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
    public partial class ReviewOrder : System.Web.UI.Page
    {
        Visitor obj = new Visitor();
        Member_Class obj1 = new Member_Class();
        
        // Add reference to the hidden field
        protected HiddenField hdnPaymentMethod;

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
                    if (Session["Cart"].ToString() == "1")
                    {
                        viewCart();
                    }
                    else
                    {
                        Response.Redirect("Member_Homepage.aspx");
                    }
                }
            }
            catch
            {

            }
        }

        private void viewCart()
        {
            PnlCTab.Visible = true;
            Table4.Rows.Clear();
            
            // Create modern table header
            TableHeaderRow headerRow = new TableHeaderRow();
            headerRow.CssClass = "table-header";
            
            string[] headers = { "Remove", "SubCategory", "Item ID", "Item Name", "Quantity", "Amount" };
            foreach (string header in headers)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = header;
                headerCell.CssClass = "header-cell";
                headerRow.Controls.Add(headerCell);
            }
            
            Table4.Controls.Add(headerRow);
            
            DataTable cart = new DataTable();
            cart = obj.GetCartDetails(Session["Customer_ID"].ToString());

            if (cart.Rows.Count > 0)
            {
                double TCost = 0;
                for (int i = 0; i < cart.Rows.Count; i++)
                {
                    TableRow dataRow = new TableRow();
                    dataRow.CssClass = "data-row";

                    // Checkbox cell
                    TableCell checkboxCell = new TableCell();
                    CheckBox cb = new CheckBox();
                    cb.AutoPostBack = true;
                    cb.ToolTip = "Click to remove item from cart";
                    cb.ID = cart.Rows[i]["Cart_ID"].ToString() + "_04" + i;
                    cb.Checked = true;
                    cb.CheckedChanged += new EventHandler(cb_CheckedChanged);
                    cb.CssClass = "item-checkbox";
                    checkboxCell.Controls.Add(cb);
                    dataRow.Controls.Add(checkboxCell);

                    // Get item details
                    DataTable Item = new DataTable();
                    Item = obj.GetItemDetails(int.Parse(cart.Rows[i]["Item_ID"].ToString()));
                    DataTable cat = new DataTable();
                    cat = obj.GetSubCategoryDetails(int.Parse(Item.Rows[0]["SubCategory_ID"].ToString()));

                    // SubCategory cell
                    TableCell subCatCell = new TableCell();
                    subCatCell.Text = cat.Rows[0]["SubCategory_Name"].ToString();
                    dataRow.Controls.Add(subCatCell);

                    // Item ID cell
                    TableCell itemIdCell = new TableCell();
                    Label lbl_ItemID = new Label();
                    lbl_ItemID.ID = "textmatrix" + i;
                    lbl_ItemID.Text = Item.Rows[0]["Item_ID"].ToString();
                    itemIdCell.Controls.Add(lbl_ItemID);
                    dataRow.Controls.Add(itemIdCell);

                    // Item Name cell
                    TableCell itemNameCell = new TableCell();
                    Label lbl_ItemName = new Label();
                    lbl_ItemName.ID = "textmatrix0" + i;
                    lbl_ItemName.Text = Item.Rows[0]["Item_Name"].ToString();
                    itemNameCell.Controls.Add(lbl_ItemName);
                    dataRow.Controls.Add(itemNameCell);

                    // Quantity cell
                    TableCell quantityCell = new TableCell();
                    Label lbl_Quantity = new Label();
                    lbl_Quantity.ID = "textmatrix1" + i;
                    lbl_Quantity.Text = cart.Rows[i]["Quantity"].ToString();
                    quantityCell.Controls.Add(lbl_Quantity);
                    dataRow.Controls.Add(quantityCell);

                    // Amount cell
                    TableCell amountCell = new TableCell();
                    double total = int.Parse(cart.Rows[i]["Quantity"].ToString()) * double.Parse(Item.Rows[0]["Item_Cost"].ToString());
                    amountCell.Text = "₹" + total.ToString("F2");
                    dataRow.Controls.Add(amountCell);
                    
                    TCost += total;
                    Table4.Controls.Add(dataRow);
                }

                // Add total section with modern styling
                AddTotalSection(TCost);
                
                // Ensure Label5 has the total amount for JavaScript access
                Label5.Text = TCost.ToString("F2");
            }
            else
            {
                // Show empty cart message
                TableRow emptyRow = new TableRow();
                TableCell emptyCell = new TableCell();
                emptyCell.ColumnSpan = 6;
                emptyCell.CssClass = "empty-cart";
                emptyCell.Text = "Your shopping cart is empty";
                emptyRow.Controls.Add(emptyCell);
                Table4.Controls.Add(emptyRow);
                
                Session["Cart"] = "0";
                BtnPay.Visible = false;
            }
        }

        private void AddTotalSection(double TCost)
        {
            // Shipping cost row
            TableRow shippingRow = new TableRow();
            
            TableCell shippingLabelCell = new TableCell();
            shippingLabelCell.ColumnSpan = 5;
            shippingLabelCell.Text = "<div class='total-section'><div class='total-row'><span>Shipping Cost</span>";
            shippingLabelCell.HorizontalAlign = HorizontalAlign.Right;
            
            TableCell shippingAmountCell = new TableCell();
            double Scost;
            DataTable tab_mem = obj.GetCustomerDetails(Session["Customer_ID"].ToString());
            if (tab_mem.Rows[0]["Country"].ToString().ToLower() == "india")
                Scost = 50.00;
            else
                Scost = 500.00;
                
            TCost += Scost;
            shippingAmountCell.Text = "<span>₹" + Scost.ToString("F2") + "</span></div>";
            
            shippingRow.Controls.Add(shippingLabelCell);
            shippingRow.Controls.Add(shippingAmountCell);
            Table4.Controls.Add(shippingRow);

            // Total row
            TableRow totalRow = new TableRow();
            
            TableCell totalLabelCell = new TableCell();
            totalLabelCell.ColumnSpan = 5;
            totalLabelCell.Text = "<div class='total-row total-final'><span>Total Amount</span>";
            totalLabelCell.HorizontalAlign = HorizontalAlign.Right;
            
            TableCell totalAmountCell = new TableCell();
            totalAmountCell.Text = "<span>₹" + TCost.ToString("F2") + "</span></div></div>";
            
            totalRow.Controls.Add(totalLabelCell);
            totalRow.Controls.Add(totalAmountCell);
            Table4.Controls.Add(totalRow);

            // Set both labels with the total amount (without ₹ symbol for JavaScript)
            LblCost.Text = TCost.ToString("F2");
            Label5.Text = TCost.ToString("F2");
            
            // Also store in ViewState for accessibility
            ViewState["TotalAmount"] = TCost.ToString("F2");
        }

        void cb_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chbx = (CheckBox)sender;
            string[] id = chbx.ID.ToString().Split('_');
            if (chbx.Checked == false)
            {
                obj.DeleteCartDetails(int.Parse(id[0]));
            }
            viewCart();
        }

        int h = 0;

        protected void BtnPay_Click(object sender, EventArgs e)
        {
            try
            {
                // Check if this is a postback from online payment confirmation
                string eventArgument = Request.Form["__EVENTARGUMENT"];
                bool isOnlinePayment = eventArgument == "online_payment_confirmed";
                
                // Get selected payment method from hidden field or client-side
                string paymentMethod = Request.Form[hdnPaymentMethod.UniqueID] ?? GetSelectedPaymentMethod();
                
                // Debug logging
                System.Diagnostics.Debug.WriteLine($"Payment Method: {paymentMethod}");
                System.Diagnostics.Debug.WriteLine($"Event Argument: {eventArgument}");
                System.Diagnostics.Debug.WriteLine($"Is Online Payment: {isOnlinePayment}");
                
                if (string.IsNullOrEmpty(paymentMethod) && !isOnlinePayment)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "PaymentError", 
                        "<script>alert('Please select a payment method');</script>");
                    return;
                }

                int q = 0;
                obj1.NewCustomerTransaction(Session["Customer_ID"].ToString(), DateTime.Now);
                int transactionID = int.Parse(obj1.GetTransactionID().ToString());
                
                // Process cart items
                DataTable cart = obj.GetCartDetails(Session["Customer_ID"].ToString());
                if (cart.Rows.Count > 0)
                {
                    for (int i = 0; i < cart.Rows.Count; i++)
                    {
                        Label l1 = (Label)Table4.FindControl("textmatrix" + i);
                        Label l2 = (Label)Table4.FindControl("textmatrix1" + i);
                        
                        if (l1 != null && l2 != null)
                        {
                            obj1.NewTransactionDetails(transactionID, int.Parse(l1.Text.ToString()), int.Parse(l2.Text.ToString()));
                            
                            // Update item quantity
                            DataTable tabitemdetails = new DataTable();
                            tabitemdetails = obj1.GetItemDetails(int.Parse(l1.Text.ToString()));
                            int itemquantity = int.Parse(tabitemdetails.Rows[0]["Quantity"].ToString());
                            int remaining = itemquantity - int.Parse(l2.Text.ToString());
                            obj1.UpdateItemQuantity(remaining, int.Parse(l1.Text.ToString()));
                        }
                    }
                }

                // Store payment method in database (you might want to add this to your transaction table)
                string paymentStatus = isOnlinePayment ? "Paid Online (UPI)" : 
                                     paymentMethod == "cod" ? "Cash on Delivery" : 
                                     paymentMethod == "cod_upi" ? "UPI on Delivery" : "Pending";

                // Success message based on payment method
                string successMessage = "";
                if (isOnlinePayment)
                {
                    successMessage = "Payment successful! Your order has been placed and confirmed.";
                }
                else if (paymentMethod == "cod")
                {
                    successMessage = "Order placed successfully! You will pay cash on delivery.";
                }
                else if (paymentMethod == "cod_upi")
                {
                    successMessage = "Order placed successfully! You will pay via UPI on delivery.";
                }

                ClientScript.RegisterStartupScript(this.GetType(), "Success", 
                    "<script>alert('" + successMessage + "'); window.location='Member_Homepage.aspx';</script>");
                
                // Clear cart
                obj.DeleteCartDetails(Session["Customer_ID"].ToString());
                
                // Update UI
                Table4.Rows.Clear();
                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.CssClass = "empty-cart";
                cell.Text = "Order placed successfully! Your cart is now empty.";
                cell.HorizontalAlign = HorizontalAlign.Center;
                row.Controls.Add(cell);
                Table4.Controls.Add(row);
                BtnPay.Visible = false;
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Error", 
                    "<script>alert('Error processing order: " + ex.Message + "');</script>");
            }
        }

        private string GetSelectedPaymentMethod()
        {
            // This would typically come from a hidden field or form data
            // For now, we'll check the form data
            string paymentMethod = Request.Form["paymentMethod"];
            return paymentMethod;
        }
    }
}