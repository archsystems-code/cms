<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Accordion.aspx.cs" Inherits="ASI.Web.Views.Pages.Accordion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="mainContent borderless accordionPage">
		<EPiServer:Property runat="server" CustomTagName="h1" PropertyName="Heading" />
		<div class="intro">
            <EPiServer:Property runat="server" PropertyName="MainBody" />
		</div>
        <EPiServer:Property runat="server" PropertyName="MainContent" />	
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
