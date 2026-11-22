using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO 1: Kiểm tra nếu Session["User"] == null -> đá về "DemoSession_Login.aspx" (nhớ thêm return;)

            if (!IsPostBack)
            {
                // TODO 2: Hiển thị tên người dùng lên lblUser.Text và cập nhật số lượng giỏ hàng trên btnViewCart.Text
            }
        }

        private void AddToCart(string productName)
        {
            // TODO 3: Đọc giỏ hàng từ Session["Cart"] (ép kiểu an toàn: Session["Cart"] as List<string> ?? new List<string>())
            // Thêm productName vào danh sách, gán lại vào Session["Cart"]
            // Hiện thông báo lên lblMessage và cập nhật số lượng trên nút btnViewCart.Text
        }

        protected void btnAdd1_Click(object sender, EventArgs e)
        {
            AddToCart("Áo Thun Cổ Tròn IceVibes Phom Rộng");
        }

        protected void btnAdd2_Click(object sender, EventArgs e)
        {
            AddToCart("Áo Thun Cổ Henley CloudTouch Phom Rộng");
        }

        protected void btnAdd3_Click(object sender, EventArgs e)
        {
            AddToCart("Áo Polo Pique Kẻ Sọc Phom Rộng");
        }

        protected void btnAdd4_Click(object sender, EventArgs e)
        {
            AddToCart("Thắt Lưng Nam Bản Nhỏ Da Bò Thật");
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("DemoSession_Cart.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // TODO 4: Gọi Session.Abandon(); và chuyển về "DemoSession_Login.aspx"
        }
    }
}
