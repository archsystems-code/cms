<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/interior.Master" AutoEventWireup="True" CodeBehind="Landing.aspx.cs" Inherits="ASI.Web.Views.Pages.Landing" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div class="generalTemplate">
        <div class="mainHeader">
            <AdageEpiLibrary:ImageProperty ID="ImageProperty1" runat="server" PropertyName="Thumbnail" AltTextMetaName="Description" />
            <EPiServer:Property ID="Property2" runat="server" CustomTagName="h2" PropertyName="Heading" />
        </div>
		<div class="topCallout" runat="server" id="divTopCallout">
			<EPiServer:Property ID="Property1" runat="server" PropertyName="MainBody" />
			<EPiServer:Property ID="Property3" runat="server" CustomTagName="aside" PropertyName="Aside" />
		</div>
		<EPiServer:Property ID="Property4" runat="server" CssClass="landingPage segments" PropertyName="MainContentArea" />
        <EPiServer:Property ID="Property5" runat="server" CssClass="extraContent" PropertyName="ExtraContent" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
