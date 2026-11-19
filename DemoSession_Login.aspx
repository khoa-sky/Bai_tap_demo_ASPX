<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoSession_Login.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoSession_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow border-primary">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">🔐 Đăng nhập (Session)</h4>
                </div>
                <div class="card-body">
                    <p class="text-muted text-center mb-3">
                        Nhập <strong>admin / 123</strong> để đăng nhập.<br />
                        Server sẽ lưu <code>Session["User"]</code> và <code>Session["Cart"]</code> trên RAM.
                    </p>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Tên đăng nhập</label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="admin" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Mật khẩu</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="123" />
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-primary w-100 fw-semibold" OnClick="btnLogin_Click" />

                    <asp:Label ID="lblError" runat="server" CssClass="text-danger d-block text-center mt-3 fw-semibold" Visible="false" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
