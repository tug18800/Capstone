<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="ISSSRewards.Admin.Events.add" %>
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
        <div class="card container w-75 shadow" style="margin-bottom: 100px;">
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">Add Event</p></div>
            <hr class="mb-0" />
            <div class="card-body">

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>

<!--EVENT CONTENT-->        
                <div id="EventSection" runat="server">
<!--PICTURE ROW--> 
                    <div class="w-75 mx-auto">
                        <div class="row">
                            <p class="lead text-larger d-block mx-auto">Add Photo</p>
                        </div>
                        <div class="row">
                            <img src="../img/img.png" class="img-thumbnail d-block mx-auto w-50 h-50 img-hover" />
                        </div>
                        <hr class="my-5 w-75" />
<!--DATE/DESC COL-->
                        <div class="row">
                            <p class="display-4 mx-auto">Details</p>
                        </div>
                        <div class="row">
                            <p class="lead d-inline font-weight-bold">Title</p>
                            <asp:TextBox runat="server" CssClass="d-block form-control" ID="txtTitle"></asp:TextBox>
                        </div>
                        <div class="row  mt-3">
                            <p class="d-inline lead font-weight-bold">Date</p>
                            <asp:Textbox runat="server" TextMode="Date" CssClass="d-block form-control" ID="txtDate"></asp:Textbox>
                        </div>
                        <div class="row mt-3">
                            <p class="lead d-block font-weight-bold">Description </p>
                            <asp:Textbox runat="server" CssClass="d-block form-control text-area-h" TextMode="MultiLine" ID="txtDesc"></asp:Textbox>                     
                        </div>
                        

<!--POINT COL-->
                        <div class="row mt-4">
                            <p class="lead d-inline font-weight-bold">Points: </p>
                            <asp:Textbox runat="server" CssClass="form-control d-inline" ID="txtPoints"></asp:Textbox>
                        </div>
                    </div>
                </div>

<!--BOTTOM NAVIGATION BUTTONS-->
                <div class="row w-100 mt-5 mb-4">
                    <div class="col">
                        <asp:Button runat="server" ID="btnCancel" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnCancel_Click" />
                    </div>
                    <div class="col">
                        <asp:Button runat="server" ID="btnAdd" Text="Add Event" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>