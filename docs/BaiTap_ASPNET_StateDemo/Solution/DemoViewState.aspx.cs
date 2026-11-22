using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoViewState : System.Web.UI.Page
    {
        // Biến thường cấp class (không dùng static) — sẽ tự reset về 0 sau mỗi lần Postback
        private int _normalCounter = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // 1. Bộ đếm Postback: Biến thường vs ViewState
        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            _normalCounter++;
            lblNormalVar.Text = _normalCounter.ToString();

            int vsCount = (ViewState["Count"] != null) ? (int)ViewState["Count"] + 1 : 1;
            ViewState["Count"] = vsCount;
            lblViewStateVar.Text = vsCount.ToString();
        }

        // 2. Bật / Tắt EnableViewState cho lblA (true) và lblB (false)
        protected void btnSetText_Click(object sender, EventArgs e)
        {
            lblA.Text = "Xin chào! (Còn giữ)";
            lblB.Text = "Xin chào! (Sẽ mất)";
        }

        protected void btnPostbackTest_Click(object sender, EventArgs e)
        {
            // Nút rỗng chỉ để kích hoạt Postback: lblA giữ chữ, lblB quay về mặc định "(chưa gán)"
        }

        // 3. GridView 100 dòng: Bật vs Tắt ViewState
        protected void btnLoad100_Click(object sender, EventArgs e)
        {
            gvProducts.EnableViewState = true;
            BindSampleRows();
            lblGridStatus.Text = "Đang BẬT ViewState (100 dòng) — hãy nhìn Thanh X-quang ở trên thấy kích thước tăng vọt!";
        }

        protected void btnDisableGridViewState_Click(object sender, EventArgs e)
        {
            gvProducts.EnableViewState = false;
            BindSampleRows();
            lblGridStatus.Text = "Đã TẮT ViewState cho GridView — bảng vẫn đủ 100 dòng nhưng Thanh X-quang tụt nhỏ lại ngay!";
        }

        private void BindSampleRows()
        {
            var items = new List<object>();
            for (int i = 1; i <= 100; i++)
            {
                items.Add(new
                {
                    STT = i,
                    SanPham = "Sản phẩm MINI STORE #" + i,
                    DanhMuc = (i % 2 == 0) ? "Áo thun" : "Phụ kiện",
                    GiaBan = string.Format("{0:N0}đ", 150000 + (i * 5000))
                });
            }
            gvProducts.DataSource = items;
            gvProducts.DataBind();
        }
    }
}