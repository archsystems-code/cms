<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="PressAds.aspx.cs" Inherits="ASI.Web.Views.Pages.PressAds" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="press">
        <AdageEpiLibrary:HeadingH1Property runat="server" PropertyName="Heading" />
        <asp:Repeater runat="server" ID="rptAds">
            <HeaderTemplate>
                <ul class="adPosts">
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <a href='<%# Eval("PressItemFile") %>' target="_blank">
					    <AdageEpiLibrary:ImageProperty runat="server" PropertyName="PressItemThumbnail" AltTextMetaName="Description" />
                    </a>
				    <p>
                        <a href='<%# Eval("PressItemFile") %>' target="_blank">
                            <EPiServer:Property runat="server" PropertyName="PageName" />
                            <asp:Literal runat="server" ID="litPubDate" />
                        </a>
                    </p>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
<%--        <ul class="adPosts">
            <li>
                <a href="#">
					<img src="http://placehold.it/225x280" />
                </a>
				<p><a href="#"><span>vmsd</span>
				September 2013</a></p>
            </li>
            <li>
                <a href="#">
					<img src="http://placehold.it/225x280" />
                </a>
				<p><a href="#"><span>vmsd</span>
				September 2013</a></p>
            </li>
			<li>
                <a href="#">
					<img src="http://placehold.it/225x280" />
                </a>
				<p><a href="#"><span>vmsd</span>
				September 2013</a></p>
            </li>
			<li>
                <a href="#">
					<img src="http://placehold.it/225x280" />
                </a>
				<p><a href="#"><span>vmsd</span>
				September 2013</a></p>
            </li>
			<li>
                <a href="#">
					<img src="http://placehold.it/225x280" />
                </a>
				<p><a href="#"><span>vmsd</span>
				September 2013</a></p>
            </li>
        </ul>--%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
