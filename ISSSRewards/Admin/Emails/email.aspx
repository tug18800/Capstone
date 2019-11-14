<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="email.aspx.cs" Inherits="ISSSRewards.Admin.email" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Email</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
     <li class="nav-item mr-3 bg-owl-dark rounded">
        <asp:Label runat="server" ID="lblTerm" CssClass="nav-link pb-0 mb-0 d-block active">TERM FALL 2019 </asp:Label>
    </li>
  <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
  <li class="nav-item"><a class="nav-link active" href="email.aspx">Emails</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Events/events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="../Events/attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="../Events/add.aspx">Add Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Rewards/rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/pending.aspx">View Pending Orders</a>
            <a class="dropdown-item text-light" href="../Rewards/add.aspx">Add Reward</a>
        </div>
      </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks" aria-labelledby="navbarDropdown">
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
                <div class="col bg-owl py-0"><p class="lead text-large text-center my-1 text-light">New Term Emails</p></div>
            </div>
            <div class="row">
                <div class="col text-center my-2"><a class="lead" href="view.aspx?id=1">Returning Students</a></div>
            </div>
            <div class="row"><hr class="w-75" /></div>
            <div class="row">
                <div class="col text-center my-2"><a class="lead" href="view.aspx?id=2">New Students</a></div>
            </div>
        </div>

        <div class="card container shadow">
            <div class="row">
                <div class="col bg-owl"><p class="lead text-large text-center my-1 text-light">Reward Emails</p></div>
            </div>
            <div class="row">
                <div class="col text-center my-2"><a class="lead" href="view.aspx?id=3">Order Confirmation</a></div>
            </div>
              <div class="row"><hr class="w-75" /></div>
            <div class="row">
                <div class="col text-center my-2"><a class="lead" href="view.aspx?id=4">Pending Rewards</a></div>
            </div>
              <div class="row"><hr class="w-75" /></div>
            <div class="row">
                <div class="col text-center my-2"><a class="lead" href="view.aspx?id=5">Order Complete Email</a></div>
            </div>
             <div class="row"><hr class="w-75" /></div>
            <div class="row">
                <div class="col text-center my-2"><a class="lead" href="view.aspx?id=6">End of Term Points Reminder</a></div>
            </div>
<!--BACK NAVIGATION-->
            <div class="row w-100 mt-3 mb-3">
                <div class="col">
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnBack_Click" />
                </div>
                <div class="col">
                </div>
            </div>
        </div>
    </div>
</asp:Content>