<%@ Page Title="Demo ViewState" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DemoViewState.aspx.cs" Inherits="Bai_tap_demo_ASPX.DemoViewState" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700&display=swap" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="p-3 p-md-4 rounded-4 border" style="background-color: #F8FAFC; border-color: #E2E8F0 !important; font-family: 'Be Vietnam Pro', sans-serif; color: #0F172A;">
        <!-- Tiêu đề -->
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4">
            <div>
                <h2 class="fw-bold mb-1" style="letter-spacing: -0.02em;">Lưu trạng thái trong trang HTML (ViewState)</h2>
                <p class="text-secondary small mb-0">Dữ liệu được đóng gói vào thẻ ẩn <code>__VIEWSTATE</code> và chỉ sống trong phạm vi 1 trang qua các lần Postback.</p>
            </div>
            <span class="badge rounded-pill px-3 py-2 fw-medium" style="background-color: #16A34A; color: #FFFFFF;">Lưu trong __VIEWSTATE</span>
        </div>

        <!-- Tầng 1: 2 cột đối chiếu Bộ đếm & EnableViewState -->
        <div class="row g-3 mb-3">
            <!-- Cột trái: Bộ đếm Postback -->
            <div class="col-12 col-md-6">
                <div class="card h-100 border rounded-4 shadow-sm bg-white">
                    <div class="card-body p-4 d-flex flex-column justify-content-between gap-3">
                        <div>
                            <h5 class="fw-semibold mb-1">Bộ đếm qua Postback</h5>
                            <p class="small text-secondary mb-3">Bấm nút nhiều lần để so sánh biến thường (reset về 0) và <code>ViewState</code>.</p>

                            <div class="row g-2 mb-3">
                                <div class="col-6">
                                    <div class="p-3 rounded-3 text-center" style="background-color: #F1F5F9;">
                                        <div class="small text-secondary mb-1">Biến thường (<code>int x</code>)</div>
                                        <asp:Label ID="lblNormalVar" runat="server" Text="0" CssClass="fs-3 fw-bold text-secondary" />
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="p-3 rounded-3 text-center" style="background-color: #DCFCE7;">
                                        <div class="small mb-1" style="color: #15803D;"><code>ViewState["Count"]</code></div>
                                        <asp:Label ID="lblViewStateVar" runat="server" Text="0" CssClass="fs-3 fw-bold" style="color: #15803D;" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="btnIncrement" runat="server" Text="Bấm tăng (+1)"
                            CssClass="btn w-100 py-2 rounded-3 fw-semibold text-white"
                            style="background-color: #16A34A; border-color: #16A34A;"
                            OnClick="btnIncrement_Click" />
                    </div>
                </div>
            </div>

            <!-- Cột phải: Bật / Tắt EnableViewState -->
            <div class="col-12 col-md-6">
                <div class="card h-100 border rounded-4 shadow-sm bg-white">
                    <div class="card-body p-4 d-flex flex-column justify-content-between gap-3">
                        <div>
                            <h5 class="fw-semibold mb-1">Bật / Tắt <code>EnableViewState</code></h5>
                            <p class="small text-secondary mb-3">Gán chữ cho cả 2 nhãn, sau đó bấm <strong>Postback kiểm tra</strong> để xem nhãn nào giữ được chữ.</p>

                            <div class="p-3 rounded-3 mb-2 d-flex justify-content-between align-items-center" style="background-color: #F8FAFC; border: 1px solid #E2E8F0;">
                                <span class="small text-secondary"><code>lblA</code> (EnableViewState = <strong>true</strong>)</span>
                                <asp:Label ID="lblA" runat="server" EnableViewState="true" Text="(chưa gán)" CssClass="fw-semibold" style="color: #15803D;" />
                            </div>

                            <div class="p-3 rounded-3 d-flex justify-content-between align-items-center" style="background-color: #F8FAFC; border: 1px solid #E2E8F0;">
                                <span class="small text-secondary"><code>lblB</code> (EnableViewState = <strong>false</strong>)</span>
                                <asp:Label ID="lblB" runat="server" EnableViewState="false" Text="(chưa gán)" CssClass="fw-semibold text-secondary" />
                            </div>
                        </div>

                        <div class="d-flex gap-2">
                            <asp:Button ID="btnSetText" runat="server" Text="Gán chữ"
                                CssClass="btn btn-dark flex-fill py-2 rounded-3 fw-semibold"
                                OnClick="btnSetText_Click" />
                            <asp:Button ID="btnPostbackTest" runat="server" Text="Postback kiểm tra"
                                CssClass="btn btn-outline-dark flex-fill py-2 rounded-3 fw-semibold"
                                OnClick="btnPostbackTest_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Tầng 2: GridView 100 dòng & Độ phình ViewState -->
        <div class="card border rounded-4 shadow-sm bg-white">
            <div class="card-body p-4">
                <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-3">
                    <div>
                        <h5 class="fw-semibold mb-1">Hiệu ứng phình to ViewState (GridView 100 dòng)</h5>
                        <asp:Label ID="lblGridStatus" runat="server" CssClass="small text-secondary" Text="Chưa nạp dữ liệu — hãy quan sát kích thước ViewState trên Thanh X-quang." />
                    </div>
                    <div class="d-flex gap-2">
                        <asp:Button ID="btnLoad100" runat="server" Text="Nạp 100 dòng (Bật ViewState)"
                            CssClass="btn btn-sm py-2 px-3 rounded-3 fw-semibold text-white"
                            style="background-color: #16A34A; border-color: #16A34A;"
                            OnClick="btnLoad100_Click" />
                        <asp:Button ID="btnDisableGridViewState" runat="server" Text="Tắt ViewState GridView"
                            CssClass="btn btn-sm btn-outline-dark py-2 px-3 rounded-3 fw-semibold"
                            OnClick="btnDisableGridViewState_Click" />
                    </div>
                </div>

                <div class="table-responsive border rounded-3" style="max-height: 240px; overflow-y: auto;">
                    <asp:GridView ID="gvProducts" runat="server"
                        CssClass="table table-sm table-striped align-middle mb-0"
                        GridLines="None"
                        AutoGenerateColumns="true"
                        EmptyDataText="Bấm 'Nạp 100 dòng' ở trên để kiểm tra kích thước ViewState." />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
