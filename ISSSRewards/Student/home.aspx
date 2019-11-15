<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ISSSRewards.Student.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Home</title>
</asp:Content>

<asp:Content ID="points" ContentPlaceHolderID="points" runat="server">
    <asp:Label ID="lblPointsNav" runat="server" CssClass="h4 text-light mb-1 mr-3"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container m-bottom">
        <p class="text-center display-4">Home</p>
            <hr />
            <div class="row mb-5">
                <div class="col-sm-12">
                    <div class="text-center bg-owl text-light py-2 rounded"> 
                        <img src="img/icons/calendar.png" class="img-nav d-inline mr-3" /><p class="text-center h5 d-inline">Upcoming Events</p><img src="img/icons/calendar.png" class="img-nav d-inline ml-3" />
                        </div>
                        <asp:GridView ID="gvEvents" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="table my-0" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged">
                            <Columns>
                                <asp:ImageField ReadOnly="true" DataImageUrlField="Picture" ControlStyle-CssClass="gv-image"></asp:ImageField>
                                <asp:BoundField DataField="title" HeaderText="Title" />
                                <asp:BoundField DataField="date" HeaderText="Date" />
                                <asp:BoundField DataField="points" HeaderText="Points" />
                                <asp:CommandField ShowSelectButton="true" SelectText="View" ControlStyle-CssClass="btn btn-success" />
                            </Columns>
                        </asp:GridView>
                    <asp:LinkButton class="btn bg-owl d-block btn-sm mx-auto w-25 text-light"  Text="View Events" href="events.aspx" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="text-center bg-owl text-light py-2 rounded"> 
                        <img src="img/icons/giftbox.png" class="img-nav d-inline mr-3" /><p class="text-center h5 d-inline">Recently Added Rewards</p><img src="img/icons/giftbox.png" class="img-nav d-inline ml-3" />
                        </div>
                        <asp:GridView ID="gvRewards" runat="server" AutoGenerateColumns="false" GridLines="None" CssClass="table my-0" OnSelectedIndexChanged="gvRewards_SelectedIndexChanged">
                            <Columns>
                                <asp:ImageField ReadOnly="true" DataImageUrlField="Picture" ControlStyle-CssClass="gv-image"></asp:ImageField>
                                <asp:BoundField DataField="title" HeaderText="Title" />
                                <asp:BoundField DataField="date" HeaderText="Date" />
                                <asp:BoundField DataField="points" HeaderText="Points" />
                                <asp:CommandField ShowSelectButton="true" SelectText="View" ControlStyle-CssClass="btn btn-success" />
                            </Columns>
                        </asp:GridView>
                        <asp:LinkButton class="btn bg-owl d-block btn-sm mx-auto w-25 text-light"  Text="View Rewards" href="rewards.aspx" runat="server" />
                    </div>
                </div>
            </div>
</asp:Content>
