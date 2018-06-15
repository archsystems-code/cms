<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="ProjectMain.aspx.cs" Inherits="ASI.Web.Views.Pages.ProjectMain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="projectMain">
		<EPiServer:Property ID="Property2" PropertyName="Intro" runat="server" CustomTagName="h1" />
		<EPiServer:Property ID="Property1" PropertyName="SegmentBoxes" CssClass="highlights" runat="server" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
