<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bai_tap_demo_ASPX.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mb-4">
        <h2 class="fw-bold">Demo Quản lý Trạng thái trong ASP.NET WebForms</h2>
        <p class="text-muted">Khám phá cách hoạt động của Cookie, Session và ViewState qua tình huống Cửa hàng mini</p>
    </div>

    <!-- Card 1: Cookie -->
    <div class="card mb-4 shadow-sm">
        <div class="row g-0 align-items-center">
            <div class="col-md-5 p-3 text-center">
                <img src="images/cookie.jpg" class="img-fluid" style="max-height: 200px; object-fit: contain;" alt="Demo Cookie" />
            </div>
            <div class="col-md-7">
                <div class="card-body">
                    <span class="badge rounded-pill mb-2" style="background-color: #f97316;">Cookie</span>
                    <h4 class="card-title fw-bold">1. Demo Cookie</h4>
                    <p class="card-text text-muted">
                        Lưu trữ thông tin trực tiếp trên trình duyệt của người dùng và tự động hết hạn theo Expires.
                    </p>
                    <a href="DemoCookie.aspx" class="btn btn-outline-dark btn-sm rounded-pill px-3">Xem demo</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Card 2: Session -->
    <div class="card mb-4 shadow-sm">
        <div class="row g-0 align-items-center">
            <div class="col-md-5 p-3 text-center">
                <img src="images/session.jpg" class="img-fluid" style="max-height: 200px; object-fit: contain;" alt="Demo Session" />
            </div>
            <div class="col-md-7">
                <div class="card-body">
                    <span class="badge rounded-pill bg-primary mb-2">Session</span>
                    <h4 class="card-title fw-bold">2. Demo Session</h4>
                    <p class="card-text text-muted">
                        Lưu dữ liệu đăng nhập và giỏ hàng trên bộ nhớ Server, gắn với từng phiên làm việc.
                    </p>
                    <a href="DemoSession_Login.aspx" class="btn btn-outline-dark btn-sm rounded-pill px-3">Xem demo</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Card 3: ViewState -->
    <div class="card mb-4 shadow-sm">
        <div class="row g-0 align-items-center">
            <div class="col-md-5 p-3 text-center">
                <img src="images/viewstate.png" class="img-fluid" style="max-height: 200px; object-fit: contain;" alt="Demo ViewState" />
            </div>
            <div class="col-md-7">
                <div class="card-body">
                    <span class="badge rounded-pill bg-success mb-2">ViewState</span>
                    <h4 class="card-title fw-bold">3. Demo ViewState</h4>
                    <p class="card-text text-muted">
                        Đóng gói trạng thái vào thẻ ẩn trong HTML để giữ dữ liệu qua các lần Postback trên cùng một trang.
                    </p>
                    <a href="DemoViewState.aspx" class="btn btn-outline-dark btn-sm rounded-pill px-3">Xem demo</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
