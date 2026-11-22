using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nếu đã đăng nhập rồi thì chuyển thẳng sang trang Products
            if (!IsPostBack)
            {
                if (Session["User"] != null)
                {
                    Response.Redirect("DemoSession_Products.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;

            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if(username == "" || password == "")
            {
                lblError.Text = "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu!";
                lblError.Visible = true;
                return;
            }    

            // Kiểm tra tài khoản cứng: admin / 123
            if (username == "admin" && password == "123")
            {
                // Lưu thông tin đăng nhập vào Session
                Session["User"] = username;

                // Khởi tạo giỏ hàng rỗng trên RAM Server
                Session["Cart"] = new List<string>();

                // Chuyển sang trang sản phẩm
                Response.Redirect("DemoSession_Products.aspx");
            }
            else
            {
                lblError.Text = "Sai tài khoản hoặc mật khẩu!";
                lblError.Visible = true;
            }
        }
    }
}