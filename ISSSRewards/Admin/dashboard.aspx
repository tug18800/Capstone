<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="ISSSRewards.Admin.WebForm1" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Dashboard</title>
    <link href="css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
    <a class="nav-item nav-link active" href="dashboard.aspx">Dashboard</a>
    <a class="nav-item nav-link" href="Events/events.aspx">Events</a>
    <a class="nav-item nav-link" href="Rewards/rewards.aspx">Rewards</a>
    <a class="nav-item nav-link" href="Accounts/accountmaintenance.aspx">Account Maintenance</a>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Dashboard</p>
    </div>
</asp:Content>
