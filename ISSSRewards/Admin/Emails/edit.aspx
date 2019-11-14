﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ISSSRewards.Admin.Emails.edit" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Email</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
  <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
  <li class="nav-item"><a class="nav-link active" href="email.aspx">Emails</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Events/events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="../Events/attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="../Events/update.aspx">Update Event</a>
            <a class="dropdown-item text-light" href="../Events/add.aspx">Add Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Rewards/rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/pending.aspx">View Pending Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/update.aspx">Update Reward</a>
            <a class="dropdown-item text-light" href="../Rewards/add.aspx">Add Reward</a>
        </div>
      </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks bg-danger" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Accounts/accountmaintenance.aspx">View Account</a>
            <a class="dropdown-item text-light" href="../Accounts/update.aspx">Update Account</a>
            <a class="dropdown-item text-light" href="../Accounts/add.aspx">Add Account</a>
        </div>
      </li>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container-fluid mx-auto w-75">
        <p class="text-center h1 mb-5">Emails</p>
        <div class="card container shadow">
            <div class="row">
                <div class="col bg-owl text-center my-0"><p class="lead text-large text-light my-1">Update Email</p></div>
            </div>
            <div class="row mt-2 mb-0">
                <div class="col"><p class="lead d-inline">Title: </p><asp:TextBox runat="server" ID="txtTitle" CssClass="text-left d-inline w-100" ></asp:TextBox></div>
            </div>
            <hr class="w-100 my-2 mx-auto" />
            <div class="row">
                <div class="col-4"><p class="lead">Body:</p></div>
            </div>
            <div class="row container">
                <div class="col"><asp:TextBox runat="server" ID="txtBody" CssClass="text-multi w-100" TextMode="MultiLine"></asp:TextBox></div>
            </div>
<!--BACK NAVIGATION-->
            <div class="row w-100 mt-5">
                <div class="col">
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light mb-3" OnClick="btnBack_Click" />
                </div>
                <div class="col">
                    <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn d-block mx-auto bg-owl text-light mb-3" OnClick="btnUpdate_Click" />
                </div>
            </div>
       </div>
    </div>
</asp:Content>