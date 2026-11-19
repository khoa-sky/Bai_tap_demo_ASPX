<%@ Page Title="Giỏ hàng" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoSession_Cart.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoSession_Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="text-primary mb-0">🛍️ Giỏ hàng của <asp:Label ID="lblCartUser" runat="server" CssClass="fw-bold" /></h4>
        <div class="d-flex gap-2">
            <asp:Button ID="btnBackToProducts" runat="server" Text="⬅️ Tiếp tục mua" CssClass="btn btn-outline-primary fw-semibold" OnClick="btnBackToProducts_Click" />
            <asp:Button ID="btnLogoutCart" runat="server" Text="🚪 Đăng xuất" CssClass="btn btn-outline-danger fw-semibold" OnClick="btnLogoutCart_Click" />
        </div>
    </div>

    <div class="alert alert-info" role="alert">
        <strong>Demo:</strong> Giỏ hàng được giữ nguyên khi chuyển trang vì <code>Session["Cart"]</code> sống trên RAM Server xuyên suốt phiên.
        Thử xóa cookie <code>ASP.NET_SessionId</code> trong DevTools rồi F5 — bạn sẽ bị đá về trang Login và mất giỏ!
    </div>

    <!-- Panel khi giỏ hàng trống -->
    <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
        <div class="text-center text-muted py-5">
            <div style="font-size: 64px;">🛒</div>
            <h5 class="mt-2">Giỏ hàng trống!</h5>
            <p>Hãy quay lại trang sản phẩm để thêm hàng.</p>
        </div>
    </asp:Panel>

    <!-- Panel khi giỏ hàng có sản phẩm -->
    <asp:Panel ID="pnlCart" runat="server" Visible="false">
        <table class="table table-bordered table-hover bg-white shadow-sm">
            <thead class="table-primary">
                <tr>
                    <th style="width: 60px;" class="text-center">#</th>
                    <th>Sản phẩm</th>
                </tr>
            </thead>
            <tbody>
                <asp:Literal ID="litCartRows" runat="server" />
            </tbody>
        </table>
        <div class="d-flex justify-content-between align-items-center">
            <span class="fw-semibold">Tổng: <asp:Label ID="lblTotal" runat="server" CssClass="text-primary fw-bold" /> sản phẩm</span>
            <asp:Button ID="btnClearCart" runat="server" Text="🗑️ Xóa toàn bộ giỏ" CssClass="btn btn-warning fw-semibold" OnClick="btnClearCart_Click" />
        </div>
    </asp:Panel>

</asp:Content>
