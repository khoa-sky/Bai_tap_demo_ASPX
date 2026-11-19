using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoViewState : System.Web.UI.Page
    {
        // Biến thường cấp class (tuyệt đối không dùng static) — tự reset về 0 sau mỗi Postback
        private int x = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (gvProducts.HeaderRow != null)
            {
                gvProducts.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

            if (gvProducts.Rows.Count == 0 && string.Equals(ViewState["GridMode"] as string, "disabled", StringComparison.Ordinal))
            {
                lblGridStatus.Text = "GridView đã trống — dữ liệu 100 dòng bị mất sau Postback vì ViewState của GridView đã tắt!";
            }
        }

        // 1. Bộ đếm Postback: Biến thường (int x) vs ViewState["Count"]
        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            x++;
            lblNormalVar.Text = x.ToString();

            int vsCount = (ViewState["Count"] != null) ? (int)ViewState["Count"] + 1 : 1;
            ViewState["Count"] = vsCount;
            lblViewStateVar.Text = vsCount.ToString();
        }

        // 2. Bật / Tắt EnableViewState cho lblA (true) và lblB (false)
        protected void btnSetText_Click(object sender, EventArgs e)
        {
            lblA.Text = "Xin chào!";
            lblB.Text = "Xin chào!";
        }

        protected void btnPostbackTest_Click(object sender, EventArgs e)
        {
            // Nút rỗng chỉ để kích hoạt Postback: lblA giữ chữ, lblB quay về rỗng ("")
        }

        // 3. GridView 100 dòng: Bật vs Tắt ViewState
        protected void btnLoad100_Click(object sender, EventArgs e)
        {
            gvProducts.EnableViewState = true;
            ViewState["GridMode"] = "enabled";
            BindSampleRows();
            lblGridStatus.Text = "Đang BẬT ViewState (100 dòng) — hãy nhìn Thanh X-quang ở trên thấy kích thước tăng vọt (có thể bấm Ctrl+U xem __VIEWSTATE)!";
        }

        protected void btnDisableGridViewState_Click(object sender, EventArgs e)
        {
            gvProducts.EnableViewState = false;
            ViewState["GridMode"] = "disabled";
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