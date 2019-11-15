<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="accountmaintenance.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.accountmaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Account Maintenance</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
     <li class="nav-item mr-3 bg-owl-dark rounded">
        <asp:Label runat="server" ID="lblTerm" CssClass="nav-link pb-0 mb-0 d-block active">TERM FALL 2019 </asp:Label>
    </li>
  <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
  <li class="nav-item"><a class="nav-link" href="../Emails/email.aspx">Emails</a></li>

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
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="accountmaintenance.aspx">View Account</a>
            <a class="dropdown-item text-light" href="update.aspx">Update Account</a>
            <a class="dropdown-item text-light" href="add.aspx">Add Account</a>
        </div>
      </li>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center h1 mb-3">Account Maintenance</p>   
        
<!--TITLE-->
        <div class="card container shadow">
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">Search Accounts</p></div>
            <hr />
            <div class="card-body">

<!--SEARCH FUNCTION-->
                <div class="row mb-3">
                    <div class="col text-right lead"><p>Enter TUID</p></div>
                    <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                    <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mr-auto" Text="Search" OnClick="btnSearch_Click" /></div>
                </div>

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>
<!--GRIDVIEW TABLE-->
                <asp:GridView runat="server" ID="gvResults" AutoGenerateColumns="false" GridLines="None" CssClass="table table-hover" OnSelectedIndexChanged="gvResults_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" />
                        <asp:BoundField HeaderText="User Type" DataField="UserType" />
                        <asp:BoundField HeaderText="FName" DataField="FName"/>
                        <asp:BoundField HeaderText="LName" DataField="LName"/>
                        <asp:CommandField ShowSelectButton="true" SelectText="View" ButtonType="Button" ControlStyle-CssClass="btn btn-success mx-auto" />
                        
                    </Columns>
                </asp:GridView>

<!--BOTTOM NAVIGATION BUTTONS-->
                <hr class="w-75 mt-5 mx-auto" />
                <div class="row w-100 mt-2 mb-4">
                    <div class="col">
                        <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClientClick="JavaScript:window.history.go(-1);return false;"/>
                    </div>
                    <div class="col">
                        <asp:Button runat="server" ID="btnAdd" Text="Add Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnAdd_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>