<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="OneColStandard.aspx.cs" Inherits="ASI.Web.Views.Pages.OneColStandard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="mainContent borderless">
        <EPiServer:Property runat="server" PropertyName="Heading" />
		<EPiServer:Property runat="server" PropertyName="MainBody" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
