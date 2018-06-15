<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="InspirationalProjectLanding.aspx.cs" Inherits="ASI.Web.Views.Pages.InspirationalProjectLanding" %>

<%@ Register Src="~/Views/Controls/ProjectLeftNav.ascx" TagPrefix="uc1" TagName="ProjectLeftNav" %>
<%@ Register TagPrefix="menu" TagName="CollectionLeftNav" Src="~/Views/Controls/CollectionLeftNav.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNav" runat="server">
    <section class="leftCol calloutBucket">
        <menu:CollectionLeftNav runat="server" ID="leftNavMenu" />
        <asp:Panel runat="server" ID="pnlAskExpert" CssClass="askExpert">
            <h2>Ask the Material Expert...</h2>
            <EPiServer:Property ID="askTheExpertPanel" runat="server" PropertyName="AskTheMaterialExpertContent" CssClass="askExpert" />
        </asp:Panel>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="productInfoWrapper">
        <EPiServer:Property ID="Property1" PropertyName="InspirationalProjectName" runat="server" CustomTagName="h1" />
        <EPiServer:Property ID="Property2" runat="server" PropertyName="MainBody" CssClass="umbrellaContent" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
