<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="confirm.aspx.cs" Inherits="ISSSRewards.Student.confirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Rewards</title>
</asp:Content>

<asp:Content ID="points" ContentPlaceHolderID="points" runat="server">
    <asp:Label ID="lblPointsNav" runat="server" CssClass="h4 text-light mb-1 mr-3"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container m-bottom">
        <p class="text-center h1 mb-3">Rewards</p>   
        
<!--TITLE-->
        <div class="card container shadow">
            <div class="card-body">

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>
          
                <asp:Label runat="server" CssClass="lead d-block bg-owl text-light text-center" ID="lblTitle"></asp:Label>
                <div class="row">
<!--PICTURE ROW-->                
                    <div class="col-sm mt-4"><asp:Image runat="server" CssClass="d-block mx-auto result-img" ID="imgReward" /></div>
                </div>

<!--DATE/DESC COL-->
                <div class="row">
                    <div class="col-sm mt-4" id="divDesc" runat="server">
                        <div class="row">
                            <div class="col-sm"><p class="d-inline lead font-weight-bold">Date Posted: </p></div>
                            <div class="col-sm"> <asp:Label runat="server" CssClass="lead d-block ml-auto text-right" ID="lblDate"></asp:Label></div>
                        </div>
                        <div class="row">
                            <div class="col-sm"><p class="d-inline lead font-weight-bold">Remaining Amount: </p></div>
                            <div class="col-sm"> <asp:Label runat="server" CssClass="lead d-block ml-auto text-right" ID="lblQty"></asp:Label></div>
                        </div>
                        <div class="row">
                            <div class="col-sm mt-4"><p class="lead d-block font-weight-bold">Description: </p></div>
                        </div>
                        <div class="row">
                            <div class="col-sm mt-2"><asp:Label runat="server" CssClass="lead d-block" ID="lblDesc"></asp:Label></div>  
                        </div>
                    </div>
                </div>
        

<!--POINT COL-->
                <div class="row w-50 d-block mx-auto">
                    <div class="col-sm mt-4 text-center">
                        <div class="card container shadow">
                            <div class="card-body">
                                <div class="row">
                                <p class="font-weight-bold mx-auto lead">Costs: </p>
                                </div>
                            
                                <div class="row">
                                    <asp:Label runat="server" CssClass="d-block mx-auto lead" ID="lblPoints"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="card container shadow">
                            <div class="card-body">
                                <div class="row">
                                    <p class="font-weight-bold mx-auto lead">Your Points: </p>
                                </div>
                                <div class="row">
                                    <asp:Label runat="server" CssClass="d-block mx-auto lead" ID="lblCurrentPoints"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

<!--BOTTOM NAVIGATION BUTTONS-->
                <div class="row w-100 mt-5"><asp:Label runat="server" ID="lblConfirm" CssClass="text-center lead mx-auto d-block" Visible="false"></asp:Label><asp:Label runat="server" ID="lblFailed" CssClass="bg-danger lead text-center text-light mx-auto d-block w-75" Visible="false"></asp:Label></div>
                <div class="row w-100 mt-3 mb-4">
                    <div class="col">
                        <asp:Button runat="server" ID="btnCancel" Text="Cancel" CssClass="btn d-block mx-auto text-light bg-owl" OnClick="btnCancel_Click" />
                    </div>
                    <div class="col">
                        <asp:Button runat="server" ID="btnConfirm" Text="Confirm" CssClass="btn d-block mx-auto text-light bg-success" OnClick="btnConfirm_Click" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
