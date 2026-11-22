using System;
using System.Collections.Generic;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoViewState : System.Web.UI.Page
    {
        // Biến thường (không dùng static) để đối chiếu với ViewState
        private int _normalCounter = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            // TODO 1: Tăng _normalCounter lên 1 và gán vào lblNormalVar.Text
            // TODO 2: Đọc ViewState["Count"] (nếu null thì bắt đầu từ 1, ngược lại + 1),
            // lưu lại vào ViewState["Count"] và gán lên lblViewStateVar.Text
        }

        protected void btnSetText_Click(object sender, EventArgs e)
        {
            // TODO 3: Gán chữ bất kỳ cho cả lblA.Text và lblB.Text
        }

        protected void btnPostbackTest_Click(object sender, EventArgs e)
        {
            // Để trống để kích hoạt Postback và quan sát lblA (EnableViewState=true) vs lblB (false)
        }

        protected void btnLoad100_Click(object sender, EventArgs e)
        {
            // TODO 4: Bật gvProducts.EnableViewState = true; gọi BindSampleRows();
            // và cập nhật thông báo lên lblGridStatus.Text
        }

        protected void btnDisableGridViewState_Click(object sender, EventArgs e)
        {
            // TODO 5: Tắt gvProducts.EnableViewState = false; gọi BindSampleRows();
            // và cập nhật thông báo lên lblGridStatus.Text
        }

        private void BindSampleRows()
        {
            // TODO 6: Tạo List gồm 100 phần tử mẫu và gán vào gvProducts.DataSource = ...; gvProducts.DataBind();
        }
    }
}
