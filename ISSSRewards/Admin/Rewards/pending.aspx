<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="pending.aspx.cs" Inherits="ISSSRewards.Admin.Rewards.pending" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Pending Rewards</title>
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
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="pending.aspx">View Pending Rewards</a>

            <a class="dropdown-item text-light" href="update.aspx">Update Reward</a>
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
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">Pending Rewards</p></div>
            <hr />
            <div class="card-body">

<!--RESULTS HEADER-->
            <div id="resultsHeader" runat="server" visible="false" class="row bg-owl text-light mt-3 mb-4">
                <div class="col text-center"><p class="lead d-block font-weight-bold pt-2">Attendance</p></div>
            </div>

<!--ERROR STATUS LABEL-->
            <div class="text-center">
                <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-success w-25 rounded px-3 py-1 text-light"></asp:Label>
            </div>
<!--GRIDVIEW TABLE-->
            <asp:GridView runat="server" ID="gvRewards" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvRewards_RowDeleting"
                OnSelectedIndexChanged="gvRewards_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="gvRewards_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID"/>
                    <asp:BoundField DataField="FName" HeaderText="First Name" />
                    <asp:BoundField DataField="LName" HeaderText="Last Name" />
                    <asp:BoundField DataField="Reward" HeaderText="Reward Title" />
                    <asp:BoundField DataField="Points" HeaderText="Points" />
                    <asp:BoundField DataField="Qty" HeaderText="Quantity" />
                    <asp:CommandField ShowSelectButton="true" SelectText="Approve">
                    <ControlStyle CssClass="btn btn-success d-block mx-auto"></ControlStyle>
                    </asp:CommandField>    
                    <asp:CommandField ShowDeleteButton="true" DeleteText="Deny">
                        <ControlStyle CssClass="btn btn-danger d-block mx-auto"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
                <PagerStyle HorizontalAlign="Center" />
            </asp:GridView>

<!--BOTTOM NAVIGATION BUTTONS-->
            <hr class="mt-3 w-75 mx-auto mt-5" />
            <div class="row w-100 mb-4">
                <div class="col">
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClientClick="javascript:history.go(1);return false;" />
                </div>
                <div class="col">
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
