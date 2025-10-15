using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class ViewItemDetails : System.Web.UI.Page
    {
        private readonly Visitor obj = new Visitor();

        protected void Page_Load(object sender, EventArgs e)
        {XhtmlMobileDocType
            if (!IsPostBack)
            {
                if (Session["Item_ID"] != null &&
                    int.TryParse(Session["Item_ID"].ToString(), out int id))
                {
                    BuildModernItemTable(id);
                }
                else
                {
                    ShowItemNotFound();
                }
            }
        }

        private void ShowItemNotFound()
        {
            TableBD.Rows.Clear();
            
            TableRow errorRow = new TableRow();
            TableCell errorCell = new TableCell
            {
                ColumnSpan = 2,
                CssClass = "error-display"
            };

            // Error content
            errorCell.Text = @"
                <div class='error-icon'>🔍</div>
                <h2 class='error-title'>Product Not Found</h2>
                <p>Sorry, the product you're looking for doesn't exist or has been removed.</p>
            ";

            errorRow.Cells.Add(errorCell);
            TableBD.Rows.Add(errorRow);
        }

        private void BuildModernItemTable(int itemId)
        {
            TableBD.Rows.Clear();

            DataTable tab = obj.GetItemDetails(itemId);
            if (tab.Rows.Count == 0)
            {
                ShowItemNotFound();
                return;
            }

            DataRow dr = tab.Rows[0];
            Session["subCategoryId"] = dr["SubCategory_ID"].ToString();

            int rating = 0;
            DataTable ratings = obj.GetRatingByItem(itemId);
            if (ratings.Rows.Count > 0)
                rating = obj.GetItemRating(itemId);

            bool inStock = int.Parse(dr["Quantity"].ToString()) > 0;
            int quantity = int.Parse(dr["Quantity"].ToString());

            // Create main product layout
            CreateProductMainSection(dr, rating, inStock, quantity);
            
            // Create description section
            CreateDescriptionSection(dr);
        }

        private void CreateProductMainSection(DataRow dr, int rating, bool inStock, int quantity)
        {
            TableRow mainRow = new TableRow();
            TableCell mainCell = new TableCell
            {
                ColumnSpan = 2,
                CssClass = "product-layout"
            };

            // Left side - Image section
            string imageSection = $@"
                <div class='image-section'>
                    <img src='{Server.HtmlEncode(dr["Item_Image"].ToString())}' 
                         alt='{Server.HtmlEncode(dr["Item_Name"].ToString())}' 
                         class='product-image' />
                </div>";

            // Right side - Product info
            string ratingStars = GenerateStars(rating);
            string stockClass = inStock ? "quantity-info" : "quantity-info out-of-stock";
            string stockText = inStock ? $"{quantity} items available" : "Out of stock";
            string stockIcon = inStock ? "✅" : "❌";

            string infoSection = $@"
                <div class='info-section'>
                    <h1 class='product-name'>{Server.HtmlEncode(dr["Item_Name"].ToString())}</h1>
                    
                    <div class='rating-display'>
                        <span class='rating-stars'>{ratingStars}</span>
                        <span class='rating-text'>{rating}/5 ({rating} stars)</span>
                    </div>
                    
                    <div class='product-price'>₹{Server.HtmlEncode(dr["Item_Cost"].ToString())}</div>
                    
                    <div class='{stockClass}'>
                        <span class='quantity-text'>{stockIcon} {stockText}</span>
                    </div>
                    
                    <div class='cart-actions'>
                        {CreateCartButton(inStock)}
                        {CreateAddToCartLink(inStock)}
                    </div>
                </div>";

            mainCell.Text = imageSection + infoSection;
            mainRow.Cells.Add(mainCell);
            TableBD.Rows.Add(mainRow);
        }

        private void CreateDescriptionSection(DataRow dr)
        {
            TableRow descRow = new TableRow();
            TableCell descCell = new TableCell
            {
                ColumnSpan = 2,
                CssClass = "description-section"
            };

            descCell.Text = $@"
                <h2 class='description-title'>
                    📋 Product Description
                </h2>
                <p class='description-text'>{Server.HtmlEncode(dr["Item_Details"].ToString())}</p>
            ";

            descRow.Cells.Add(descCell);
            TableBD.Rows.Add(descRow);
        }

        private string GenerateStars(int rating)
        {
            string stars = "";
            for (int i = 1; i <= 5; i++)
            {
                stars += i <= rating ? "★" : "☆";
            }
            return stars;
        }

        private string CreateModernButtons(bool inStock)
        {
            if (inStock)
            {
                return $@"
                    <button type='button' class='modern-cart-button' onclick='addToCart()'>
                        🛒 Add to Cart
                    </button>
                    <button type='button' class='modern-cart-button buy-now-button' onclick='buyNow()'>
                        ⚡ Buy Now
                    </button>";
            }
            else
            {
                return $@"
                    <button type='button' class='modern-cart-button' disabled>
                        🛒 Out of Stock
                    </button>
                    <button type='button' class='modern-cart-button buy-now-button' disabled>
                        ⚡ Unavailable
                    </button>";
            }
        }

        // Legacy event handlers for backward compatibility
        protected void li_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_page.aspx");
        }

        protected void imgA_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Login_page.aspx");
        }
    }
}