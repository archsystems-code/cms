<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="BrandLanding.aspx.cs" Inherits="ASI.Web.Views.Pages.BrandLanding" %>

<%@ Register TagPrefix="menu" TagName="CollectionLeftNav" Src="~/Views/Controls/CollectionLeftNav.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNav" runat="server">
    <section class="leftCol calloutBucket">
        <menu:CollectionLeftNav runat="server" ID="leftNavMenu" />

        <asp:Panel runat="server" ID="pnlAskExpert" CssClass="askExpert">
            <h2>Ask the Material Expert...</h2>
            <EPiServer:Property ID="Property3" runat="server" PropertyName="AskTheMaterialExpertContent" />
        </asp:Panel>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="productInfoWrapper">
        <EPiServer:Property ID="Property2" runat="server" CustomTagName="header" CssClass="brandHeader" PropertyName="BrandHeading" />
        <EPiServer:Property ID="Property1" runat="server" CssClass="productTiles" PropertyName="MainBody" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
