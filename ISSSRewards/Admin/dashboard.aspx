<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="ISSSRewards.Admin.WebForm1" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Dashboard</title>
    <link href="css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
    <li class="nav-item"><a class="nav-link active" href="dashboard.aspx">Dashboard</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="Events/add.aspx">Add Event</a>
            <a class="dropdown-item text-light" href="Events/attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="Events/events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="Events/update.aspx">Update Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="Rewards/add.aspx">Add Reward</a>
            <a class="dropdown-item text-light" href="Rewards/pending.aspx">View Pending Rewards</a>
            <a class="dropdown-item text-light" href="Rewards/rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="Rewards/update.aspx">Update Reward</a>
        </div>
      </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks bg-danger" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="Accounts/add.aspx">Add Account</a>
            <a class="dropdown-item text-light" href="Accounts/accountmaintenance.aspx">View Account</a>
            <a class="dropdown-item text-light" href="Accounts/update.aspx">Update Account</a>
        </div>
      </li>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Dashboard</p>
    </div>
</asp:Content>
