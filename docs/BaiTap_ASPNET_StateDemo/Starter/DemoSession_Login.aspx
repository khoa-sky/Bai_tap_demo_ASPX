<%@ Page Title="Đăng nhập" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoSession_Login.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoSession_Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600&family=Cormorant+Garamond:wght@400;500;600&display=swap" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-3 p-md-4 rounded-4" style="background-color: #F5F5F3; font-family: 'Be Vietnam Pro', sans-serif; color: #202326;">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-9 col-xl-8">
                <div class="card border-0 shadow-sm rounded-4 overflow-hidden bg-white">
                    <div class="row g-0 align-items-stretch">
                        <!-- Cột trái: Ảnh thời trang -->
                        <div class="col-12 col-md-5 position-relative" style="min-height: 200px;">
                            <img src="images/Demo_Login_2.jpg" class="w-100 h-100 position-md-static" style="object-fit: cover; max-height: 430px;" alt="MINI STORE" />
                            <div class="position-absolute bottom-0 start-0 end-0 p-3 text-white" style="background: linear-gradient(to top, rgba(0,0,0,0.6), transparent);">
                                <p class="mb-0 small fst-italic" style="font-family: 'Cormorant Garamond', serif; font-size: 15px; letter-spacing: 0.05em;">Style your everyday.</p>
                            </div>
                        </div>

                        <!-- Cột phải: Form đăng nhập gọn trong 1 màn hình -->
                        <div class="col-12 col-md-7 p-4 d-flex flex-column justify-content-between">
                            <div>
                                <div class="text-uppercase mb-1" style="font-family: 'Cormorant Garamond', serif; font-size: 14px; font-weight: 600; letter-spacing: 0.16em;">MINI STORE</div>
                                <h2 class="text-uppercase mb-1" style="font-family: 'Cormorant Garamond', serif; font-size: 32px; font-weight: 500; letter-spacing: 0.08em; color: #202326;">Đăng nhập</h2>
                                <p class="small mb-3" style="color: #888888;">Chào mừng bạn quay trở lại.</p>

                                <div class="mb-3">
                                    <label for="<%= txtUsername.ClientID %>" class="form-label small fw-medium mb-1">Tài khoản</label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control py-2 rounded-3" style="border-color: #E5E5E5;" placeholder="Nhập tài khoản" />
                                    <asp:RequiredFieldValidator ID="rfvUsed" runat="server" ControlToValidate="txtUsername" CssClass="text-danger small" Display="Dynamic" ErrorMessage="Vui lòng nhập tài khoản"></asp:RequiredFieldValidator>
                                </div>

                                <div class="mb-3">
                                    <label for="<%= txtPassword.ClientID %>" class="form-label small fw-medium mb-1">Mật khẩu</label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control py-2 rounded-3" style="border-color: #E5E5E5;" TextMode="Password" placeholder="Nhập mật khẩu" />
                                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Vui lòng nhập mật khẩu!" ControlToValidate="txtPassword" CssClass="text-danger small" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>

                                <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập"
                                    CssClass="btn btn-dark w-100 py-2 rounded-3 fw-semibold"
                                    style="background-color: #202326; border-color: #202326;"
                                    OnClick="btnLogin_Click" />

                                <asp:Label ID="lblError" runat="server" CssClass="text-danger small d-block text-center mt-2 fw-medium" Visible="false" />
                            </div>

                            <div class="pt-3 mt-2 border-top small" style="color: #888888; font-size: 12px;">
                                &copy; 2026 MINI STORE.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
