<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="CEUCongratulations.aspx.cs" Inherits="ASI.Web.Views.Pages.CEU.CEUCongratulations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContent borderless">
        <EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h1" CssClass="grayTitleBar"  />
		<EPiServer:Property runat="server" PropertyName="MainBody" CssClass="congrats"/>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
