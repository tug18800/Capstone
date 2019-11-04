<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ISSSRewards.Student.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Home</p>
            <hr />
            <div class="row">
  <div class="col-sm-12">
    <div class="text-center"> 
        <p class="text-center display-6">Current Points</p>
        <asp:TextBox ID="StudentPoints" runat="server"></asp:TextBox>
        </div>
      </div>
                </div>
        <hr />
         <div class="row">
  <div class="col-sm-12">
    <div class="text-center"> 
        <p class="text-center display-6">Upcoming Events</p>
            <asp:GridView ID="gvFutureEvents" runat="server">
                <Columns>
                    <asp:BoundField DataField="picture" HeaderText="" />
                    <asp:BoundField DataField="title" HeaderText="" />
                    <asp:BoundField DataField="date" HeaderText="Date" />
                    <asp:BoundField DataField="points" HeaderText="Points" />
                </Columns>
            </asp:GridView>
        <asp:LinkButton class="btn btn-primary btn-sm"  Text="View Events" href="events.aspx" runat="server" />
        </div>
      </div>
             </div>
        <hr />
    <div class="row">
  <div class="col-sm-12">
    <div class="text-center"> 
        <p class="text-center display-6">Available Rewards </p>
        <asp:GridView ID="gvAvailableRewards" runat="server">
            <Columns>
                <asp:BoundField DataField="picture" HeaderText="" />
                <asp:BoundField DataField="points" HeaderText="Points" />
            </Columns>
            </asp:GridView>
       <asp:LinkButton class="btn btn-primary btn-sm"  Text="View Rewards" href="rewards.aspx" runat="server" />
    </div>
      </div>
        </div>
        </div>
</asp:Content>
