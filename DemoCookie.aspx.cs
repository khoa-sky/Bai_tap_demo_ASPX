using System;
using System.Web;
using System.Web.UI;

namespace Bai_tap_demo_ASPX
{
    public partial class DemoCookie : System.Web.UI.Page
    {
        private const string CookieUserName = "username";
        private const string CookieTheme = "theme";

        private bool? _savedRememberInRequest;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Bọc trong !IsPostBack để không ghi đè dữ liệu người dùng vừa nhập khi bấm nút
            if (!IsPostBack)
            {
                LoadSavedUser();
                LoadSavedTheme();
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            UpdateCookieSummaryTable();
        }

        private void LoadSavedUser()
        {
            HttpCookie userCookie = Request.Cookies[CookieUserName];
            if (userCookie != null && !string.IsNullOrWhiteSpace(userCookie.Value))
            {
                string savedName = Server.UrlDecode(userCookie.Value);
                txtName.Text = savedName;
                ShowMessage(
                    string.Format("Xin chào, <strong>{0}</strong>! (Đã đọc từ Cookie)", Server.HtmlEncode(savedName)),
                    isWarning: false);
            }
        }

        private void LoadSavedTheme()
        {
            HttpCookie themeCookie = Request.Cookies[CookieTheme];
            string theme = (themeCookie != null && themeCookie.Value == "dark") ? "dark" : "light";
            ApplyTheme(theme);
        }

        protected void btnSaveCookie_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            if (string.IsNullOrEmpty(name))
            {
                ShowMessage("Vui lòng nhập tên của bạn trước khi lưu Cookie.", isWarning: true);
                return;
            }

            bool remember = chkRemember.Checked;
            _savedRememberInRequest = remember;
            SaveCookie(CookieUserName, Server.UrlEncode(name), remember);

            string safeName = Server.HtmlEncode(name);
            string expiryNote = remember
                ? "Hạn 7 ngày (có Expires) &mdash; tắt mở trình duyệt vẫn còn."
                : "Cookie phiên (không có Expires) &mdash; sẽ mất khi đóng hẳn trình duyệt.";

            ShowMessage(
                string.Format("Đã lưu Cookie cho <strong>{0}</strong>! {1}", safeName, expiryNote),
                isWarning: false);
        }

        protected void btnLight_Click(object sender, EventArgs e)
        {
            SaveCookie(CookieTheme, "light", rememberSevenDays: true);
            ApplyTheme("light");
        }

        protected void btnDark_Click(object sender, EventArgs e)
        {
            SaveCookie(CookieTheme, "dark", rememberSevenDays: true);
            ApplyTheme("dark");
        }

        private void SaveCookie(string name, string value, bool rememberSevenDays)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            if (rememberSevenDays)
            {
                cookie.Expires = DateTime.Now.AddDays(7);
            }

            // Xóa key cũ trong Response trước khi Add để tránh gửi trùng header Set-Cookie
            Response.Cookies.Remove(name);
            Response.Cookies.Add(cookie);

            // Đồng bộ ngay vào Request.Cookies để Thanh X-quang (Site1.Master) và bảng trạng thái cập nhật tức thì
            Request.Cookies.Set(cookie);
        }

        private void ApplyTheme(string theme)
        {
            bool isDark = string.Equals(theme, "dark", StringComparison.OrdinalIgnoreCase);

            pnlCookie.Attributes["data-bs-theme"] = isDark ? "dark" : "light";
            pnlCookie.Attributes["class"] = isDark
                ? "color-scheme-dark fg-body"
                : "color-scheme-light fg-body";

            btnLight.CssClass = isDark
                ? "btn btn-outline theme-secondary flex-fill fw-semibold"
                : "btn btn-solid theme-primary flex-fill fw-semibold";

            btnDark.CssClass = isDark
                ? "btn btn-solid theme-primary flex-fill fw-semibold"
                : "btn btn-outline theme-secondary flex-fill fw-semibold";

            lblThemeStatus.Text = isDark ? "Tối (Dark - lưu 7 ngày)" : "Sáng (Light)";
        }

        private void UpdateCookieSummaryTable()
        {
            HttpCookie userCookie = Request.Cookies[CookieUserName];
            if (userCookie != null && !string.IsNullOrWhiteSpace(userCookie.Value))
            {
                lblCookieUserVal.Text = Server.HtmlEncode(Server.UrlDecode(userCookie.Value));
                lblCookieUserVal.CssClass = "fw-semibold";

                if (_savedRememberInRequest.HasValue)
                {
                    lblCookieUserNote.Text = _savedRememberInRequest.Value
                        ? "Vừa lưu với hạn Expires 7 ngày (đóng mở lại trình duyệt vẫn còn)"
                        : "Vừa lưu dạng Session Cookie (không có Expires — đóng hẳn trình duyệt sẽ mất)";
                }
                else
                {
                    lblCookieUserNote.Text = "Đang tồn tại trên trình duyệt (mở F12 → Application → Cookies để xem cột Expires)";
                }
            }
            else
            {
                lblCookieUserVal.Text = "(trống)";
                lblCookieUserVal.CssClass = "fg-3";
                lblCookieUserNote.Text = "Chưa lưu hoặc đã bị xóa khi đóng trình duyệt / bấm Reset";
            }

            HttpCookie themeCookie = Request.Cookies[CookieTheme];
            if (themeCookie != null && !string.IsNullOrWhiteSpace(themeCookie.Value))
            {
                lblCookieThemeVal.Text = Server.HtmlEncode(themeCookie.Value);
                lblCookieThemeVal.CssClass = "fw-semibold";
                lblCookieThemeNote.Text = "Lưu giao diện với hạn Expires 7 ngày";
            }
            else
            {
                lblCookieThemeVal.Text = "(chưa lưu)";
                lblCookieThemeVal.CssClass = "fg-3";
                lblCookieThemeNote.Text = "Chưa chọn riêng — đang dùng mặc định: light";
            }
        }

        private void ShowMessage(string htmlMessage, bool isWarning)
        {
            pnlGreeting.Visible = true;
            pnlGreeting.CssClass = isWarning
                ? "alert theme-warning mb-0"
                : "alert theme-success mb-0";
            lblGreeting.Text = htmlMessage;
        }
    }
}
