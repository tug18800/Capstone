<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.view" %>
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

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">/
    <div class="container">

<!--TITLE-->
        <div runat="server" class="card container shadow w-75">
            <div class="card-title mb-0"><p class="text-center display-4">View Account</p></div>
            <hr class="d-block mx-auto w-75" />

<!--ERROR STATUS LABEL-->
            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error text-center mx-auto w-25 mb-5 rounded"></asp:Label>

<!--SEARCH FUNCTION-->
            <div class="row my-3">
                <div class="col text-right lead"><p>Enter TUID/Email</p></div>
                <div class="col"><asp:TextBox runat="server" ID="txtID" Text="0000000001" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mx-auto" Text="Search" OnClick="btnSearch_Click" /></div>
            </div>

            <div id="cardBody" runat="server" class="card-body container">
<!--GRIDVIEW TABLE-->
                <asp:GridView runat="server" ID="gvResults" GridLines="None" AutoGenerateColumns="false" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:BoundField DataField="UserType" HeaderText="User Type" />
                        <asp:BoundField DataField="LName" HeaderText="Last Name" />
                        <asp:BoundField DataField="FName" HeaderText="First Name" />
                    </Columns>
                </asp:GridView>

<!--STUDENT STAT SECTION-->
                <div id="studentStat" runat="server" class="row">

<!--EVENTS COLUMN-->
                    <div class="row">
                        <div class="col">
                            <p class="h5 text-light bg-owl text-center d-block py-2">Events</p>
                            <div class="row mt-4 h-50">
                                <div class="col">
                                    <img src="https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?v=1530129081" class="w-50 d-block mx-auto" />
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <p>Total Events: </p><asp:Label runat="server" ID="lblEventCount" Text="2"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <p>Total Points Earned: </p><asp:Label runat="server" ID="lblEventPoint" Text="500"></asp:Label>
                                    </div>
                                </div>
                                <div class="col">
                                    <asp:Button runat="server" ID="btnUpdateEvent" Text="Update Events" CssClass="btn text-light bg-owl d-block mx-auto" OnClick="btnUpdate_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>

<!--REWARDS COLUMN-->
                    <div class="row">
                        <div class="col">
                            <p class="h5 text-light bg-owl text-center d-block py-2">Rewards</p>
                            <div class="row mt-4 h-50">
                                <div class="col">
                                    <img src="https://cdn.shopify.com/s/files/1/0533/2089/files/placeholder-images-image_large.png?v=1530129081" class="w-50 d-block mx-auto" />
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <p>Total Rewards: </p><asp:Label runat="server" ID="lblRewardCount" Text="0"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <p>Total Points Redeemed: </p><asp:Label runat="server" ID="lblRewardPoint" Text="0"></asp:Label>
                                    </div>
                                </div>
                                <div class="col">
                                        <asp:Button runat="server" ID="btnUpdateRewards" Text="Update Rewards" CssClass="btn text-light bg-owl d-block mx-auto" OnClick="btnUpdate_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    <!--ADMIN PRIVILAGES CHECKBOX-->
            <div id="adminPriv" runat="server">
                <div class="w-25">
                    <div class="ml-3">
                        <p class="form-check-label lead">Privilages</p>
                        <asp:CheckBoxList ID="ckbxPrivleges" Enabled="false" runat="server" CssClass="d-block mt-2">
                            <asp:ListItem Value="0">Superadmin</asp:ListItem>
                            <asp:ListItem Value="1" Selected="True">Update Accounts</asp:ListItem>
                            <asp:ListItem Value="2">Events</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">Rewards</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                </div>
                <div class="text-center">
                    <asp:Button runat="server" ID="btnUpdate" Text="Update Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnUpdate_Click"/>
                </div>
            </div>
        </div>
    </div>   

<!--BOTTOM NAVIGATION BUTTONS-->
    <div class="row w-100 mt-5 bottom">
        <div class="col">
            <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnBack_Click"/>
        </div>
        <div class="col"></div>
    </div>
</asp:Content>