<%@ Page Title="Demo Cookie" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoCookie.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoCookie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        html:has(#pnlCookie[data-bs-theme="light"]) {
            color-scheme: light;
        }
        html:has(#pnlCookie[data-bs-theme="light"]) body {
            background-color: #f8fafc;
            color: #0f172a;
        }
        html:has(#pnlCookie[data-bs-theme="dark"]) body {
            background-color: #0f172a;
            color: #f8fafc;
        }
        nav.navbar {
            color-scheme: light;
        }
        body > form .container {
            max-width: min(1320px, 94vw);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="pnlCookie" runat="server" clientidmode="Static" data-bs-theme="light" class="color-scheme-light fg-body">
        <!-- Tiêu đề trang -->
        <div class="mb-5">
            <span class="badge mb-2" style="background-color: #ffedd5; color: #c2410c;">Cookie</span>
            <h2 class="fw-bold mb-1">Demo Cookie &mdash; Lưu trên Trình duyệt</h2>
            <p class="fg-3 mb-0">Dữ liệu được lưu trữ trực tiếp trên trình duyệt Client và tự động gửi kèm lên Server ở mỗi lần tải trang.</p>
        </div>

        <!-- Hàng 1: 2 Card chức năng chính -->
        <div class="row g-5 mb-5">
            <!-- Card trái: Lưu tên khách hàng -->
            <div class="col-12 md:col-6">
                <asp:Panel ID="pnlCustomerForm" runat="server" DefaultButton="btnSaveCookie" CssClass="card h-100 shadow-sm" style="border-top: 4px solid #f97316;">
                    <div class="card-body d-flex flex-column gap-4">
                        <div>
                            <h5 class="card-title fw-bold mb-1">1. Thông tin khách hàng</h5>
                            <p class="small fg-3 mb-0">So sánh Cookie phiên (không Expires) và Cookie lưu 7 ngày (có Expires)</p>
                        </div>

                        <div>
                            <label for="txtName" class="form-label">Tên của bạn</label>
                            <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Ví dụ: SinhVienA" MaxLength="50" />
                        </div>

                        <div class="d-flex align-items-center gap-2">
                            <input type="checkbox" id="chkRemember" runat="server" clientidmode="Static" class="check theme-primary" />
                            <label for="chkRemember" class="form-label mb-0" style="cursor: pointer;">Ghi nhớ tôi (7 ngày - có Expires)</label>
                        </div>

                        <asp:Button ID="btnSaveCookie" runat="server" Text="Lưu Cookie"
                            CssClass="btn btn-solid w-100 fw-semibold"
                            style="background-color: #f97316; border-color: #f97316; color: #ffffff;"
                            OnClick="btnSaveCookie_Click" />

                        <asp:Panel ID="pnlGreeting" runat="server" Visible="false" CssClass="alert theme-success mb-0">
                            <asp:Label ID="lblGreeting" runat="server" />
                        </asp:Panel>
                    </div>
                </asp:Panel>
            </div>

            <!-- Card phải: Đổi Theme lưu trong Cookie -->
            <div class="col-12 md:col-6">
                <div class="card h-100 shadow-sm">
                    <div class="card-body d-flex flex-column gap-4">
                        <div>
                            <h5 class="card-title fw-bold mb-1">2. Giao diện (Theme Cookie)</h5>
                            <p class="small fg-3 mb-0">Lưu tùy chọn Sáng / Tối vào Cookie với thời hạn 7 ngày</p>
                        </div>

                        <div class="btn-group w-100" role="group" aria-label="Chọn giao diện Sáng hoặc Tối">
                            <asp:Button ID="btnLight" runat="server" Text="Chế độ Sáng (Light)"
                                CssClass="btn btn-solid theme-primary flex-fill fw-semibold"
                                OnClick="btnLight_Click" />
                            <asp:Button ID="btnDark" runat="server" Text="Chế độ Tối (Dark)"
                                CssClass="btn btn-outline theme-secondary flex-fill fw-semibold"
                                OnClick="btnDark_Click" />
                        </div>

                        <div class="small fg-3">
                            Giao diện đang áp dụng:
                            <asp:Label ID="lblThemeStatus" runat="server" CssClass="fw-semibold" Text="Sáng (Light - mặc định)" />
                        </div>
                    </div>
                    <div class="card-footer small fg-3">
                        Mẹo: Sau khi thử lưu không tích &ldquo;Ghi nhớ tôi&rdquo;, hãy <strong>đóng hẳn toàn bộ cửa sổ trình duyệt</strong> rồi mở lại để kiểm chứng.
                    </div>
                </div>
            </div>
        </div>

        <!-- Hàng 2: Bảng tổng quan Cookie hiện tại -->
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-3">
                            <div>
                                <h5 class="card-title fw-bold mb-1">Trạng thái Cookie hiện tại (<code>Request.Cookies</code>)</h5>
                                <p class="small fg-3 mb-0">Dữ liệu thực tế mà trình duyệt đang gửi lên trang Demo Cookie</p>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-bordered align-middle mb-3">
                                <thead>
                                    <tr>
                                        <th style="width: 22%;">Tên Cookie</th>
                                        <th style="width: 28%;">Giá trị hiện tại</th>
                                        <th>Trạng thái / Thời hạn</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><code>username</code></td>
                                        <td><asp:Label ID="lblCookieUserVal" runat="server" Text="(trống)" /></td>
                                        <td class="small fg-3"><asp:Label ID="lblCookieUserNote" runat="server" Text="Chưa lưu" /></td>
                                    </tr>
                                    <tr>
                                        <td><code>theme</code></td>
                                        <td><asp:Label ID="lblCookieThemeVal" runat="server" Text="(chưa lưu)" /></td>
                                        <td class="small fg-3"><asp:Label ID="lblCookieThemeNote" runat="server" Text="Đang dùng mặc định: light" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="small fg-3">
                            Kiểm tra chi tiết hạn <code>Expires</code>: nhấn <strong>F12</strong> &rarr; tab <strong>Application</strong> &rarr; <strong>Cookies</strong> &rarr; chọn địa chỉ <code>localhost</code>.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
