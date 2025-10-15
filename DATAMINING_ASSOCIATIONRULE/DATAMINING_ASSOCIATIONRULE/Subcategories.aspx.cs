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
using System.IO;

namespace DATAMINING_ASSOCIATIONRULE
{
    public partial class Subcategories : System.Web.UI.Page
    {
        Admin_Class obj = new Admin_Class();
        static DataTable tab = new DataTable();
        DataTable tab1 = new DataTable();
        DataTable tab2 = new DataTable();
        static int serial_no = 1;
        static int i = 0, j = 5;
        static int subcategory_ID = 0, ItemID = 0;
        static string subcategoryname = null, Item_name = null;
        static string records = "All", oldphoto_path = null, oldAttachment_path = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_ID"] == null)
            {
                Session.Abandon();
                Response.Redirect("Home_page.aspx");
            }
            else
            {
                if (!this.IsPostBack)
                {
                    i = 0;
                    j = 5;

                    LoadItemCategories();

                }


                GetAllSubCategories();


                try
                {
                    if (DropDownList1.SelectedIndex == 0)

                        GetAllSubCategories();

                    else

                        //GetCategorySubCategories
                        GetCategorySubCategories(int.Parse(DropDownList1.SelectedValue.ToString()));

                }
                catch
                {

                }

            }
        }



        #region -------- MANAGE ITEM SUBCATEGORIES ---------

        private void LoadItemCategories()
        {
            tab1.Rows.Clear();
            tab1 = obj.GetAllCategories();

            DropDownList1.Items.Clear();

            if (tab1.Rows.Count > 0)
            {
                DropDownList1.DataSource = tab1.DefaultView;

                DropDownList1.DataTextField = "Category_Name";
                DropDownList1.DataValueField = "Category_ID";

                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, "- All -");

            }
            else
            {
                DropDownList1.DataSource = null;
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, "- All -");


            }
        }

        private void GetAllSubCategories()
        {
            tab1.Rows.Clear();
            tab1 = obj.GetAllSubCategories();

            if (tab1.Rows.Count > 0)
            {
                Table2.Rows.Clear();
                Table2.GridLines = GridLines.Both;

                TableHeaderRow main_row = new TableHeaderRow();

                TableHeaderCell cell1 = new TableHeaderCell();
                cell1.Text = "Category";
                main_row.Controls.Add(cell1);

                TableHeaderCell cell2 = new TableHeaderCell();
                cell2.Text = "SubCategory";
                main_row.Controls.Add(cell2);

                TableHeaderCell cell3 = new TableHeaderCell();
                cell3.Text = "Description";
                main_row.Controls.Add(cell3);



                Table2.Controls.Add(main_row);

                for (int cnt = i; cnt < j; cnt++)
                {
                    if (cnt < tab1.Rows.Count)
                    {
                        TableRow row = new TableRow();

                        TableCell cell_categoryname = new TableCell();
                        cell_categoryname.Width = 150;
                        DataTable d1 = new DataTable();
                        d1.Rows.Clear();
                        d1 = obj.GetCategoryDetails(int.Parse(tab1.Rows[cnt]["Category_ID"].ToString()));
                        cell_categoryname.Text = d1.Rows[0]["Category_Name"].ToString();
                        row.Controls.Add(cell_categoryname);

                        TableCell cell_subcategory = new TableCell();
                        cell_subcategory.Width = 150;
                        cell_subcategory.Text = tab1.Rows[cnt]["SubCategory_Name"].ToString();
                        row.Controls.Add(cell_subcategory);

                        TableCell cell_description = new TableCell();
                        cell_description.Width = 250;
                        cell_description.Text = tab1.Rows[cnt]["Description"].ToString();
                        row.Controls.Add(cell_description);


                        Table2.Controls.Add(row);

                        if (tab1.Rows.Count > 5)
                        {
                            if (cnt < 5)
                            {
                                ImageButton5.Visible = true;
                                ImageButton4.Visible = false;
                                ImageButton6.Visible = false;
                            }
                            else
                            {
                                if (j >= tab1.Rows.Count)
                                {
                                    ImageButton6.Visible = true;
                                    ImageButton5.Visible = false;
                                    ImageButton4.Visible = true;
                                }
                                else
                                {
                                    ImageButton6.Visible = false;
                                    ImageButton5.Visible = true;
                                    ImageButton4.Visible = true;
                                }
                            }
                        }
                        else
                        {
                            ImageButton4.Visible = false;
                            ImageButton5.Visible = false;
                            ImageButton6.Visible = false;
                        }
                    }
                    else
                    {
                        if (tab1.Rows.Count < 5)
                        {
                            ImageButton4.Visible = false;
                            ImageButton5.Visible = false;
                            ImageButton6.Visible = false;
                        }
                        else
                        {
                            ImageButton4.Visible = true;
                            ImageButton5.Visible = false;
                            ImageButton6.Visible = true;
                        }
                    }
                }
            }
            else
            {
                Table2.Rows.Clear();
                Table2.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.ColumnSpan = 5;
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.Text = "No ItemSubCategories Found";
                row.Controls.Add(cell);

                Table2.Controls.Add(row);

                ImageButton4.Visible = false;
                ImageButton5.Visible = false;
                ImageButton6.Visible = false;
            }
        }

        protected void btn_subcategory_Click(object sender, EventArgs e)
        {
            try
            {
                if (btn_subcategory.Text.Equals("Submit"))
                {
                    if (obj.CheckCategorySubCategory(int.Parse(DropDownList1.SelectedValue.ToString()), txt_newsubcategory.Text))
                    {
                        obj.NewItemSubCategory(int.Parse(DropDownList1.SelectedValue.ToString()), txt_newsubcategory.Text, txt_description.Text);
                        ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('New ItemSubCategory Added Successfully')</script>");
                        ClearTextBoxes();
                        DropDownList1_SelectedIndexChanged(sender, e);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('ItemSubCategory Exists')</script>");
                    }
                }
                else if (btn_subcategory.Text.Equals("Update"))
                {
                    if (subcategoryname.Equals(txt_newsubcategory.Text))
                    {
                        obj.UpdateItemSubCategoryDetails(int.Parse(DropDownList1.SelectedValue.ToString()), txt_newsubcategory.Text, txt_description.Text, subcategory_ID);
                        ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('ItemSubCategory Updated Successfully')</script>");
                        ClearTextBoxes();
                        DropDownList1_SelectedIndexChanged(sender, e);

                        btn_subcategory.Text = "Submit";
                    }
                    else
                    {
                        if (obj.CheckCategorySubCategory(int.Parse(DropDownList1.SelectedValue.ToString()), txt_newsubcategory.Text))
                        {
                            obj.UpdateItemSubCategoryDetails(int.Parse(DropDownList1.SelectedValue.ToString()), txt_newsubcategory.Text, txt_description.Text, subcategory_ID);
                            ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('ItemSubCategory Updated Successfully')</script>");
                            ClearTextBoxes();
                            DropDownList1_SelectedIndexChanged(sender, e);

                            btn_subcategory.Text = "Submit";
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('ItemSubCategory Exists')</script>");
                        }
                    }

                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Server Error!')</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            i = 0; j = 5;

            if (DropDownList1.SelectedIndex > 0)
            {
                records = "Categorywise";
                GetCategorySubCategories(int.Parse(DropDownList1.SelectedValue.ToString()));

            }
            else
            {
                records = "All";
                GetAllSubCategories();
            }
        }

        private void GetCategorySubCategories(int categoryID)
        {
            tab1.Rows.Clear();
            tab1 = obj.GetCategorySubCategories(categoryID);

            if (tab1.Rows.Count > 0)
            {
                Table2.Rows.Clear();
                Table2.GridLines = GridLines.Both;

                TableHeaderRow main_row = new TableHeaderRow();

                TableHeaderCell cell1 = new TableHeaderCell();
                cell1.Text = "Category";
                main_row.Controls.Add(cell1);

                TableHeaderCell cell2 = new TableHeaderCell();
                cell2.Text = "SubCategory";
                main_row.Controls.Add(cell2);

                TableHeaderCell cell3 = new TableHeaderCell();
                cell3.Text = "Description";
                main_row.Controls.Add(cell3);

                TableHeaderCell cell4 = new TableHeaderCell();
                cell4.Text = "Edit Details";
                main_row.Controls.Add(cell4);

                TableHeaderCell cell5 = new TableHeaderCell();
                cell5.Text = "Delete";
                main_row.Controls.Add(cell5);

                Table2.Controls.Add(main_row);

                for (int cnt = i; cnt < j; cnt++)
                {
                    if (cnt < tab1.Rows.Count)
                    {
                        TableRow row = new TableRow();

                        TableCell cell_categoryname = new TableCell();
                        cell_categoryname.Width = 150;
                        DataTable d1 = new DataTable();
                        d1.Rows.Clear();
                        d1 = obj.GetCategoryDetails(int.Parse(tab1.Rows[cnt]["Category_ID"].ToString()));
                        cell_categoryname.Text = d1.Rows[0]["Category_Name"].ToString();
                        row.Controls.Add(cell_categoryname);

                        TableCell cell_subcategory = new TableCell();
                        cell_subcategory.Width = 150;
                        cell_subcategory.Text = tab1.Rows[cnt]["SubCategory_Name"].ToString();
                        row.Controls.Add(cell_subcategory);

                        TableCell cell_description = new TableCell();
                        cell_description.Width = 250;
                        cell_description.Text = tab1.Rows[cnt]["Description"].ToString();
                        row.Controls.Add(cell_description);

                        TableCell cell_editsubcategory = new TableCell();
                        Button btn_edit = new Button();
                        btn_edit.ID = "SubCategoryEdit~" + tab1.Rows[cnt]["SubCategory_ID"].ToString();
                        btn_edit.Text = "Edit Details";
                        btn_edit.Click += new EventHandler(btn_edit_Click);
                        cell_editsubcategory.Controls.Add(btn_edit);
                        row.Controls.Add(cell_editsubcategory);

                        TableCell cell_deletesubcategory = new TableCell();
                        Button btn_deletesubcategory = new Button();
                        btn_deletesubcategory.ID = "SubCategoryDelete~" + tab1.Rows[cnt]["SubCategory_ID"].ToString();
                        btn_deletesubcategory.Text = "Delete";
                        btn_deletesubcategory.OnClientClick = "return confirm('Are you sure want to delete ?')";
                        btn_deletesubcategory.Click += new EventHandler(btn_deletesubcategory_Click);
                        cell_deletesubcategory.Controls.Add(btn_deletesubcategory);
                        row.Controls.Add(cell_deletesubcategory);

                        Table2.Controls.Add(row);


                        if (tab1.Rows.Count > 5)
                        {
                            if (cnt < 5)
                            {
                                ImageButton5.Visible = true;
                                ImageButton4.Visible = false;
                                ImageButton6.Visible = false;
                            }
                            else
                            {
                                if (j >= tab1.Rows.Count)
                                {
                                    ImageButton6.Visible = true;
                                    ImageButton5.Visible = false;
                                }
                                else
                                {
                                    ImageButton6.Visible = false;
                                    ImageButton5.Visible = true;
                                    ImageButton4.Visible = true;
                                }
                            }
                        }
                        else
                        {
                            ImageButton4.Visible = false;
                            ImageButton5.Visible = false;
                            ImageButton6.Visible = false;
                        }
                    }
                    else
                    {
                        if (tab1.Rows.Count < 5)
                        {
                            ImageButton4.Visible = false;
                            ImageButton5.Visible = false;
                            ImageButton6.Visible = false;
                        }
                        else
                        {
                            ImageButton4.Visible = true;
                            ImageButton5.Visible = false;
                            ImageButton6.Visible = true;
                        }
                    }
                }
            }

            else
            {
                Table2.Rows.Clear();
                Table2.GridLines = GridLines.None;

                TableHeaderRow row = new TableHeaderRow();
                TableHeaderCell cell = new TableHeaderCell();
                cell.ColumnSpan = 5;
                cell.Font.Bold = true;
                cell.ForeColor = System.Drawing.Color.Red;
                cell.Text = "No ItemSubCategories Found";
                row.Controls.Add(cell);

                Table2.Controls.Add(row);

                ImageButton4.Visible = false;
                ImageButton5.Visible = false;
                ImageButton6.Visible = false;
            }
        }

        void btn_edit_Click(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            Button btn = (Button)sender;

            string[] s = btn.ID.ToString().Split('~');

            try
            {
                tab1.Rows.Clear();
                tab1 = obj.GetSubCategoryDetails(int.Parse(s[1].ToString()));

                txt_newsubcategory.Text = tab1.Rows[0]["SubCategory_Name"].ToString();
                subcategoryname = tab1.Rows[0]["SubCategory_Name"].ToString();
                txt_description.Text = tab1.Rows[0]["Description"].ToString();

                int categoryID = int.Parse(tab1.Rows[0]["Category_ID"].ToString());

                string datatextfield = DropDownList1.Items.FindByValue(categoryID.ToString()).ToString();

                ListItem item = new ListItem(datatextfield, categoryID.ToString());
                int index = DropDownList1.Items.IndexOf(item);

                if (index != -1)

                    DropDownList1.SelectedIndex = index;

                DropDownList1_SelectedIndexChanged(sender, e);

                subcategory_ID = int.Parse(s[1]);
                btn_subcategory.Text = "Update";

            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Server Error!')</script>");
                ClearTextBoxes();
                DropDownList1_SelectedIndexChanged(sender, e);

            }

        }

        void btn_deletesubcategory_Click(object sender, EventArgs e)
        {
            //throw new NotImplementedException();
            Button btn = (Button)sender;

            string[] s = btn.ID.ToString().Split('~');

            try
            {
                obj.DeleteItemSubCategory(int.Parse(s[1].ToString()));
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('ItemSubCategory Deleted Successfully')</script>");
                ClearTextBoxes();
                btn_subcategory.Text = "Submit";
                DropDownList1_SelectedIndexChanged(sender, e);
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "Key", "<script>alert('Server Error!')</script>");
            }
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            i = i - 5;
            j = j - 5;

            if (i >= 0)
            {
                Table2.Rows.Clear();

                if (records.Equals("All"))

                    GetAllSubCategories();

                else if (records.Equals("Categorywise"))

                    GetCategorySubCategories(int.Parse(DropDownList1.SelectedValue.ToString()));

                btn_subcategory.Text = "Submit";
                ClearTextBoxes();

            }
            else
            {
                i = 0;
                j = 5;
            }
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            i = j;
            j = j + 5;

            if (i < tab1.Rows.Count)
            {
                Table2.Rows.Clear();

                if (records.Equals("All"))

                    GetAllSubCategories();

                else if (records.Equals("Categorywise"))

                    GetCategorySubCategories(int.Parse(DropDownList1.SelectedValue.ToString()));

                btn_subcategory.Text = "Submit";
                ClearTextBoxes();

            }
            else
            {
                i = i - 5;
                j = j - 5;
                ImageButton4.Visible = false;
                ImageButton5.Visible = false;
                ImageButton6.Visible = true;

            }
        }

        protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
        {
            if (records.Equals("Categorywise"))

                DropDownList1_SelectedIndexChanged(sender, e);

            else if (records.Equals("All"))

                Response.Redirect("Subcategories.aspx");
        }

        private void ClearTextBoxes()
        {
            txt_description.Text = string.Empty;
            txt_newsubcategory.Text = string.Empty;
            btn_subcategory.Text = "Submit";
        }

        #endregion

    }
}