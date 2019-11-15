<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="events.aspx.cs" Inherits="ISSSRewards.Student.Events" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Events</title>
</asp:Content>

<asp:Content ID="points" ContentPlaceHolderID="points" runat="server">
    <asp:Label ID="lblPointsNav" runat="server" CssClass="h4 text-light mb-1 mr-3"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <div class="row mb-5">
            <div class="col-sm-12 text-center">
                <img src="img/icons/calendar.png" class="img-display d-inline mr-3 mb-4" /><p class="text-center d-inline display-4">Events</p><img src="img/icons/calendar.png" class="img-display d-inline ml-3 mb-4" />
            </div>
            <div class="col-sm-12">
                <div class="text-center bg-owl text-light py-2 rounded"> 
                    <p class="text-center h5 d-inline">Upcoming Events</p>
                </div>
 
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
        </div>
    </div>
</asp:Content>
