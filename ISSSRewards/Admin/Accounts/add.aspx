<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="add.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.add" %>
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
            <div class="card-title mb-0"><p class="text-center display-4">Add Account</p></div>
            <hr class="d-block mx-auto w-75" />
            <div class="card-body container">
                <div class="row mb-5">
                    <div class="col text-right lead"><p>Enter TUID/Email</p></div>
                    <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                    <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" /></div>
                </div>
                <asp:GridView runat="server" ID="gvResults" Visible="false" CssClass="table table-bordered"></asp:GridView>
                <table class="table ">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Status</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">First Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">0000000001</th>
                            <td>-</td>
                            <td>Spindler</td>
                            <td>Keeth</td>
                        </tr>
                    </tbody>
                </table>
                <hr />
                <div class="form-group" style="padding-bottom: 150px;">
                    <p class="form-check-label lead">Privilages</p>
                    <asp:CheckBoxList ID="ckbxPrivleges" runat="server" CssClass="form-check-input d-block mx-auto">
                        <asp:ListItem>Superadmin</asp:ListItem>
                        <asp:ListItem>Update Accounts</asp:ListItem>
                        <asp:ListItem>Events</asp:ListItem>
                        <asp:ListItem>Rewards</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
            </div>
        </div>   
    </div>
      <div class="row w-100 mt-5 bottom">
            <div class="col">
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light"/>
            </div>
            <div class="col">
                <asp:Button runat="server" ID="btnAdd" Text="Add Account" CssClass="btn d-block mx-auto bg-owl text-light"/>
            </div>
        </div>
</asp:Content>