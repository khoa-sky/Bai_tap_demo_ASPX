using System;
using System.Web;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoCookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // TODO 1: Đọc cookie "username" từ Request.Cookies["username"]
                // Nếu tồn tại và có giá trị, giải mã bằng Server.UrlDecode(...) rồi gán vào txtName.Text và hiện lời chào lên pnlGreeting / lblGreeting.

                // TODO 2: Đọc cookie "theme" từ Request.Cookies["theme"]
                // Nếu giá trị là "dark" thì đổi pnlCookie.Attributes["data-bs-theme"] = "dark", ngược lại "light".
            }
        }

        protected void btnSaveCookie_Click(object sender, EventArgs e)
        {
            // TODO 3: Lấy tên từ txtName.Text.Trim()
            // Tạo HttpCookie("username", Server.UrlEncode(name))
            // Nếu chkRemember.Checked == true -> gán cookie.Expires = DateTime.Now.AddDays(7);
            // Nếu không tick -> KHÔNG gán Expires (để thành Session Cookie, đóng trình duyệt sẽ mất)
            // Lưu bằng Response.Cookies.Add(cookie);
        }

        protected void btnLight_Click(object sender, EventArgs e)
        {
            // TODO 4: Tạo HttpCookie("theme", "light") có Expires = 7 ngày, lưu vào Response.Cookies
            // và đổi giao diện pnlCookie.Attributes["data-bs-theme"] = "light";
        }

        protected void btnDark_Click(object sender, EventArgs e)
        {
            // TODO 5: Tạo HttpCookie("theme", "dark") có Expires = 7 ngày, lưu vào Response.Cookies
            // và đổi giao diện pnlCookie.Attributes["data-bs-theme"] = "dark";
        }
    }
}
