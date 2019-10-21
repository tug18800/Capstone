<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="accountmaintenance.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.accountmaintenance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Account Maintenance</title>
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
        <p class="text-center display-4">Account Maintenance</p>
    
        <div class="card container shadow">
            <div class="card-title"><p class="h3 text-center">Search Accounts</p></div>
            <hr />
            <div class="card-body">

<!--SEARCH FUNCTION-->
                <div class="row">
                    <div class="col text-right lead"><p>Enter TUID/Email</p></div>
                    <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                    <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" OnClick="btnSearch_Click" /></div>
                </div>
                <hr />

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>
<!--GRIDVIEW TABLE-->
                <asp:GridView runat="server" ID="gvResults" AutoGenerateColumns="false" GridLines="None" CssClass="table" OnSelectedIndexChanged="gvResults_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" />
                        <asp:BoundField HeaderText="User Type" DataField="UserType" />
                        <asp:BoundField HeaderText="FName" DataField="FName"/>
                        <asp:BoundField HeaderText="LName" DataField="LName"/>
                        <asp:CommandField ShowSelectButton="true" SelectText="View" ButtonType="Button" ControlStyle-CssClass="btn btn-success mx-auto" />
                        
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

<%--<!--STUDENT TABLE-->
                <div id="Student" runat="server" visible="false">
                    <table class="table mb-3">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Status</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Points</th>
                                <th scope="col"></th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">0000000001</th>
                                <td>Student</td>
                                <td>Spindler</td>
                                <td>Keeth</td>
                                <td><asp:Label runat="server" ID="lblPoints" CssClass="text-center" Text="500"></asp:Label></td>
                                <td><asp:Button runat="server" ID="btnViewStudent" CssClass="btn btn-success float-right mr-3" Text="View" /></td>

                            </tr>
                        </tbody>
                    </table>
                </div>

<!--ADMIN TABLE-->
                <div id="Admin" runat="server" visible="false">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Status</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">First Name</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">0000000002</th>
                                <td>Admin</td>
                                <td>Testly</td>
                                <td>Test</td>
                                <td><asp:Button runat="server" ID="btnViewAdmin" CssClass="btn btn-success float-right mr-3" Text="View" /></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>   
    </div>--%>

<!--BOTTOM NAVIGATION BUTTONS-->
      <div class="row w-100 mt-5">
            <div class="col">
                <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnBack_Click" />
            </div>
            <div class="col">
                <asp:Button runat="server" ID="btnAdd" Text="Add Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnAdd_Click" />
            </div>
        </div>
</asp:Content>