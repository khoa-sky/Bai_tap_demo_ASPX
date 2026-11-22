using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Cart : System.Web.UI.Page
    {
        private class ProductInfo
        {
            public string ImageUrl { get; set; }
            public int Price { get; set; }
        }

        private static readonly Dictionary<string, ProductInfo> ProductCatalog = new Dictionary<string, ProductInfo>
        {
            { "Áo Thun Cổ Tròn IceVibes Phom Rộng", new ProductInfo { ImageUrl = "images/ao_1.jpg", Price = 261600 } },
            { "Áo Thun Cổ Henley CloudTouch Phom Rộng", new ProductInfo { ImageUrl = "images/ao_2.jpg", Price = 277600 } },
            { "Áo Polo Pique Kẻ Sọc Phom Rộng", new ProductInfo { ImageUrl = "images/ao_3.jpg", Price = 317600 } },
            { "Thắt Lưng Nam Bản Nhỏ Da Bò Thật", new ProductInfo { ImageUrl = "images/thac_lung.jpg", Price = 317600 } }
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            // Chặn truy cập khi chưa đăng nhập
            if (Session["User"] == null)
            {
                Response.Redirect("DemoSession_Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblCartUser.Text = Session["User"].ToString();
                LoadCart();
            }
        }

        /// <summary>
        /// Đọc Session["Cart"], gom nhóm theo sản phẩm và hiển thị kèm hình ảnh + giá
        /// </summary>
        private void LoadCart()
        {
            var cart = Session["Cart"] as List<string> ?? new List<string>();

            if (cart.Count == 0)
            {
                pnlEmpty.Visible = true;
                pnlCart.Visible = false;
                return;
            }

            pnlEmpty.Visible = false;
            pnlCart.Visible = true;

            var grouped = cart
                .GroupBy(name => name)
                .Select(g => new { Name = g.Key, Qty = g.Count() })
                .ToList();

            var sb = new StringBuilder();
            int totalPrice = 0;

            foreach (var item in grouped)
            {
                ProductInfo info;
                if (!ProductCatalog.TryGetValue(item.Name, out info))
                {
                    info = new ProductInfo { ImageUrl = "images/shopping-bag.png", Price = 0 };
                }

                int lineTotal = info.Price * item.Qty;
                totalPrice += lineTotal;

                string safeName = Server.HtmlEncode(item.Name);
                string unitPriceText = info.Price > 0 ? string.Format("{0:N0}đ", info.Price) : "";
                string lineTotalText = info.Price > 0 ? string.Format("{0:N0}đ", lineTotal) : "";

                sb.Append("<div class='list-group-item p-3 px-4 d-flex align-items-center gap-3'>");
                sb.Append("  <img src='" + info.ImageUrl + "' width='72' height='72' class='rounded-3 object-fit-cover bg-light border flex-shrink-0' alt='" + safeName + "' />");
                sb.Append("  <div class='flex-grow-1'>");
                sb.Append("    <h6 class='fw-semibold text-dark mb-1'>" + safeName + "</h6>");
                sb.Append("    <div class='small text-secondary'>Đơn giá: " + unitPriceText + "</div>");
                sb.Append("  </div>");
                sb.Append("  <div class='text-end flex-shrink-0'>");
                sb.Append("    <span class='badge rounded-pill text-bg-light border text-dark mb-1'>SL: " + item.Qty + "</span>");
                sb.Append("    <div class='fw-bold text-dark'>" + lineTotalText + "</div>");
                sb.Append("  </div>");
                sb.Append("</div>");
            }

            litCartRows.Text = sb.ToString();
            lblTotal.Text = cart.Count.ToString();
            lblSummaryCount.Text = cart.Count.ToString();
            lblTotalPrice.Text = string.Format("{0:N0}đ", totalPrice);
        }

        protected void btnBackToProducts_Click(object sender, EventArgs e)
        {
            Response.Redirect("DemoSession_Products.aspx");
        }

        protected void btnLogoutCart_Click(object sender, EventArgs e)
        {
            // Hủy phiên: Session.Abandon() xóa sạch phiên trên Server
            Session.Abandon();
            Response.Redirect("DemoSession_Login.aspx");
        }

        protected void btnClearCart_Click(object sender, EventArgs e)
        {
            // Chỉ xóa giỏ hàng, giữ nguyên phiên đăng nhập
            Session["Cart"] = new List<string>();
            LoadCart();
        }
    }
}