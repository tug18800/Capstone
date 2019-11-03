<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="ISSSRewards.Admin.Events.attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Attendance</title>
    <link href="../css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ID="ContentNavLinks" ContentPlaceHolderID="navLinks">
   <li class="nav-item"><a class="nav-link" href="../dashboard.aspx">Dashboard</a></li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Events</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="add.aspx">Add Event</a>
            <a class="dropdown-item text-light" href="attendance.aspx">Event Attendence</a>
            <a class="dropdown-item text-light" href="events.aspx">View Events</a>
            <a class="dropdown-item text-light" href="update.aspx">Update Event</a>
        </div>
    </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rewards</a>
        <div class="dropdown-menu bg-danger subNavLinks" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Rewards/add.aspx">Add Reward</a>
            <a class="dropdown-item text-light" href="../Rewards/pending.aspx">View Pending Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/rewards.aspx">View Rewards</a>
            <a class="dropdown-item text-light" href="../Rewards/update.aspx">Update Reward</a>
        </div>
      </li>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Account Maintenance</a>
        <div class="dropdown-menu subNavLinks bg-danger" aria-labelledby="navbarDropdown">
            <a class="dropdown-item text-light" href="../Accounts/add.aspx">Add Account</a>
            <a class="dropdown-item text-light" href="../Accounts/accountmaintenance.aspx">View Account</a>
            <a class="dropdown-item text-light" href="../Accounts/update.aspx">Update Account</a>
        </div>
      </li>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center h1 mb-3">Events</p>   
        
<!--TITLE-->
        <div class="card container shadow" style="margin-bottom: 100px;">
            <div class="card-title mt-3 mb-0"><p class="lead text-center text-large">Update Attendance</p></div>
            <hr />
            <div class="card-body">

<!--SEARCH FUNCTION-->
                <div class="row mb-4 justify-content-center">
                    <div class="col text-center"><p class="d-inline lead mr-5">Select Event</p>
                        <asp:DropDownList runat="server" ID="ddlEvents" CssClass="form-control d-inline w-25" AutoPostBack="True" OnSelectedIndexChanged="ddlEvents_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

<!--ERROR STATUS LABEL-->
                <div class="text-center">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                </div>
<!--EVENT GRIDVIEW TABLE-->
                <asp:GridView runat="server" ID="gvEvents" CssClass="table table-hover" AutoGenerateColumns="false" GridLines="None" OnRowDataBound="gvEvents_RowDataBound" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged" >
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                        <asp:BoundField DataField="Att" HeaderText="Attendance" />
                        <asp:CommandField ShowSelectButton="true">
                        <ControlStyle CssClass="btn btn-success d-block mx-auto w-50"></ControlStyle>
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>

<!--RESULTS HEADER-->
                <div id="resultsHeader" runat="server" visible="false" class="row bg-owl text-light mt-3 mb-4">
                    <div class="col text-center"><p class="lead d-block font-weight-bold pt-2">Attendance</p></div>

                </div>

            <asp:GridView runat="server" ID="gvResults" Visible ="false" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" PageSize="10" OnPageIndexChanging="gvResults_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="LName" HeaderText="Title" />
                        <asp:BoundField DataField="FName" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
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
                    <asp:Button runat="server" ID="btnUpload" Text="Upload Attendance" CssClass="btn d-block mx-auto bg-owl text-light" Enabled="false" OnClick="btnUpload_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
