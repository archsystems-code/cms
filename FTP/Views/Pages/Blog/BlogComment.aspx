<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Blog.Master" AutoEventWireup="true" CodeBehind="BlogComment.aspx.cs" Inherits="ASI.Web.Views.Pages.Blog.BlogComment" %>
<%@ Register TagPrefix="uc" TagName="BlogSidebar" Src="~/Views/Controls/BlogSidebar.ascx" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Sidebar" runat="server">
    <uc:BlogSidebar ID="Sidebar" runat="server"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <strong style="color:red;">** NOTE:  This page is only viewable in Edit Mode</strong>

    <h3>Comment</h3>
    <ul>
        <li>
            Name:  <EPiServer:Property runat="server" PropertyName="CommenterName" />
        </li>
        <li>
            Email:  <EPiServer:Property runat="server" PropertyName="Email" />
        </li>
        <li>
            Homepage:  <EPiServer:Property runat="server" PropertyName="Homepage" />
        </li>
        <li>
            Comment:  <EPiServer:Property runat="server" PropertyName="Comment" />
        </li>
    </ul>
</asp:Content>

