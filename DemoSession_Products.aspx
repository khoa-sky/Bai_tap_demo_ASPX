<%@ Page Title="Sản phẩm" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoSession_Products.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoSession_Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4 class="text-primary mb-0">🛒 Cửa hàng mini — Sản phẩm (Xin chào: <asp:Label ID="lblUser" runat="server" CssClass="fw-bold" />)</h4>
        <div class="d-flex gap-2">
            <asp:Button ID="btnViewCart" runat="server" Text="Xem Giỏ hàng" CssClass="btn btn-primary fw-semibold" OnClick="btnViewCart_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Đăng xuất" CssClass="btn btn-outline-danger fw-semibold" OnClick="btnLogout_Click" />
        </div>
    </div>

    <div class="alert alert-info" role="alert">
        <strong>Lưu ý:</strong> Dữ liệu giỏ hàng được lưu trong <code>Session["Cart"]</code> trên RAM Server.
        Trình duyệt chỉ giữ cookie <code>ASP.NET_SessionId</code> (chuỗi vô nghĩa). Mở <strong>F12 → Application → Cookies</strong> để kiểm tra!
    </div>

    <asp:Label ID="lblMessage" runat="server" CssClass="text-success fw-semibold d-block mb-3" Visible="false" />

    <div class="row g-3">
        <!-- Sản phẩm 1 -->
        <div class="col-md-6">
            <div class="card h-100 shadow-sm">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h5 class="card-title mb-1">Áo thun ASP.NET</h5>
                        <p class="text-muted mb-0">150.000₫</p>
                    </div>
                    <asp:Button ID="btnAdd1" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-primary btn-sm" OnClick="btnAdd1_Click" />
                </div>
            </div>
        </div>

        <!-- Sản phẩm 2 -->
        <div class="col-md-6">
            <div class="card h-100 shadow-sm">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h5 class="card-title mb-1">Cốc sứ WebForms</h5>
                        <p class="text-muted mb-0">80.000₫</p>
                    </div>
                    <asp:Button ID="btnAdd2" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-primary btn-sm" OnClick="btnAdd2_Click" />
                </div>
            </div>
        </div>

        <!-- Sản phẩm 3 -->
        <div class="col-md-6">
            <div class="card h-100 shadow-sm">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h5 class="card-title mb-1">Sổ tay Dev</h5>
                        <p class="text-muted mb-0">60.000₫</p>
                    </div>
                    <asp:Button ID="btnAdd3" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-primary btn-sm" OnClick="btnAdd3_Click" />
                </div>
            </div>
        </div>

        <!-- Sản phẩm 4 -->
        <div class="col-md-6">
            <div class="card h-100 shadow-sm">
                <div class="card-body d-flex justify-content-between align-items-center">
                    <div>
                        <h5 class="card-title mb-1">Móc khóa C#</h5>
                        <p class="text-muted mb-0">35.000₫</p>
                    </div>
                    <asp:Button ID="btnAdd4" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-primary btn-sm" OnClick="btnAdd4_Click" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
