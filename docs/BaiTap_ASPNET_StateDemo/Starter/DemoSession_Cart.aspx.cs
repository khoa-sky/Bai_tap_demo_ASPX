using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // TODO 1: Kiểm tra nếu Session["User"] == null -> đá về "DemoSession_Login.aspx" (nhớ thêm return;)

            if (!IsPostBack)
            {
                // TODO 2: Gán lblCartUser.Text = Session["User"].ToString(); và gọi LoadCart();
            }
        }

        private void LoadCart()
        {
            // TODO 3: Đọc Session["Cart"] as List<string> ?? new List<string>()
            // Nếu giỏ trống (Count == 0): bật pnlEmpty.Visible = true; tắt pnlCart.Visible = false;
            // Nếu có sản phẩm: bật pnlCart.Visible = true; hiển thị danh sách vào litCartRows.Text
            // và cập nhật lblTotal.Text, lblSummaryCount.Text, lblTotalPrice.Text
        }

        protected void btnBackToProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("DemoSession_Products.aspx");
        }

        protected void btnLogoutCart_Click(object sender, EventArgs e)
        {
            // TODO 4: Gọi Session.Abandon(); và chuyển về "DemoSession_Login.aspx"
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            // TODO 5: Gán Session["Cart"] = new List<string>(); và gọi lại LoadCart();
        }
    }
}
