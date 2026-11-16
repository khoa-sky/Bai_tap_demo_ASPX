<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Bai_tap_demo_ASPX.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center mb-4">
        <h2 class="fw-bold">Demo Quản lý Trạng thái trong ASP.NET WebForms</h2>
        <p class="text-muted">Khám phá cách hoạt động của Cookie, Session và ViewState qua tình huống Cửa hàng mini</p>
    </div>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card h-100 shadow-sm" style="border-top: 4px solid #f97316;">
                <div class="card-body d-flex flex-column">
                    <span class="badge align-self-start mb-2" style="background-color:#ffedd5; color:#c2410c;">Cookie</span>
                    <h4 class="card-title fw-bold">1. Demo Cookie</h4>
                    <p class="card-text text-muted flex-grow-1">Lưu ở trình duyệt, sống theo hạn Expires.</p>
                    <a href="DemoCookie.aspx" class="btn text-white fw-semibold" style="background-color:#f97316;">Mở Demo Cookie</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm" style="border-top: 4px solid #0d6efd;">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-primary bg-opacity-10 text-primary align-self-start mb-2">Session</span>
                    <h4 class="card-title fw-bold">2. Demo Session</h4>
                    <p class="card-text text-muted flex-grow-1">Lưu ở Server, giỏ hàng và đăng nhập theo phiên.</p>
                    <a href="DemoSession_Login.aspx" class="btn btn-primary fw-semibold">Mở Demo Session</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card h-100 shadow-sm" style="border-top: 4px solid #198754;">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success bg-opacity-10 text-success align-self-start mb-2">ViewState</span>
                    <h4 class="card-title fw-bold">3. Demo ViewState</h4>
                    <p class="card-text text-muted flex-grow-1">Lưu trong HTML ẩn, sống qua các lần Postback.</p>
                    <a href="DemoViewState.aspx" class="btn btn-success fw-semibold">Mở Demo ViewState</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
