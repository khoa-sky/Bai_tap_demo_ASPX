<%@ Page Title="Demo Cookie" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoCookie.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoCookie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        html:has(#pnlCookie[data-bs-theme="dark"]) body {
            background-color: #212529 !important;
            color: #dee2e6;
        }
        body > form .container {
            max-width: min(1320px, 94vw);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="pnlCookie" runat="server" clientidmode="Static" data-bs-theme="light" class="text-body">
        <!-- Tiêu đề trang -->
        <div class="mb-4">
            <span class="badge rounded-pill mb-2" style="background-color: #ffedd5; color: #c2410c;">Cookie</span>
            <h2 class="fw-bold mb-1">Demo Cookie &mdash; Lưu trên Trình duyệt</h2>
            <p class="text-muted mb-0">Dữ liệu được lưu trữ trực tiếp trên trình duyệt Client và tự động gửi kèm lên Server ở mỗi lần tải trang.</p>
        </div>

        <!-- Hàng 1: 2 Card chức năng chính -->
        <div class="row g-4 mb-4">
            <!-- Card trái: Lưu tên khách hàng -->
            <div class="col-12 col-md-6">
                <asp:Panel ID="pnlCustomerForm" runat="server" DefaultButton="btnSaveCookie" CssClass="card h-100 shadow-sm" style="border-top: 4px solid #f97316;">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold mb-1">1. Thông tin khách hàng</h5>
                        <p class="small text-muted mb-3">So sánh Cookie phiên (không Expires) và Cookie lưu 7 ngày (có Expires)</p>

                        <div class="mb-3">
                            <label for="txtName" class="form-label fw-medium">Tên của bạn</label>
                            <asp:TextBox ID="txtName" runat="server" ClientIDMode="Static" CssClass="form-control" placeholder="Ví dụ: SinhVienA" MaxLength="50" />
                        </div>

                        <div class="form-check mb-3">
                            <input type="checkbox" id="chkRemember" runat="server" clientidmode="Static" class="form-check-input" />
                            <label for="chkRemember" class="form-check-label" style="cursor: pointer;">Ghi nhớ tôi (7 ngày - có Expires)</label>
                        </div>

                        <asp:Button ID="btnSaveCookie" runat="server" Text="Lưu Cookie"
                            CssClass="btn w-100 fw-semibold mb-3"
                            style="background-color: #f97316; border-color: #f97316; color: #ffffff;"
                            OnClick="btnSaveCookie_Click" />

                        <asp:Panel ID="pnlGreeting" runat="server" Visible="false" CssClass="alert alert-success mb-0">
                            <asp:Label ID="lblGreeting" runat="server" />
                        </asp:Panel>
                    </div>
                </asp:Panel>
            </div>

            <!-- Card phải: Đổi Theme lưu trong Cookie -->
            <div class="col-12 col-md-6">
                <div class="card h-100 shadow-sm">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title fw-bold mb-1">2. Giao diện (Theme Cookie)</h5>
                        <p class="small text-muted mb-3">Lưu tùy chọn Sáng / Tối vào Cookie với thời hạn 7 ngày</p>

                        <div class="btn-group w-100 mb-3" role="group" aria-label="Chọn giao diện Sáng hoặc Tối">
                            <asp:Button ID="btnLight" runat="server" Text="Chế độ Sáng (Light)"
                                CssClass="btn btn-primary w-50 fw-semibold"
                                OnClick="btnLight_Click" />
                            <asp:Button ID="btnDark" runat="server" Text="Chế độ Tối (Dark)"
                                CssClass="btn btn-outline-secondary w-50 fw-semibold"
                                OnClick="btnDark_Click" />
                        </div>

                        <div class="small text-muted">
                            Giao diện đang áp dụng:
                            <asp:Label ID="lblThemeStatus" runat="server" CssClass="fw-semibold" Text="Sáng (Light - mặc định)" />
                        </div>
                    </div>
                    <div class="card-footer small text-muted">
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
                        <h5 class="card-title fw-bold mb-1">Trạng thái Cookie hiện tại (<code>Request.Cookies</code>)</h5>
                        <p class="small text-muted mb-3">Dữ liệu thực tế mà trình duyệt đang gửi lên trang Demo Cookie</p>

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
                                        <td class="small text-muted"><asp:Label ID="lblCookieUserNote" runat="server" Text="Chưa lưu" /></td>
                                    </tr>
                                    <tr>
                                        <td><code>theme</code></td>
                                        <td><asp:Label ID="lblCookieThemeVal" runat="server" Text="(chưa lưu)" /></td>
                                        <td class="small text-muted"><asp:Label ID="lblCookieThemeNote" runat="server" Text="Đang dùng mặc định: light" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="small text-muted">
                            Kiểm tra chi tiết hạn <code>Expires</code>: nhấn <strong>F12</strong> &rarr; tab <strong>Application</strong> &rarr; <strong>Cookies</strong> &rarr; chọn địa chỉ <code>localhost</code>.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
