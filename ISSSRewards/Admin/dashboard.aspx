<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="ISSSRewards.Admin.WebForm1" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Dashboard</title>
    <link href="css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
  <li class="nav-item"><a class="nav-link active" href="dashboard.aspx">Dashboard</a></li>
  <li class="nav-item"><a class="nav-link" href="Emails/email.aspx">Emails</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="Events/events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="Events/attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="Events/update.aspx">Update Event</a>
            <a class="dropdown-item text-light" href="Events/add.aspx">Add Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="Rewards/rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="Rewards/pending.aspx">View Pending Rewards</a>
            <a class="dropdown-item text-light" href="Rewards/update.aspx">Update Reward</a>
            <a class="dropdown-item text-light" href="Rewards/add.aspx">Add Reward</a>
        </div>
      </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks bg-danger" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="Accounts/accountmaintenance.aspx">View Account</a>
            <a class="dropdown-item text-light" href="Accounts/update.aspx">Update Account</a>
            <a class="dropdown-item text-light" href="Accounts/add.aspx">Add Account</a>
        </div>
      </li>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container-fluid mx-auto w-75">
        <p class="text-center h1 mb-5">Dashboard</p>
        <div class="card container shadow" style="margin-bottom: 50px;">

<!--EVENTS-->
            <div class="row">
                <div class="col bg-owl">
                    <p class="lead text-center text-light text-large">New Events</p>
                </div>
            </div>
            <div class="row">

<!--EVENT GRIDVIEW -->
                <div class="col container">
                    <asp:GridView runat="server" ID="gvEvents" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID"/>
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Date" HeaderText="Date" />
                            <asp:BoundField DataField="Points" HeaderText="Points" />
                            <asp:CommandField ShowSelectButton="true" SelectText="View">
                            <ControlStyle CssClass="btn btn-success d-block mx-auto w-50"></ControlStyle>
                            </asp:CommandField>
                        </Columns>
                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>

<!--REWARDS-->
        <div class="card container shadow">
            <div class="row">
                <div class="col bg-owl">
                    <p class="lead text-center text-light text-large">Pending Rewards</p>
                </div>
            </div>
            <div class="row">

<!--REWARDS GRIDVIEW -->
                <div class="col container">
                    <asp:GridView runat="server" ID="gvRewards" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" OnSelectedIndexChanged="gvRewards_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID"/>
                            <asp:BoundField DataField="FName" HeaderText="First Name" />
                            <asp:BoundField DataField="LName" HeaderText="Last Name" />
                            <asp:BoundField DataField="Points" HeaderText="Points" />
                            <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                            <asp:CommandField ShowSelectButton="true" SelectText="View">
                            <ControlStyle CssClass="btn btn-success d-block mx-auto w-50"></ControlStyle>
                            </asp:CommandField>
                        </Columns>
                        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
                        <PagerStyle HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
