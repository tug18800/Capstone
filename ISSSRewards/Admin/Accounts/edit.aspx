<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>View Account</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>

<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
    <a class="nav-item nav-link" href="../dashboard.aspx">Dashboard</a>
    <a class="nav-item nav-link" href="../Events/events.aspx">Events</a>
    <a class="nav-item nav-link" href="../Rewards/rewards.aspx">Rewards</a>
    <a class="nav-item nav-link active" href="accountmaintenance.aspx">Account Maintenance</a>
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
                    <div class="col-4"><asp:Button runat="server" ID="btnAddSelector" CssClass="btn btn-success d-block float-right mr-4" Text="Add" OnClick="btnAddSelector_Click" /></div>
                </div>
            
<!--EVENTS GRIDVIEW-->
                <asp:GridView runat="server" ID="gvEvents" CssClass="table" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvEvents_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                        <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-danger float-right mr-3" />
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
            </div>
        </div>

<!--BOTTOM NAVIGATION BUTTONS-->
      <div class="row w-100 mt-5 bottom">
            <div class="col">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnCancel_Click"/>
            </div>
            <div class="col">
                <asp:Button runat="server" ID="btnUpdate" Text="Update Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnUpdate_Click"/>
            </div>
        </div>
</asp:Content>