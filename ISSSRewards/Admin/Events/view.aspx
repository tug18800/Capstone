<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="ISSSRewards.Admin.Events.view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <!--ADMIN SIDE-->
    <title>Events</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
  <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="add.aspx">Add Event</a>
            <a class="dropdown-item text-light" href="attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="update.aspx">Update Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Rewards/add.aspx">Add Reward</a>
            <a class="dropdown-item text-light" href="../Rewards/pending.aspx">View Pending Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/update.aspx">Update Reward</a>
        </div>
      </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks bg-danger" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Accounts/add.aspx">Add Account</a>
            <a class="dropdown-item text-light" href="../Accounts/accountmaintenance.aspx">View Account</a>
            <a class="dropdown-item text-light" href="../Accounts/update.aspx">Update Account</a>
        </div>
      </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">/
    <div class="container">
        <p class="text-center h1 mb-3">Events</p>   
        
<!--TITLE-->
        <div class="card container shadow">
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">View Account</p></div>
            <hr />
            <div class="card-body">

<!--SEARCH FUNCTION-->
                <div class="row mb-3">
                    <div class="col text-right lead"><p>Enter Event ID</p></div>
                    <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                    <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" OnClick="btnSearch_Click" /></div>
                </div>

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>

<!--EVENT CONTENT-->
                <asp:Label runat="server" Visible ="false" ID="lblID"></asp:Label>                
                <asp:Label runat="server" CssClass="lead d-block bg-owl text-light text-center" ID="lblTitle"></asp:Label>
                <div id="EventSection" class="row" runat="server">
<!--PICTURE COL-->                
                    <div class="col-4 mt-4"><img src="../img/img.png" class="img-thumbnail" /></div>

<!--DATE/DESC COL-->
                    <div class="col-5 mt-4 pl-5">
                        <div class="row">
                            <p class="d-inline lead font-weight-bold">Date: </p><asp:Label runat="server" CssClass="lead d-block" ID="lblDate"></asp:Label>
                        </div>
                        <div class="row">
                            <div class="text-left mt-4"><p class="lead d-block font-weight-bold">Description: </p></div>
                            <div class="text-left mt-2"><asp:Label runat="server" CssClass="lead d-block" ID="lblDesc"></asp:Label></div>                     
                        </div>
                    </div>

<!--POINT COL-->
                    <div class="col-3 mt-4 text-center">
                        <p class="lead d-inline font-weight-bold">Points: </p><asp:Label runat="server" CssClass="lead d-inline" ID="lblPoints"></asp:Label>
                    </div>
                </div>

<!--BOTTOM NAVIGATION BUTTONS-->
                <div class="row w-100 mt-5">
                    <div class="col">
                        <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClientClick="javascript:history.go(1);return false;" />
                    </div>
                    <div class="col">
                        <asp:Button runat="server" ID="btnUpdate" Text="Update Event" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnUpdate_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>