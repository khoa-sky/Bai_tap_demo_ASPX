<%@ Page Title="Sản phẩm" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoSession_Products.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoSession_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600&display=swap" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Tiêu đề, giỏ hàng và đăng xuất -->
    <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4 pb-3 border-bottom">
        <div>
            <div class="text-uppercase text-muted small fw-semibold" style="letter-spacing: 0.12em;">MINI STORE</div>
            <h3 class="mb-0 text-uppercase" style="font-family: 'Cormorant Garamond', Georgia, serif; font-weight: 400; letter-spacing: 0.12em; color: #202326;">Thiết kế vừa ra mắt &mdash;
                <asp:Label ID="lblUser" runat="server" />
            </h3>
        </div>
        <div class="d-flex gap-2">
            <asp:Button ID="btnViewCart" runat="server" Text="Xem Giỏ hàng" CssClass="btn btn-dark rounded-pill px-3 fw-semibold" OnClick="btnViewCart_Click" />
            <asp:Button ID="btnLogout" runat="server" Text="Đăng xuất" CssClass="btn btn-outline-danger rounded-pill px-3 fw-semibold" OnClick="btnLogout_Click" />
        </div>
    </div>

    <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-success py-2 px-3 small fw-semibold d-block mb-4" Visible="false" />

    <div class="row g-4">
        <!-- Sản phẩm 1 -->
        <div class="col-6 col-md-3">
            <div class="h-100 d-flex flex-column">
                <div class="position-relative mb-2" style="background-color: #F5F5F3; border-radius: 6px; overflow: hidden;">
                    <span class="position-absolute top-0 start-0 m-2 badge bg-dark rounded-0" style="font-size: 11px;">MỚI</span>
                    <img src="images/ao_1.jpg" class="w-100" style="height: 270px; object-fit: cover;" alt="Áo Thun Cổ Tròn" />
                </div>
                <p class="small mb-1 flex-grow-1" style="color: #202326;">Áo Thun Cổ Tròn IceVibes Phom Rộng</p>
                <div class="mb-2">
                    <span class="fw-bold small" style="color: #202326;">261.600đ</span>
                    <span class="text-muted text-decoration-line-through ms-1" style="font-size: 12px;">327.000đ</span>
                </div>
                <asp:Button ID="btnAdd1" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-outline-dark btn-sm w-100 rounded-1" OnClick="btnAdd1_Click" />
            </div>
        </div>

        <!-- Sản phẩm 2 -->
        <div class="col-6 col-md-3">
            <div class="h-100 d-flex flex-column">
                <div class="position-relative mb-2" style="background-color: #F5F5F3; border-radius: 6px; overflow: hidden;">
                    <span class="position-absolute top-0 start-0 m-2 badge bg-dark rounded-0" style="font-size: 11px;">MỚI</span>
                    <img src="images/ao_2.jpg" class="w-100" style="height: 270px; object-fit: cover;" alt="Áo Thun Cổ Henley" />
                </div>
                <p class="small mb-1 flex-grow-1" style="color: #202326;">Áo Thun Cổ Henley CloudTouch Phom Rộng</p>
                <div class="mb-2">
                    <span class="fw-bold small" style="color: #202326;">277.600đ</span>
                    <span class="text-muted text-decoration-line-through ms-1" style="font-size: 12px;">347.000đ</span>
                </div>
                <asp:Button ID="btnAdd2" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-outline-dark btn-sm w-100 rounded-1" OnClick="btnAdd2_Click" />
            </div>
        </div>

        <!-- Sản phẩm 3 -->
        <div class="col-6 col-md-3">
            <div class="h-100 d-flex flex-column">
                <div class="position-relative mb-2" style="background-color: #F5F5F3; border-radius: 6px; overflow: hidden;">
                    <span class="position-absolute top-0 start-0 m-2 badge bg-dark rounded-0" style="font-size: 11px;">MỚI</span>
                    <img src="images/ao_3.jpg" class="w-100" style="height: 270px; object-fit: cover;" alt="Áo Polo Kẻ Sọc" />
                </div>
                <p class="small mb-1 flex-grow-1" style="color: #202326;">Áo Polo Pique Kẻ Sọc Phom Rộng</p>
                <div class="mb-2">
                    <span class="fw-bold small" style="color: #202326;">317.600đ</span>
                    <span class="text-muted text-decoration-line-through ms-1" style="font-size: 12px;">397.000đ</span>
                </div>
                <asp:Button ID="btnAdd3" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-outline-dark btn-sm w-100 rounded-1" OnClick="btnAdd3_Click" />
            </div>
        </div>

        <!-- Sản phẩm 4 -->
        <div class="col-6 col-md-3">
            <div class="h-100 d-flex flex-column">
                <div class="position-relative mb-2" style="background-color: #F5F5F3; border-radius: 6px; overflow: hidden;">
                    <span class="position-absolute top-0 start-0 m-2 badge bg-dark rounded-0" style="font-size: 11px;">MỚI</span>
                    <img src="images/thac_lung.jpg" class="w-100" style="height: 270px; object-fit: cover;" alt="Thắt Lưng Nam Da Bò" />
                </div>
                <p class="small mb-1 flex-grow-1" style="color: #202326;">Thắt Lưng Nam Bản Nhỏ Da Bò Thật</p>
                <div class="mb-2">
                    <span class="fw-bold small" style="color: #202326;">317.600đ</span>
                    <span class="text-muted text-decoration-line-through ms-1" style="font-size: 12px;">397.000đ</span>
                </div>
                <asp:Button ID="btnAdd4" runat="server" Text="Thêm vào giỏ" CssClass="btn btn-outline-dark btn-sm w-100 rounded-1" OnClick="btnAdd4_Click" />
            </div>
        </div>
    </div>

</asp:Content>
