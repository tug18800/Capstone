<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="rewards.aspx.cs" Inherits="ISSSRewards.Admin.Rewards.rewards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Rewards</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
  <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
  <li class="nav-item"><a class="nav-link" href="../Emails/email.aspx">Emails</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Events/events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="../Events/attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="../Events/add.aspx">Add Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="pending.aspx">View Pending Orders</a>
            <a class="dropdown-item text-light" href="add.aspx">Add Reward</a>
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
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center h1 mb-3">Rewards</p>   
        
<!--TITLE-->
        <div class="card container shadow">
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">Search Rewards</p></div>
            <hr />
            <div class="card-body">

<!--SEARCH FUNCTION-->
                <div class="row mb-4 justify-content-center">
                    <div class="col-2 lead"><p>Enter Reward ID</p></div>
                    <div class="col-5"><asp:TextBox runat="server" ID="txtID" CssClass="form-control mx-auto"></asp:TextBox></div>
                    <div class="col-1"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" OnClick="btnSearch_Click" /></div>
                    <div class="col-1"><asp:Button runat="server" ID="btnAll" CssClass="btn bg-owl text-light d-block ml-auto" Text="See All Rewards" OnClick="btnAll_Click"/></div>
                    </div>
                </div>

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>
<!--GRIDVIEW TABLE-->
                <asp:GridView runat="server" ID="gvRewards" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvRewards_RowDeleting" 
                    OnSelectedIndexChanged="gvRewards_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="gvRewards_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                        <asp:CommandField ShowSelectButton="true">
                        <ControlStyle CssClass="btn btn-success d-block mx-auto w-50"></ControlStyle>
                        </asp:CommandField>
                        <asp:CommandField ShowDeleteButton="true">
                        <ControlStyle CssClass="btn btn-danger d-block mx-auto w-50"></ControlStyle>
                        </asp:CommandField>
                    </Columns>
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>

<!--BOTTOM NAVIGATION BUTTONS-->
            <hr class="mt-3 w-75 mx-auto" />
            <div class="row w-100 mb-4">
                <div class="col">
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnBack_Click" />
                </div>
                <div class="col">
                    <asp:Button runat="server" ID="btnAdd" Text="Add Reward" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
