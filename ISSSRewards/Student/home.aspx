<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ISSSRewards.Student.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container m-bottom">
        <p class="text-center display-4">Home</p>
            <hr />
            <div class="row">
              <div class="col-sm-12">
                <div class="text-center"> 
                    <p class="text-center h3">Current Points</p>
                    <asp:Label ID="lblPoints" runat="server" CssClass="lead"></asp:Label>
                    </div>
                  </div>
            </div>
                <hr />
            <div class="row mb-5">
                <div class="col-sm-12">
                    <div class="text-center bg-owl text-light py-2 rounded"> 
                        <p class="text-center h5">Upcoming Events</p>
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
                        <p class="text-center h5">Upcoming Events</p>
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
