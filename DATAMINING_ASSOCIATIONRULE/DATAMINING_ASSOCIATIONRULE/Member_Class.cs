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
    public class Member_Class
    {
        Customer_TransactionsTableAdapter cust_transaction_obj = new Customer_TransactionsTableAdapter();
        Transaction_DetailsTableAdapter transactiondetails_obj = new Transaction_DetailsTableAdapter();
        Item_SubCategoryTableAdapter subcategory_obj = new Item_SubCategoryTableAdapter();
        Item_DetailsTableAdapter item_obj = new Item_DetailsTableAdapter();
        Customer_DetailsTableAdapter customer_obj = new Customer_DetailsTableAdapter();
        FeedbacksTableAdapter feedback_obj = new FeedbacksTableAdapter();
        DataTable2TableAdapter dt2Obj = new DataTable2TableAdapter();
        RatingsTableAdapter itemfeedbackObj = new RatingsTableAdapter();

        #region ------ CUSTOMER CHANGEPASSWORD -------

        public void Customer_Changepwd(string pwd, string EmailID)
        {
            customer_obj.ChangeCustomerPassword(pwd, EmailID);
        }


        #endregion

        #region ------ CUSTOMER TRANSACTIONS ---------

        public void NewCustomerTransaction(string emailID, DateTime transactiondate)
        {
            cust_transaction_obj.NewTransaction(emailID, transactiondate);
        }

        public int GetTransactionID()
        {
            return (int)cust_transaction_obj.GetTransactionID();
        }

        public void NewTransactionDetails(int transactionID, int itemID, int Quantity)
        {
            transactiondetails_obj.NewTransactionDetails(transactionID, itemID, Quantity);
        }

        public DataTable GetCustomerTransactions(string emailID)
        {
            return cust_transaction_obj.GetCustomerTransactions(emailID);
        }

        public DataTable GetCustomerTransactionsBasedonStatus(string emailID, string status)
        {
            return cust_transaction_obj.GetCustomerTransactionsBasedonStatus(emailID, status);
        }

        public DataTable GetTransactionDetails(int transactionID)
        {
            return transactiondetails_obj.GetTransactionDetails(transactionID);
        }

        public DataTable GetItemDetails(int ItemID)
        {
            return item_obj.GetItemDetails(ItemID);
        }

        public DataTable GetSubCategoryDetails(int SubcategoryID)
        {
            return subcategory_obj.GetSubCategoryDetails(SubcategoryID);
        }

        public DataTable GetCustomerDetails(string EmailID)
        {
            return customer_obj.GetCustomerDetails(EmailID);
        }

        public void UpdateItemQuantity(int Quantity, int ItemID)
        {
            item_obj.UpdateItemQuantity(Quantity, ItemID).ToString();
        }


        #endregion

        #region ------ MANAGE FEEDBACKS -------

        public void Insert_Feedback(string EmailID, string feedback, string date)
        {
            feedback_obj.Insert_Feedback(EmailID, feedback, date);
        }




        #endregion

        public DataTable GetCustomerDistinctItems(string EmailId)
        {
            return dt2Obj.GetCustomerDistinctItems(EmailId);
        }

        public void NewItemFeedback(int ItemId, string EmailId, int rating, DateTime PostedDate)
        {
            itemfeedbackObj.InsertRating(ItemId, EmailId, rating, PostedDate);
        }

        public DataTable GetItemFeedbacks(int ItemId)
        {
            return itemfeedbackObj.GetRatingsByItem(ItemId);
        }

        //function to check the customer rating
        public bool CheckCustomerRating(string emailId, int itemId)
        {
            int cnt = int.Parse(itemfeedbackObj.CheckCustomerRating(emailId, itemId).ToString());

            if (cnt == 1)

                return false;

            return true;
        }

        //function to get te cutomer ratings
        public DataTable GetCustomerRating(string emailId, int itemId)
        {
            return itemfeedbackObj.GetCustomerRatings(emailId, itemId);
        }

        //functio to delete th rating
        public void DeleteRating(int ratingId)
        {
            itemfeedbackObj.DeleteRating(ratingId);
        }

        #region Market Segmentation

        public DataTable GetTransactionsByGender(string gender, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByGender(gender, startDate, endDate);
        }

        public DataTable GetTransactionsByDOB(string startDOB, string endDOB, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByDOB(startDOB, endDOB, startDate, endDate);
        }

        public DataTable GetTransactionsByMartialStatus(string MartialStatus, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByMartialstatus(MartialStatus, startDate, endDate);
        }

        public DataTable GetTransactionsByEducation(string Education, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByEducation(Education, startDate, endDate);
        }

        public DataTable GetTransactionsByOccupation(string Occupation, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByOccupation(Occupation, startDate, endDate);
        }

        public DataTable GetTransactionsByIncome(string Income, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByIncome(Income, startDate, endDate);
        }

        public DataTable GetDistinctItemsByGender(string gender, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByGender(gender, startDate, endDate);
        }

        public DataTable GetDistinctItemsByDOB(string startDOB, string endDOB, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByDOB(startDOB, endDOB, startDate, endDate);
        }

        public DataTable GetDistinctItemsByMartialStatus(string MartialStatus, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByMartialStatus(MartialStatus, startDate, endDate);
        }

        public DataTable GetDistinctItemsByEducation(string Education, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByEducation(Education, startDate, endDate);
        }

        public DataTable GetDistinctItemsByOccupation(string Occupation, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByOccupation(Occupation, startDate, endDate);
        }

        public DataTable GetDistinctItemsByIncome(string Income, DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByIncome(Income, startDate, endDate);
        }

        //get transactions by date
        public DataTable GetTransactionsByDate(DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetTransactionsByDate(startDate, endDate);
        }

        //get distinct items
        public DataTable GetDistinctItemsByDate(DateTime startDate, DateTime endDate)
        {
            return dt2Obj.GetDistinctItemsByDate(startDate, endDate);
        }


        #endregion

    }

}
