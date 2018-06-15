<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Blog.Master" AutoEventWireup="true" CodeBehind="BlogList.aspx.cs" Inherits="ASI.Web.Views.Pages.Blog.BlogList" %>
<%@ Register TagPrefix="uc" TagName="BlogSidebar" Src="~/Views/Controls/BlogSidebar.ascx" %>
<%@ Register TagPrefix="uc" TagName="BlogItem" Src="~/Views/Controls/BlogItem.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Sidebar" runat="server">
	<uc:BlogSidebar ID="Sidebar" runat="server"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Repeater runat="server" ID="rptRecentEntries">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
	        <uc:BlogItem ID="biEntry" runat="server"/>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
