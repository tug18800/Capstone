<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.update" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Add Account</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
    <a class="nav-item nav-link" href="../dashboard.aspx">Dashboard</a>
    <a class="nav-item nav-link" href="../Events/events.aspx">Events</a>
    <a class="nav-item nav-link" href="../Rewards/rewards.aspx">Rewards</a>
    <a class="nav-item nav-link active" href="accountmaintenance.aspx">Account Maintenance</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">/
    <div class="container">
 
        <div class="card container shadow w-75">
            <div class="card-title mb-0"><p class="text-center display-4">Update Account</p></div>
            <hr class="d-block mx-auto w-75" />
            <div class="card-body container">
                <asp:GridView runat="server" ID="gvAdmin" GridLines="None" AutoGenerateColumns="false" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="UserType" HeaderText="User Type" />
                        <asp:BoundField DataField="LName" HeaderText="Last Name" />
                        <asp:BoundField DataField="FName" HeaderText="First Name" />
                    </Columns>
                </asp:GridView>
                <hr />
                <div id="chkbxAdmin" runat="server" class="form-group" style="padding-bottom: 150px;">
                    <p class="form-check-label lead">Privilages</p>
                    <asp:CheckBoxList ID="ckbxPrivleges" runat="server" CssClass="form-check-input d-block mx-auto">
                        <asp:ListItem Value="0">Superadmin</asp:ListItem>
                        <asp:ListItem Value="1">Update Accounts</asp:ListItem>
                        <asp:ListItem Value="2">Events</asp:ListItem>
                        <asp:ListItem Value="3">Rewards</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>   
    </div>
      <div class="row w-100 mt-5 bottom">
            <div class="col">
                <asp:Button runat="server" ID="btnCancel" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnCancel_Click"/>
            </div>
            <div class="col">
                <asp:Button runat="server" ID="btnUpdate" Text="Update Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnUpdate_Click"/>
            </div>
        </div>
</asp:Content>