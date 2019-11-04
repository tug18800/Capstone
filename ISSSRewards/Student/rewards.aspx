<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="rewards.aspx.cs" Inherits="ISSSRewards.Student.rewards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Rewards</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Rewards</p>
    </div>
    <div class="container">
        <br />
        <asp:GridView runat="server" ID="gvRewards" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None" OnRowDeleting="gvRewards_RowDeleting" 
                    OnSelectedIndexChanged="gvRewards_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="gvRewards_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID"/>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        
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
