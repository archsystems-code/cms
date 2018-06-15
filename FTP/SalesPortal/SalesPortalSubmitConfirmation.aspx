<%@ Page Title="" Language="C#" MasterPageFile="~/SalesPortal/SalesPortalMaster.Master" AutoEventWireup="true" CodeBehind="SalesPortalSubmitConfirmation.aspx.cs" Inherits="ASI.Web.SalesPortal.SalesPortalSubmitConfirmation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"></asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="samples">

        <p>
            <EPiServer:Property ID="Property4" runat="server" PropertyName="ConfirmationText" />
        </p>

        <asp:HyperLink runat="server" ID="hplBackToSalesPortalLanding" CssClass="btn">Back To Sales Portal</asp:HyperLink>

        <asp:HyperLink runat="server" ID="hplBackToHomePage" NavigateUrl="/" CssClass="btn">Back To Home</asp:HyperLink>


    </div>

</asp:Content>
