<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="ISSSRewards.Admin.Accounts.view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>View Account</title>
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
    <p class="text-center h1 mb-3">Emails</p>  
<!--TITLE-->
        <div runat="server" class="card container shadow w-75 m-bottom">
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">Edit Email</p></div>
            <hr />
            <div class="card-body mt-0">
<!--ERROR STATUS LABEL-->
            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error text-center mx-auto w-25 mb-5 rounded"></asp:Label>

<!--SEARCH FUNCTION-->
            <div class="row my-3">
                <div class="col text-right lead"><p>Enter TUID</p></div>
                <div class="col"><asp:TextBox runat="server" ID="txtID" CssClass="form-control w-75 mx-auto"></asp:TextBox></div>
                <div class="col"><asp:Button runat="server" ID="btnSearch" CssClass="btn bg-owl text-light d-block mr-auto" Text="Search" OnClick="btnSearch_Click" /></div>
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
                                <div class="col justify-content-center">
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
                <div class="row">
                    <div class="col">
                        <p class="h5 text-light bg-owl text-center d-block py-2">Privilages</p>
                    </div>
                </div>
                <div class="row">
                        <asp:CheckBoxList ID="ckbxPrivleges" Enabled="false" runat="server" CssClass="d-block mt-2 ml-3">
                            <asp:ListItem Value="0">Superadmin</asp:ListItem>
                            <asp:ListItem Value="1" Selected="True">Update Accounts</asp:ListItem>
                            <asp:ListItem Value="2">Events</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">Rewards</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                <div class="text-center">
                    <asp:Button runat="server" ID="btnUpdate" Text="Update Account" CssClass="btn d-block mx-auto bg-owl text-light" OnClick="btnUpdate_Click"/>
                </div>
            </div>

<!--BOTTOM NAVIGATION BUTTONS-->
               <hr class="w-75 mx-auto" />
                <div class="row w-100 mt-2 mb-4" >
                    <div class="col">
                        <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClientClick="JavaScript:window.history.go(-1);return false;"/>
                    </div>
                    <div class="col"></div>
                </div>
            </div>
        </div>
    </div>   
</asp:Content>