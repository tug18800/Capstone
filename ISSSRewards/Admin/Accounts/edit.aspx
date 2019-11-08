<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>View Account</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
  <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
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
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks bg-danger" aria-labelledby="navbarDropdown">
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
        <div runat="server" class="card container shadow w-75">
            <div class="card-title my-3 text-center">
                <asp:Label ID="lblTitle" runat="server" CssClass="lead text-large"></asp:Label>
            </div>

<!--STUDENT TABLE-->
           <asp:GridView runat="server" ID="gvStudent" GridLines="None" AutoGenerateColumns="false" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="UserType" HeaderText="User Type" />
                        <asp:BoundField DataField="LName" HeaderText="Last Name" />
                        <asp:BoundField DataField="FName" HeaderText="First Name" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                    </Columns>
                </asp:GridView>

<!--SELECTOR ROW-->
                <div class="row my-5">
                    <div class="col-4 text-right"><asp:Label runat="server" CssClass="lead" ID="lblSelector"></asp:Label></div>
                    <div class="col-4">
                        <asp:DropDownList runat="server" ID="ddlSelector" CssClass="form-control  d-block mx-auto">
                            <asp:ListItem Selected="True" Text="--Select--"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-4"><asp:Button runat="server" ID="btnAddSelector" CssClass="btn btn-success d-block mx-auto" Text="Add" OnClick="btnAddSelector_Click" /></div>
                </div>
            
<!--EVENTS GRIDVIEW-->
                <asp:GridView runat="server" ID="gvEvents" CssClass="table" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvEvents_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger mx-auto" />
                    </Columns>
                </asp:GridView>

<!--REWARDS GRIDVIEW-->
             <asp:GridView runat="server" ID="gvRewards" Visible="false" CssClass="table" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvRewards_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger float-right mr-3" />
                    </Columns>
                </asp:GridView>

<!--BOTTOM NAVIGATION BUTTONS-->
            <hr class="w-75 mt-5 mx-auto" />
            <div class="row w-100 mt-2 mb-4" >
                <div class="col">
                    <asp:Button runat="server" ID="btnCancel" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnCancel_Click"/>
                </div>
                <div class="col">
                    <asp:Button runat="server" ID="btnUpdate" Text="Update Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnUpdate_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>