<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Add Account</title>
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
        
        <div class="card container shadow w-75">
            <div class="card-title mb-0"><p class="text-center display-4">Add Account</p></div>
            <hr class="d-block mx-auto w-75" />
            <div class="card-body container">
                <div class="row mb-5">
                    <div class="col text-right lead"><p>Enter TUID/Email</p></div>
                    <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                    <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" OnClick="btnSearch_Click" /></div>
                </div>

                <!--CONFIRMATION ROW-->
                <div class="row mb-3" runat="server" id="divConfirm" visible="false">
                    <div class="col text-center lead"><p>Are you sure you would like to add this account?</p></div>
                </div>

                <asp:GridView runat="server" ID="gvAccount" GridLines="None" AutoGenerateColumns="false" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="UserType" HeaderText="User Type" />
                        <asp:BoundField DataField="LName" HeaderText="Last Name" />
                        <asp:BoundField DataField="FName" HeaderText="First Name" />
                    </Columns>
                </asp:GridView>

                <div id="chkbxAdmin" runat="server" visible="false" class="form-group" style="padding-bottom: 150px;">
                    <p class="form-check-label lead">Privilages</p>
                    <asp:CheckBoxList ID="ckbxPrivleges" runat="server" CssClass="form-check-input d-block mx-auto">
                        <asp:ListItem Value="0">Superadmin</asp:ListItem>
                        <asp:ListItem Value="1">Update Accounts</asp:ListItem>
                        <asp:ListItem Value="2">Events</asp:ListItem>
                        <asp:ListItem Value="3">Rewards</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                
<!--BOTTOM NAVIGATION BUTTONS-->                
                <hr class="w-75 mt-5 mx-auto" />
                <div class="row w-100 mt-2 mb-4" >
                    <div class="col">
                        <asp:Button runat="server" ID="btnCancel" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClientClick="JavaScript:window.history.go(-1);return false;" />
                        <asp:Button runat="server" ID="btnCancel1" Text="Cancel" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnCancel1_Click" Visible="false"/>

                    </div>
                    <div class="col">
                        <asp:Button runat="server" ID="btnAdd" Text="Add Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnAdd_Click"/>
                        <asp:Button runat="server" ID="btnConfirm" Text="Confirm" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnConfirm_Click" Visible="false"/>

                    </div>
                </div>
            </div>
        </div>   
    </div>
</asp:Content>