<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoSession_Cart.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoSession_Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Thanh tiêu đề Giỏ hàng -->
    <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 pb-3 mb-4 border-bottom">
        <div class="d-flex align-items-center gap-3">
            <img src="images/shopping-bag.png" width="38" height="38" class="object-fit-contain" alt="Giỏ hàng" />
            <div>
                <h3 class="fw-bold mb-0 text-dark">
                    Giỏ hàng của <asp:Label ID="lblCartUser" runat="server" />
                </h3>
                <p class="text-secondary small mb-0">
                    Lưu trong <code>Session["Cart"]</code> trên Server &bull; Giữ nguyên khi chuyển trang
                </p>
            </div>
        </div>
        <div class="d-flex flex-wrap gap-2">
            <asp:LinkButton ID="btnBackToProducts" runat="server"
                CssClass="btn btn-outline-dark rounded-pill px-3 fw-semibold d-inline-flex align-items-center gap-2"
                OnClick="btnBackToProducts_Click">
                <img src="images/store_icon.png" width="18" height="18" alt="" />
                <span>Tiếp tục mua</span>
            </asp:LinkButton>
            <asp:LinkButton ID="btnLogoutCart" runat="server"
                CssClass="btn btn-outline-danger rounded-pill px-3 fw-semibold d-inline-flex align-items-center gap-2"
                OnClick="btnLogoutCart_Click">
                <img src="images/logout_icon.png" width="18" height="18" alt="" />
                <span>Đăng xuất</span>
            </asp:LinkButton>
        </div>
    </div>

    <!-- Panel khi giỏ hàng trống -->
    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
        <div class="card border rounded-4 shadow-sm bg-white text-center py-5 px-3">
            <div class="card-body">
                <img src="images/shopping-bag.png" width="64" height="64" class="opacity-50 mb-3" alt="Giỏ trống" />
                <h4 class="fw-bold text-dark mb-2">Giỏ hàng đang trống</h4>
                <p class="text-secondary small mb-4">Hãy quay lại cửa hàng để chọn sản phẩm và quan sát Session hoạt động.</p>
                <a href="DemoSession_Products.aspx" class="btn btn-dark rounded-pill px-4 py-2 fw-semibold d-inline-flex align-items-center gap-2">
                    <img src="images/store_icon.png" width="18" height="18" alt="" />
                    <span>Chọn sản phẩm ngay</span>
                </a>
            </div>
        </div>
    </asp:Panel>

    <!-- Panel khi giỏ hàng có sản phẩm -->
    <asp:Panel ID="pnlCart" runat="server" Visible="false">
        <div class="row g-4 align-items-start">
            <!-- Cột trái: Danh sách sản phẩm kèm hình ảnh -->
            <div class="col-12 col-lg-8">
                <div class="card border rounded-4 shadow-sm bg-white overflow-hidden">
                    <div class="card-header bg-white py-3 px-4 border-bottom d-flex justify-content-between align-items-center">
                        <span class="fw-semibold text-dark">Sản phẩm đã chọn</span>
                        <span class="badge rounded-pill text-bg-dark">
                            <asp:Label ID="lblTotal" runat="server" /> món
                        </span>
                    </div>
                    <div class="list-group list-group-flush">
                        <asp:Literal ID="litCartRows" runat="server" />
                    </div>
                </div>
            </div>

            <!-- Cột phải: Tóm tắt giỏ hàng & Thao tác -->
            <div class="col-12 col-lg-4">
                <div class="card border rounded-4 shadow-sm bg-white">
                    <div class="card-body p-4">
                        <h5 class="fw-bold text-dark mb-3">Tóm tắt giỏ hàng</h5>

                        <div class="d-flex justify-content-between align-items-center mb-2 small">
                            <span class="text-secondary">Tổng số lượng</span>
                            <span class="fw-semibold text-dark"><asp:Label ID="lblSummaryCount" runat="server" /> sản phẩm</span>
                        </div>

                        <div class="d-flex justify-content-between align-items-center pb-3 mb-3 border-bottom">
                            <span class="text-secondary small">Tạm tính</span>
                            <span class="fs-5 fw-bold text-dark"><asp:Label ID="lblTotalPrice" runat="server" /></span>
                        </div>

                        <div class="alert alert-light border small text-secondary mb-3 rounded-3">
                            Thử xóa cookie <code>ASP.NET_SessionId</code> trong <strong>F12</strong> rồi bấm <strong>F5</strong> — bạn sẽ mất giỏ hàng và bị đưa về trang Đăng nhập.
                        </div>

                        <asp:LinkButton ID="btnClearCart" runat="server"
                            CssClass="btn btn-outline-danger w-100 rounded-3 py-2 fw-semibold d-inline-flex align-items-center justify-content-center gap-2"
                            OnClick="btnClearCart_Click">
                            <img src="images/bin.png" width="18" height="18" alt="" />
                            <span>Xóa toàn bộ giỏ</span>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

</asp:Content>
