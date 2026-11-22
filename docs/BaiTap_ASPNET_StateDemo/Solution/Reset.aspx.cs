using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai_tap_demo_ASPX
{
    public partial class Reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            foreach (string key in Request.Cookies.AllKeys)
            {
                Response.Cookies[key].Expires = DateTime.Now.AddDays(-1);
            }
            Session.Clear();
            Session.Abandon();

            Response.Redirect("Default.aspx");
        }
    }
}