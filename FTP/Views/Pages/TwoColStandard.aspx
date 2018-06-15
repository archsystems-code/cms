<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="TwoColStandard.aspx.cs" Inherits="ASI.Web.Views.Pages.TwoColStandard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="mainContent borderless">
		<div class="main">
            <EPiServer:Property runat="server" PropertyName="Heading" />
            <EPiServer:Property ID="Property1" runat="server" PropertyName="MainBody" />
		</div>
		<div class="side">
            <EPiServer:Property runat="server" PropertyName="RightColumn" />
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
