<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="PressTrendTawk.aspx.cs" Inherits="ASI.Web.Views.Pages.PressTrendTawk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="press">
        <div class="trendHead">
            <AdageEpiLibrary:ImageProperty runat="server" PropertyName="BannerImage" AltTextMetaName="Description" />
        </div> 
        <asp:Repeater runat="server" ID="rptTrends">
            <HeaderTemplate>
                <ul class="trendPosts">
            </HeaderTemplate>
            <ItemTemplate>
                <li> 
                    <asp:HyperLink runat="server" ID="hlAssetLink">
                        <AdageEpiLibrary:ImageProperty ID="EpiServerImage1" runat="server" PropertyName="PressItemThumbnail" AltTextMetaName="Description" />
                    </asp:HyperLink>
                    <div>
                        <EPiServer:Property runat="server" PropertyName="PageName" CustomTagName="h3" />
                        <EPiServer:Property runat="server" PropertyName="PressItemDescription" />
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
