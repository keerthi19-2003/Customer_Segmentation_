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
    public partial class Signout : System.Web.UI.Page
    {
        string value = null;
        Visitor obj = new Visitor();

        protected void Page_Load(object sender, EventArgs e)
        {
            value = Request.QueryString["value"].ToString();

            if (value.Equals("admin"))
            {
                Session.Abandon();
                Response.Redirect("Homepage.aspx");
            }

            else if (value.Equals("customer"))
            {
                try
                {
                    obj.DeleteCartDetails(Session["Visitor"].ToString());
                    
                }
                catch
                {

                }

                Session.Abandon();
                Response.Redirect("Homepage.aspx");
            }
        }
    }
}
