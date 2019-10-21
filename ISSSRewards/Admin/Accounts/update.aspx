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
                <asp:GridView runat="server" ID="gvResults" Visible="false" CssClass="table">
                </asp:GridView>
                <table id="tblStudent" runat="server" class="table">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Status</th>
                            <th scope="col">Last Name</th>
                            <th scope="col">First Name</th>
                            <th scope="col">Points</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">0000000001</th>
                            <td>Student</td>
                            <td>Spindler</td>
                            <td>Keeth</td>
                            <td><asp:TextBox ID="txtPoints" runat="server" CssClass="form-control" Text="500"></asp:TextBox> </td>
                        </tr>
                    </tbody>
                </table>
                <table id="tblAdmin" runat="server" visible="false" class="table">
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
                            <th scope="row">0000000002</th>
                            <td>Admin</td>
                            <td>Testly</td>
                            <td>Test</td>
                        </tr>
                    </tbody>
                </table>
                <hr />
                <div id="chkbxAdmin" runat="server" visible="false" class="form-group" style="padding-bottom: 150px;">
                    <p class="form-check-label lead">Privilages</p>
                    <asp:CheckBoxList ID="ckbxPrivleges" runat="server" CssClass="form-check-input d-block mx-auto">
                        <asp:ListItem Value="0">Superadmin</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">Update Accounts</asp:ListItem>
                        <asp:ListItem Value="2">Events</asp:ListItem>
                        <asp:ListItem Value="3" Selected="True">Rewards</asp:ListItem>
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