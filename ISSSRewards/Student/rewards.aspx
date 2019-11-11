﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="rewards.aspx.cs" Inherits="ISSSRewards.Student.rewards" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
    <title>Rewards</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container">
        <p class="text-center display-4">Rewards</p>
        <asp:GridView runat="server" ID="gvRewards" CssClass="table table-hover" AllowPaging="true" PageIndex="0" AutoGenerateColumns="false" GridLines="None"
                    OnSelectedIndexChanged="gvRewards_SelectedIndexChanged" PageSize="5" OnPageIndexChanging="gvRewards_PageIndexChanging">
            <Columns>
                <asp:ImageField DataImageUrlField="Picture" ReadOnly="true" ControlStyle-CssClass="gv-image"></asp:ImageField>
                <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center" />
                <asp:BoundField DataField="Date" HeaderText="Date Posted"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"/>
                <asp:BoundField DataField="Points" HeaderText="Points"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"/>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity"  ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center"/>                                
                <asp:CommandField ShowSelectButton="true" SelectText="Redeem">
                    <ControlStyle CssClass="btn btn-success d-block mx-auto"></ControlStyle>
                </asp:CommandField>                      
            </Columns>
            <PagerSettings FirstPageText="First" LastPageText="Last" Mode="Numeric" PageButtonCount="3" Visible="true" />
            <PagerStyle HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>

