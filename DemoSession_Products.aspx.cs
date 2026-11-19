using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Chặn truy cập khi chưa đăng nhập
            if (Session["User"] == null)
            {
                Response.Redirect("DemoSession_Login.aspx");
            }

            if (!IsPostBack)
            {
                lblUser.Text = Session["User"].ToString();
                UpdateCartButton();
            }
        }

        private void UpdateCartButton()
        {
            var cart = Session["Cart"] as List<string> ?? new List<string>();
            btnViewCart.Text = "Xem Giỏ hàng (" + cart.Count + ")";
        }

        /// <summary>
        /// Thêm sản phẩm vào giỏ hàng: ép kiểu an toàn theo đúng hướng dẫn tài liệu
        /// </summary>
        private void AddToCart(string productName)
        {
            var cart = Session["Cart"] as List<string> ?? new List<string>();
            cart.Add(productName);
            Session["Cart"] = cart;

            lblMessage.Text = "✅ Đã thêm \"" + productName + "\" vào giỏ hàng!";
            lblMessage.Visible = true;
            UpdateCartButton();
        }

        protected void btnAdd1_Click(object sender, EventArgs e)
        {
            AddToCart("Áo thun ASP.NET");
        }

        protected void btnAdd2_Click(object sender, EventArgs e)
        {
            AddToCart("Cốc sứ WebForms");
        }

        protected void btnAdd3_Click(object sender, EventArgs e)
        {
            AddToCart("Sổ tay Dev");
        }

        protected void btnAdd4_Click(object sender, EventArgs e)
        {
            AddToCart("Móc khóa C#");
        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("DemoSession_Cart.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Hủy phiên theo đúng hướng dẫn: Session.Abandon()
            Session.Abandon();
            Response.Redirect("DemoSession_Login.aspx");
        }
    }
}