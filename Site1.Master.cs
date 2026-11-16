using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai_tap_demo_ASPX
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            lblXRaySession.Text = Session.SessionID;

            var cookieNames = new System.Collections.Generic.List<string>();
            foreach (string key in Request.Cookies.AllKeys)
            {
                cookieNames.Add(key + "=" + Request.Cookies[key].Value);
            }
            lblXRayCookies.Text = cookieNames.Count > 0 ? string.Join("; ", cookieNames) : "(trống)";
        }
    }
}