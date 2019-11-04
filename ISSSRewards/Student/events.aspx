<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="events.aspx.cs" Inherits="ISSSRewards.Student.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Events</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Events</p>
    </div>
    <div class="container">
        <br />
         <asp:GridView runat="server" ID="gvEvents" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvEvents_RowDeleting" 
                    OnSelectedIndexChanged="gvEvents_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="gvEvents_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Points" HeaderText="Points" />
                        <asp:CommandField ShowSelectButton="true">
                        <ControlStyle CssClass="btn btn-success d-block mx-auto w-50"></ControlStyle>
                        </asp:CommandField>
                       
                    </Columns>
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
    </div>
</asp:Content>
