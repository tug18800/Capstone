<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="events.aspx.cs" Inherits="ISSSRewards.Student.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Events</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Events</p>
   
        <asp:GridView runat="server" ID="gvEvents" CssClass="table table-hover" AllowPaging="true" PageIndex="0" PageSize="5" AutoGenerateColumns="false" GridLines="None" OnSelectedIndexChanged="gvEvents_SelectedIndexChanged"
                      OnPageIndexChanging="gvEvents_PageIndexChanging">
            <Columns>
                <asp:ImageField DataImageUrlField="Picture" ReadOnly="true" ControlStyle-CssClass="gv-image"></asp:ImageField>
                <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="Date" HeaderText="Event Date"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"/>
                <asp:BoundField DataField="Points" HeaderText="Points"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"/>                           
                <asp:CommandField ShowSelectButton="true" SelectText="View">
                    <ControlStyle CssClass="btn btn-success d-block mx-auto"></ControlStyle>
                </asp:CommandField>                             
            </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
        <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>
