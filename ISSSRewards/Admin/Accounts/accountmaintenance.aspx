<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="accountmaintenance.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.accountmaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Account Maintenance</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
    <a class="nav-item nav-link" href="../dashboard.aspx">Dashboard</a>
    <a class="nav-item nav-link" href="../Events/events.aspx">Events</a>
    <a class="nav-item nav-link" href="../Rewards/rewards.aspx">Rewards</a>
    <a class="nav-item nav-link active" href="accountmaintenance.aspx">Account Maintenance</a>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">/
    <div class="container">
        <p class="text-center display-4">Account Maintenance</p>
    
        <div class="card container shadow">
            <div class="card-title"><p class="h3 text-center">Search Accounts</p></div>
            <hr />
            <div class="card-body">
                <div class="row">
                    <div class="col text-right lead"><p>Enter TUID/Email</p></div>
                    <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                    <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" /></div>
                </div>
                <hr />
                <asp:GridView runat="server" ID="gvResults" Visible="false" CssClass="table table-bordered"></asp:GridView>
            </div>
        </div>   
    </div>
      <div class="row w-100 mt-5">
            <div class="col">
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnBack_Click" />
            </div>
            <div class="col">
                <asp:Button runat="server" ID="btnAdd" Text="Add Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnAdd_Click" />
            </div>
        </div>
</asp:Content>