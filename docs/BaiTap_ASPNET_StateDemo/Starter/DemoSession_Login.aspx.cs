using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // TODO 1: Nếu Session["User"] != null (đã đăng nhập) -> chuyển thẳng sang "DemoSession_Products.aspx"
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // TODO 2: Lấy txtUsername.Text.Trim() và txtPassword.Text.Trim()
            // Kiểm tra nếu đúng tài khoản mẫu ("admin" / "123"):
            //   - Gán Session["User"] = username;
            //   - Khởi tạo giỏ hàng rỗng: Session["Cart"] = new List<string>();
            //   - Chuyển sang "DemoSession_Products.aspx" bằng Response.Redirect(...)
            // Ngược lại: hiện thông báo lỗi lên lblError.Text và lblError.Visible = true;
        }
    }
}
