using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using DATAMINING_ASSOCIATIONRULE.DataLayerTableAdapters;

namespace DATAMINING_ASSOCIATIONRULE
{
    public class Visitor
    {
        Admin_DetailsTableAdapter admin_obj = new Admin_DetailsTableAdapter();
        Customer_DetailsTableAdapter customer_obj = new Customer_DetailsTableAdapter();
        Item_CategoryTableAdapter itemcategory_obj = new Item_CategoryTableAdapter();
        Item_SubCategoryTableAdapter subcategory_obj = new Item_SubCategoryTableAdapter();
        Item_DetailsTableAdapter item_obj = new Item_DetailsTableAdapter();
        DataTable1TableAdapter dt1_obj = new DataTable1TableAdapter();
        Item_CategoryTableAdapter category_obj = new Item_CategoryTableAdapter();
        Cart_DetailsTableAdapter cart_obj = new Cart_DetailsTableAdapter();
        Transaction_DetailsTableAdapter transdetails_obj = new Transaction_DetailsTableAdapter();

        RatingsTableAdapter ratingObj = new RatingsTableAdapter();





        #region ------- REGISTRATION ------------

        public bool Check_CustomerID_Avail(string EmailID)
        {
            try
            {
                int cnt = int.Parse(customer_obj.Check_CustomerEmailID(EmailID).ToString());

                if (cnt == 1)

                    return false;

                else

                    return true;
            }
            catch
            {
                return true;
            }
        }

        public bool Check_AdminID(string adminID)
        {
            try
            {
                int cnt = int.Parse(admin_obj.Check_AdminID(adminID).ToString());

                if (cnt == 1)

                    return false;

                else

                    return true;
            }
            catch
            {
                return true;
            }
        }

        public void NewRegistration(string EmailID, string Name, string password, string gender, string DOB, string martialStatus, string education, string occupation, string income, string country, string contactno, string address)
        {
            customer_obj.InsertCustomer(EmailID, Name, password, gender, DOB, martialStatus, education, occupation, income, address, contactno, country);
        }

        #endregion

        #region ------- LOGIN --------------------

        public bool Check_Adminlogin(string adminID, string pwd)
        {
            try
            {
                int cnt = int.Parse(admin_obj.Check_AdminLogin(adminID, pwd).ToString());

                if (cnt == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        public bool Check_Customerlogin(string EmailID, string pwd)
        {
            try
            {
                int cnt = int.Parse(customer_obj.Check_CustomerLogin(EmailID, pwd).ToString());

                if (cnt == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        #endregion

        #region -------- FORGOT PASSWORD ---------

        public DataTable GetCustomerDetails(string EmailID)
        {
            return customer_obj.GetCustomerDetails(EmailID);
        }

        public bool Forgot_password(string EmailID, string Name, string contactNo)
        {
            try
            {
                int cnt = int.Parse(customer_obj.CustomerForgotPassword(EmailID, Name, contactNo).ToString());

                if (cnt == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        #endregion

        #region ------- VIEW ITEMS [CATEGORY WISE]--------

        public DataTable RetriveTop8Categories()
        {
            return itemcategory_obj.RetriveTop8Categories();
        }

        public DataTable GetCategorySubCategories(int categoryID)
        {
            return subcategory_obj.GetCategorySubCategories(categoryID);
        }

        public DataTable GetTop6Items()
        {
            return item_obj.GetTop6Items();
        }


        #endregion

        #region -------- VIEW ITEMS -------

        public DataTable GetAllItems()
        {
            return item_obj.GetData();
        }

        public DataTable GetSubcategoryItems(int subcategoryID)
        {
            return item_obj.GetSubCategoryItems(subcategoryID);
        }

        public DataTable GetCategoryItems(int categoryID)
        {
            return dt1_obj.GetCategoryItems(categoryID);
        }

        public DataTable GetItems_Categ_SubCategID(int categoryID, int subcategoryID)
        {
            return dt1_obj.GetItems_Categ_SubCateg(categoryID, subcategoryID);
        }

        public DataTable GetAllCategories()
        {
            return category_obj.GetData();
        }

        public DataTable GetItemDetails(int ItemID)
        {
            return item_obj.GetItemDetails(ItemID);
        }

        public DataTable GetItemDetails_ItemName(string ItemName)
        {
            return item_obj.GetItemDetails_ItemName(ItemName);
        }

        //function to get the item rating
        public int GetItemRating(int itemId)
        {
            return (int)ratingObj.GetItemRating(itemId);
        }

        //function to check the item rating
        public DataTable GetRatingByItem(int itemId)
        {
            return ratingObj.GetRatingByItem(itemId);
        }


        #endregion

        #region ------- VISITOR CART DETAILS ----------

        public DataTable GetCartDetails()
        {
            return cart_obj.GetData();
        }

        public DataTable GetCartDetails(string uid)
        {
            return cart_obj.GetVisitorCartDetails(uid);
        }

        public DataTable GetVisitorCartDetails(string uid)
        {
            return cart_obj.GetVisitorCartDetails(uid);
        }

        public DataTable GetCartDetails(int cart_ID)
        {
            return cart_obj.GetCartDetails(cart_ID);
        }

        public bool AddCartDetails(string uid, int itemID, int qty)
        {
            try
            {
                if (int.Parse(cart_obj.NewCart(uid, itemID, qty).ToString()) == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteCartDetails(string id)
        {
            try
            {
                if (int.Parse(cart_obj.DeleteDetails(id).ToString()) == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteCartDetails(int Cart_id)
        {
            try
            {
                if (int.Parse(cart_obj.DeleteCart(Cart_id).ToString()) == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        public bool UpdateCartDetails(int qty, int cno)
        {
            try
            {
                if (int.Parse(cart_obj.UpdateQuantity(qty, cno).ToString()) == 1)

                    return true;

                else

                    return false;
            }
            catch
            {
                return false;
            }
        }

        public bool CountItem(int itemID, string id)
        {
            if (int.Parse(cart_obj.Item_Count(itemID, id).ToString()) == 0)

                return true;

            else

                return false;
        }

        public int ItemSaledQuantity(int ItemID)
        {
            return (int)transdetails_obj.ItemSaledQuantity(ItemID);
        }

        #endregion

        #region -------- REVIEW ORDER -------

        public DataTable GetSubCategoryDetails(int SubcategoryID)
        {
            return subcategory_obj.GetSubCategoryDetails(SubcategoryID);
        }

        #endregion

    }
}
