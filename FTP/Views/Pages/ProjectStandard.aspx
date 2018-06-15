<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" CodeBehind="ProjectStandard.aspx.cs" Inherits="ASI.Web.Views.Pages.ProjectStandard" %>

<%@ Register Src="~/Views/Controls/ProjectLeftNav.ascx" TagPrefix="uc1" TagName="ProjectLeftNav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftNav" runat="server">
	<section class="leftCol calloutBucket">
		<uc1:ProjectLeftNav runat="server" id="ProjectLeftNav" />
	</section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="mainContent borderless">
        <EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h1" />
		<EPiServer:Property runat="server" PropertyName="MainBody" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
