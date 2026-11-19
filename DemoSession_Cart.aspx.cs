using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoSession_Cart : System.Web.UI.Page
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
                lblCartUser.Text = Session["User"].ToString();
                LoadCart();
            }
        }

        /// <summary>
        /// Đọc Session["Cart"] và hiển thị danh sách sản phẩm trong bảng
        /// </summary>
        private void LoadCart()
        {
            var cart = Session["Cart"] as List<string> ?? new List<string>();

            if (cart.Count == 0)
            {
                pnlEmpty.Visible = true;
                pnlCart.Visible = false;
            }
            else
            {
                pnlEmpty.Visible = false;
                pnlCart.Visible = true;

                string rows = "";
                for (int i = 0; i < cart.Count; i++)
                {
                    rows += "<tr>";
                    rows += "<td class='text-center'>" + (i + 1) + "</td>";
                    rows += "<td>" + Server.HtmlEncode(cart[i]) + "</td>";
                    rows += "</tr>";
                }
                litCartRows.Text = rows;
                lblTotal.Text = cart.Count.ToString();
            }
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