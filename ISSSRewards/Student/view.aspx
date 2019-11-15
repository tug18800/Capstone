<%@ Page Title="" Language="C#" MasterPageFile="~/Student/Student.master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="ISSSRewards.Student.view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="nestedHead" runat="server">
</asp:Content>

<asp:Content ID="points" ContentPlaceHolderID="points" runat="server">
    <asp:Label ID="lblPointsNav" runat="server" CssClass="h4 text-light mb-1 mr-3"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="nestedBody" runat="server">
    <div class="container m-bottom">
        <p class="text-center h1 mb-3">Events</p>   
        
<!--TITLE-->
        <div class="card container shadow">
            <div class="card-body">

<!--ERROR STATUS LABEL-->
                <div class="text-center mb-3">
                    <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="bg-error w-25 rounded px-3 py-1"></asp:Label>
                    <asp:Label ID="lblSuccess" runat="server" Visible="false" CssClass="bg-success w-25 rounded px-3 py-1 text-light"></asp:Label>
                </div>

<!--EVENT CONTENT-->            
                <asp:Label runat="server" CssClass="lead d-block bg-owl text-light text-center" ID="lblTitle"></asp:Label>
                <div class="row">
<!--PICTURE ROW-->                
                    <div class="col-sm mt-4"><asp:Image runat="server" CssClass="d-block mx-auto result-img" ID="imgEvent" /></div>
                </div>

<!--DATE/DESC COL-->

                 <div class="row">
                    <div class="col-sm mt-4" id="div1" runat="server">
                        <div class="row">
                            <div class="col-sm"><p class="d-inline lead font-weight-bold">Date Created: </p></div>
                            <div class="col-sm"> <asp:Label runat="server" CssClass="lead d-block ml-auto text-right" ID="lblDate"></asp:Label></div>
                        </div>
                        <div class="row">
                            <div class="col-sm"><p class="d-inline lead font-weight-bold">Date Posted: </p></div>
                            <div class="col-sm"> <asp:Label runat="server" CssClass="lead d-block ml-auto text-right" ID="lblCreated"></asp:Label></div>
                        </div>
                        <div class="row">
                            <div class="col-sm mt-4"><p class="lead d-block font-weight-bold">Description: </p></div>
                        </div>
                        <div class="row">
                            <div class="col-sm mt-2"><asp:Label runat="server" CssClass="lead d-block" ID="lblDesc"></asp:Label></div>  
                        </div>
                    </div>
                </div>

<!--POINT COL-->
                <div class="row w-50 d-block mx-auto">
                    <div class="col-sm mt-4 text-center">
                        <div class="card container shadow">
                            <div class="card-body">
                                <div class="row">
                                <p class="font-weight-bold mx-auto lead">Reward: </p>
                                </div>
                            
                                <div class="row">
                                    <asp:Label runat="server" CssClass="d-block mx-auto lead" ID="lblPoints"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<!--BOTTOM NAVIGATION BUTTONS-->
                <div class="row mt-5">
                    <asp:Button runat="server" ID="btnBack" Text="Back" CssClass="btn d-block mx-auto bg-owl text-light" OnClientClick="JavaScript:window.history.go(-1);return false;" />     
                    <button type="button" class="btn bg-owl text-light d-block mx-auto" data-toggle="modal" data-target="#exampleModal">RSVP</button>
                </div>
            </div>
        </div>
    </div>

<!--MODAL-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title text-center" id="exampleModalLabel">RSVP</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    <p class="lead text-center">How will you RSVP to the event?</p>
                  </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnRSVP1" Text="Can't Come" class="btn btn-danger d-block mx-auto" OnClick="btnRSVP_Click"/>
                    <asp:Button runat="server" ID="btnRSVP2" Text="Maybe" class="btn btn-warning d-block mx-auto" OnClick="btnRSVP_Click"/>
                    <asp:Button runat="server" ID="btnRSVP3" Text="Coming" class="btn btn-success d-block mx-auto" OnClick="btnRSVP_Click"/>

                </div>
                </div>
            </div>
        </div>
</asp:Content>
    