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
    public partial class MemberCart : System.Web.UI.Page
    {
        DataTable tab = null;
        Visitor obj = new Visitor();
        static string status = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Customer_ID"] == null)
                {
                    Panelca2.Visible = false;
                }
                else
                {
                    ViewCartDetails();
                }
            }
            catch
            {
                // Log error in production
            }
        }

        private void ViewCartDetails()
        {
            Label1.Visible = false;
            Table1.Rows.Clear();

            tab = obj.GetCartDetails(Session["Customer_ID"].ToString());
            if (tab.Rows.Count > 0)
            {
                Panelca2.Visible = true;
                
                // Create header row with modern styling
                CreateHeaderRow();
                
                double TCost = 0;
                for (int i = 0; i < tab.Rows.Count; i++)
                {
                    DataTable book = obj.GetItemDetails(int.Parse(tab.Rows[i]["Item_ID"].ToString()));
                    
                    // Create product row
                    TableRow productRow = CreateProductRow(book, tab.Rows[i], i, ref TCost);
                    Table1.Controls.Add(productRow);
                }
                
                // Create total row
                CreateTotalRow(TCost);
            }
            else
            {
                Panelca2.Visible = false;
                Table1.Rows.Clear();
                Label1.Text = ""; // Text will be handled by CSS
                Label1.Visible = true;
            }
        }

        private void CreateHeaderRow()
        {
            TableRow headerRow = new TableRow();
            headerRow.CssClass = "cart-header-row";

            // Product Image
            TableCell headerImage = new TableCell();
            headerImage.Text = "<i class='fas fa-image'></i>";
            headerImage.CssClass = "cart-header-cell";
            headerRow.Controls.Add(headerImage);

            // Product Name
            TableCell headerName = new TableCell();
            headerName.Text = "Product";
            headerName.CssClass = "cart-header-cell";
            headerRow.Controls.Add(headerName);

            // Price
            TableCell headerPrice = new TableCell();
            headerPrice.Text = "Price";
            headerPrice.CssClass = "cart-header-cell";
            headerRow.Controls.Add(headerPrice);

            // Quantity
            TableCell headerQty = new TableCell();
            headerQty.Text = "Quantity";
            headerQty.CssClass = "cart-header-cell";
            headerRow.Controls.Add(headerQty);

            // Total
            TableCell headerTotal = new TableCell();
            headerTotal.Text = "Total";
            headerTotal.CssClass = "cart-header-cell";
            headerRow.Controls.Add(headerTotal);

            // Actions
            TableCell headerActions = new TableCell();
            headerActions.Text = "Remove";
            headerActions.CssClass = "cart-header-cell";
            headerRow.Controls.Add(headerActions);

            Table1.Controls.Add(headerRow);
        }

        private TableRow CreateProductRow(DataTable book, DataRow cartItem, int index, ref double TCost)
        {
            TableRow productRow = new TableRow();
            productRow.CssClass = "cart-row";

            // Product Image
            TableCell imageCell = new TableCell();
            imageCell.Text = $"<img src='{book.Rows[0]["Item_Image"]}' class='product-image' alt='Product Image' />";
            imageCell.CssClass = "cart-cell";
            productRow.Controls.Add(imageCell);

            // Product Name
            TableCell nameCell = new TableCell();
            nameCell.Text = $"<div class='product-name'>{book.Rows[0]["Item_name"]}</div>";
            nameCell.CssClass = "cart-cell";
            productRow.Controls.Add(nameCell);

            // Price
            TableCell priceCell = new TableCell();
            priceCell.Text = $"<div class='product-price'>₹{book.Rows[0]["Item_Cost"]}</div>";
            priceCell.CssClass = "cart-cell";
            productRow.Controls.Add(priceCell);

            // Quantity
            TableCell qtyCell = new TableCell();
            TextBox qtyTextBox = new TextBox();
            qtyTextBox.CssClass = "quantity-input";
            qtyTextBox.Text = cartItem["Quantity"].ToString();
            qtyTextBox.ID = $"{cartItem["Cart_ID"]}_{cartItem["Item_ID"]}_{index}";
            qtyTextBox.TextChanged += new EventHandler(qt_TextChanged);
            qtyTextBox.AutoPostBack = true;
            qtyTextBox.Attributes.Add("min", "1");
            qtyTextBox.Attributes.Add("type", "number");
            qtyCell.Controls.Add(qtyTextBox);
            qtyCell.CssClass = "cart-cell";
            productRow.Controls.Add(qtyCell);

            LblQuan.Text = cartItem["Quantity"].ToString();

            // Total Price
            TableCell totalCell = new TableCell();
            double itemTotal = int.Parse(cartItem["Quantity"].ToString()) * double.Parse(book.Rows[0]["Item_Cost"].ToString());
            TCost += itemTotal;
            totalCell.Text = $"<div class='total-price'>₹{itemTotal:F2}</div>";
            totalCell.CssClass = "cart-cell";
            productRow.Controls.Add(totalCell);

            // Delete Button
            TableCell deleteCell = new TableCell();
            Button deleteBtn = new Button();
            deleteBtn.Text = "<i class='fas fa-trash-alt'></i>";
            deleteBtn.CssClass = "delete-btn";
            deleteBtn.ID = $"{cartItem["Cart_ID"]}_001{index}";
            deleteBtn.OnClientClick = "return confirm('Are you sure you want to remove this item?');";
            deleteBtn.Click += new EventHandler(del_Click);
            deleteBtn.ToolTip = "Remove item from cart";
            deleteCell.Controls.Add(deleteBtn);
            deleteCell.CssClass = "cart-cell";
            productRow.Controls.Add(deleteCell);

            return productRow;
        }

        private void CreateTotalRow(double totalCost)
        {
            TableRow totalRow = new TableRow();
            totalRow.CssClass = "cart-total";

            TableCell totalCell = new TableCell();
            totalCell.ColumnSpan = 6;
            totalCell.Text = $@"
                <div class='total-row'>
                    <span class='total-label'>
                        <i class='fas fa-calculator'></i> Grand Total:
                    </span>
                    <span class='total-amount'>₹{totalCost:F2}</span>
                </div>";
            totalRow.Controls.Add(totalCell);
            
            Table1.Controls.Add(totalRow);
        }

        void qt_TextChanged(object sender, EventArgs e)
        {
            TextBox t = (TextBox)sender;
            LblQuan.Text = t.Text;

            string[] id = t.ID.ToString().Split('_');
            LabelId.Text = id[0];

            DataTable tab50 = obj.GetItemDetails(int.Parse(id[1].ToString()));

            if (!int.TryParse(t.Text, out int cnt) || cnt <= 0)
            {
                // Reset to previous value if invalid input
                t.Text = "1";
                cnt = 1;
                ShowAlert("Please enter a valid quantity.");
                return;
            }

            int totalquantity = int.Parse(tab50.Rows[0]["Quantity"].ToString());
            status = null;

            if (cnt <= totalquantity)
            {
                status = "Avail";
                if (obj.UpdateCartDetails(cnt, int.Parse(LabelId.Text)))
                {
                    ViewCartDetails();
                    ShowAlert("Quantity updated successfully!", "success");
                }
            }
            else
            {
                status = "Exceeds";
                t.Text = totalquantity.ToString(); // Reset to max available
                ShowAlert($"Only {totalquantity} items available in stock.");
            }
        }

        void del_Click(object sender, EventArgs e)
        {
            Button delete = (Button)sender;
            string[] id = delete.ID.ToString().Split('_');
            if (obj.DeleteCartDetails(int.Parse(id[0])))
            {
                ViewCartDetails();
                ShowAlert("Item removed from cart successfully!", "success");
            }
        }

        void update_Click(object sender, EventArgs e)
        {
            // This method can be removed if not needed
        }

        protected void BtnShopMore_Click(object sender, EventArgs e)
        {
            Response.Redirect("BrowseItems.aspx");
        }

        protected void BtnExit_Click(object sender, EventArgs e)
        {
            try
            {
                if (status == null || status.Equals("Avail"))
                {
                    Session["Cart"] = "1";
                    Response.Redirect("ReviewOrder.aspx");
                }
                else if (status.Equals("Exceeds"))
                {
                    ShowAlert("Please check item quantities. Some items exceed available stock.");
                }
            }
            catch (Exception ex)
            {
                ShowAlert("An error occurred. Please try again.");
                // Log error in production
            }
        }

        private void ShowAlert(string message, string type = "warning")
        {
            string icon = type == "success" ? "fa-check-circle" : "fa-exclamation-triangle";
            string bgColor = type == "success" ? "#10b981" : "#f59e0b";
            
            string script = $@"
                const alertDiv = document.createElement('div');
                alertDiv.style.cssText = `
                    position: fixed;
                    top: 20px;
                    right: 20px;
                    background: {bgColor};
                    color: white;
                    padding: 1rem 1.5rem;
                    border-radius: 12px;
                    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
                    z-index: 1000;
                    display: flex;
                    align-items: center;
                    gap: 0.5rem;
                    font-weight: 600;
                    animation: slideIn 0.3s ease-out;
                `;
                alertDiv.innerHTML = '<i class=""fas {icon}""></i> {message}';
                document.body.appendChild(alertDiv);
                
                setTimeout(() => {{
                    alertDiv.style.animation = 'slideOut 0.3s ease-in';
                    setTimeout(() => alertDiv.remove(), 300);
                }}, 3000);
                
                const style = document.createElement('style');
                style.textContent = `
                    @keyframes slideIn {{
                        from {{ transform: translateX(100%); opacity: 0; }}
                        to {{ transform: translateX(0); opacity: 1; }}
                    }}
                    @keyframes slideOut {{
                        from {{ transform: translateX(0); opacity: 1; }}
                        to {{ transform: translateX(100%); opacity: 0; }}
                    }}
                `;
                document.head.appendChild(style);
            ";

            ClientScript.RegisterStartupScript(this.GetType(), "showAlert", script, true);
        }
    }
}