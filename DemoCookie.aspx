<%@ Page Title="Demo Cookie" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoCookie.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoCookie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet" />
    <style>
        #pnlCookie {
            font-family: 'Be Vietnam Pro', -apple-system, BlinkMacSystemFont, sans-serif;
            border-radius: 16px;
            padding: 28px;
            transition: background-color 0.25s ease, color 0.25s ease;
        }
        #pnlCookie[data-bs-theme="light"] {
            background-color: #F8FAFC;
            color: #0F172A;
            border: 1px solid #E2E8F0;
        }
        #pnlCookie[data-bs-theme="dark"] {
            background-color: #0B1120;
            color: #F1F5F9;
            border: 1px solid #1E293B;
        }
        #pnlCookie[data-bs-theme="dark"] .cookie-panel {
            background-color: #1E293B !important;
            border-color: #334155 !important;
            color: #F1F5F9;
        }
        #pnlCookie[data-bs-theme="dark"] .text-secondary {
            color: #94A3B8 !important;
        }
        #pnlCookie[data-bs-theme="dark"] .form-control {
            background-color: #0F172A;
            border-color: #334155;
            color: #F1F5F9;
        }
        #pnlCookie[data-bs-theme="dark"] .table {
            color: #F1F5F9;
            --bs-table-bg: transparent;
            --bs-table-border-color: #334155;
        }
        .theme-icon-box {
            width: 64px;
            height: 64px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.2s ease, opacity 0.2s ease, background-color 0.2s ease;
        }
        .theme-icon-box img {
            width: 38px;
            height: 38px;
            object-fit: contain;
        }
        #pnlCookie[data-bs-theme="light"] .icon-sun {
            background-color: #FEF3C7;
            opacity: 1;
            transform: scale(1.05);
        }
        #pnlCookie[data-bs-theme="light"] .icon-moon {
            background-color: #F1F5F9;
            opacity: 0.4;
        }
        #pnlCookie[data-bs-theme="dark"] .icon-sun {
            background-color: #0F172A;
            opacity: 0.35;
        }
        #pnlCookie[data-bs-theme="dark"] .icon-moon {
            background-color: #312E81;
            opacity: 1;
            transform: scale(1.05);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="pnlCookie" runat="server" clientidmode="Static" data-bs-theme="light">
        <!-- Tiêu đề gọn, ngôn ngữ tự nhiên -->
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4">
            <div>
                <h2 class="fw-bold mb-1" style="letter-spacing: -0.02em;">Ghi nhớ khách hàng bằng Cookie</h2>
                <p class="text-secondary small mb-0">Dữ liệu được lưu ngay trên trình duyệt của bạn và tự động gửi kèm lên Server.</p>
            </div>
            <span class="badge rounded-pill px-3 py-2 fw-medium" style="background-color: #EA580C; color: #FFFFFF;">Lưu tại Trình duyệt</span>
        </div>

        <!-- Bố cục 2 cột bất đối xứng: Form (7) + Sun/Moon Theme (5) -->
        <div class="row g-3 mb-3">
            <!-- Cột trái: Lưu tên khách hàng -->
            <div class="col-12 col-lg-7">
                <asp:Panel ID="pnlCustomerForm" runat="server" DefaultButton="btnSaveCookie" CssClass="card cookie-panel h-100 border rounded-4 shadow-sm bg-white">
                    <div class="card-body p-4 d-flex flex-column justify-content-between gap-3">
                        <div>
                            <h5 class="fw-semibold mb-1">Tên khách hàng</h5>
                            <p class="small text-secondary mb-3">Thử lưu có và không chọn ghi nhớ để đối chiếu sau khi đóng hẳn trình duyệt.</p>

                            <div class="mb-3">
                                <label for="txtName" class="form-label small fw-medium mb-1">Tên hiển thị</label>
                                <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control py-2 rounded-3" placeholder="Nhập tên của bạn (ví dụ: Minh)" MaxLength="50" />
                            </div>

                            <div class="form-check">
                                <input type="checkbox" id="chkRemember" runat="server" clientidmode="Static" class="form-check-input" />
                                <label for="chkRemember" class="form-check-label small" style="cursor: pointer;">Ghi nhớ tôi trong 7 ngày (gán Expires)</label>
                            </div>
                        </div>

                        <div>
                            <asp:Button ID="btnSaveCookie" runat="server" Text="Lưu Cookie"
                                CssClass="btn w-100 py-2 rounded-3 fw-semibold text-white"
                                style="background-color: #EA580C; border-color: #EA580C;"
                                OnClick="btnSaveCookie_Click" />

                            <asp:Panel ID="pnlGreeting" runat="server" Visible="false" CssClass="alert alert-success small py-2 px-3 mt-3 mb-0 rounded-3">
                                <asp:Label ID="lblGreeting" runat="server" />
                            </asp:Panel>
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <!-- Cột phải: Sun & Moon Theme Switcher -->
            <div class="col-12 col-lg-5">
                <div class="card cookie-panel h-100 border rounded-4 shadow-sm bg-white">
                    <div class="card-body p-4 d-flex flex-column justify-content-between gap-3">
                        <div>
                            <h5 class="fw-semibold mb-1">Giao diện Sáng / Tối</h5>
                            <p class="small text-secondary mb-3">Lưu lựa chọn vào cookie <code>theme</code> (7 ngày).</p>

                            <!-- Trực quan Sun / Moon -->
                            <div class="d-flex justify-content-center align-items-center gap-3 py-2 mb-3">
                                <div class="theme-icon-box icon-sun">
                                    <img src="images/sun.png" alt="Chế độ Sáng" />
                                </div>
                                <span class="text-secondary small fw-medium">hoặc</span>
                                <div class="theme-icon-box icon-moon">
                                    <img src="images/moon.png" alt="Chế độ Tối" />
                                </div>
                            </div>

                            <div class="d-flex gap-2 mb-2">
                                <asp:Button ID="btnLight" runat="server" Text="Sáng (Light)"
                                    CssClass="btn btn-dark flex-fill rounded-3 py-2 fw-semibold"
                                    OnClick="btnLight_Click" />
                                <asp:Button ID="btnDark" runat="server" Text="Tối (Dark)"
                                    CssClass="btn btn-outline-dark flex-fill rounded-3 py-2 fw-semibold"
                                    OnClick="btnDark_Click" />
                            </div>
                        </div>

                        <div class="small text-secondary pt-2 border-top">
                            Đang dùng: <asp:Label ID="lblThemeStatus" runat="server" CssClass="fw-semibold" Text="Sáng (Light)" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bảng trạng thái Cookie hiện tại -->
        <div class="card cookie-panel border rounded-4 shadow-sm bg-white">
            <div class="card-body p-3 px-4">
                <div class="d-flex justify-content-between align-items-center mb-2">
                    <h6 class="fw-semibold mb-0">Cookie trình duyệt đang gửi lên (<code>Request.Cookies</code>)</h6>
                    <span class="small text-secondary">Đóng hẳn trình duyệt để kiểm chứng Expires</span>
                </div>
                <div class="table-responsive">
                    <table class="table table-sm align-middle mb-0">
                        <thead>
                            <tr class="small text-secondary">
                                <th style="width: 18%;">Tên Cookie</th>
                                <th style="width: 26%;">Giá trị</th>
                                <th>Trạng thái / Thời hạn</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><code>username</code></td>
                                <td><asp:Label ID="lblCookieUserVal" runat="server" Text="(trống)" /></td>
                                <td class="small text-secondary"><asp:Label ID="lblCookieUserNote" runat="server" Text="Chưa lưu" /></td>
                            </tr>
                            <tr>
                                <td><code>theme</code></td>
                                <td><asp:Label ID="lblCookieThemeVal" runat="server" Text="(chưa lưu)" /></td>
                                <td class="small text-secondary"><asp:Label ID="lblCookieThemeNote" runat="server" Text="Chưa chọn riêng" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
