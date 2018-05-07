<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ASI.Web.Views.Pages.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="p:domain_verify" content="fdaea0455abf8971214a574e78bad051" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContent">
        <div class="rotatorWrapper">
            <div id="nav">
            </div>
            <asp:Repeater runat="server" ID="rptRotator">
                <HeaderTemplate>
                    <div class="slideshow">
                </HeaderTemplate>
                <ItemTemplate>
                    <div>
                        <div class="rotator">
                            <a href='<%# Eval("ImageLinkUrl") %>'>
                                <img src='<%# Eval("ImageUrl") %>' alt="" />
                            </a>
                            <asp:Panel runat="server" ID="pnlHeaderText" CssClass="description">
                                <h2><a href='<%# Eval("ImageLinkUrl") %>'><%# Eval("HeaderText") %></a></h2>
                            </asp:Panel>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
        <div class="homeSubNavigation">
            <EPiServer:Property runat="server" PropertyName="RotatorFooterLinks" CssClass="RotatorFooterLinks" />
            <EPiServer:Property ID="Property1" runat="server" PropertyName="RotatorFooterNewsletterSignup" CssClass="NewsletterSignup" />
        </div>
        <div class="welcome">
            <EPiServer:Property ID="Property2" runat="server" PropertyName="MainTitle" CustomTagName="h2" />
            <EPiServer:Property ID="Property3" runat="server" PropertyName="MainBody" />
        </div>
    </div>
    <div>
        <div class="mainContent">
            <div class="social">
                <div class="grayBox">
                    <EPiServer:Property ID="Property6" CssClass="calloutWrapper" runat="server" PropertyName="MiddleBanner">
                        <RenderSettings ChildrenCustomTag="div" />
                    </EPiServer:Property>
                </div>
            </div>
            <div class="homeBottom">
                <EPiServer:Property runat="server" PropertyName="LeftColumn" CustomTagName="div" CssClass="third">
                    <RenderSettings ChildrenCustomTag="div" ChildrenCssClass="box" />
                </EPiServer:Property>

                <div class="third">
                    <EPiServer:Property ID="Property4" runat="server" PropertyName="MiddleColumn">
                        <RenderSettings ChildrenCustomTag="div" ChildrenCssClass="box" />
                    </EPiServer:Property>
                </div>

                <div class="third events">
                    <EPiServer:Property ID="Property5" runat="server" PropertyName="RightColumn">
                        <RenderSettings ChildrenCustomTag="div" ChildrenCssClass="box" />
                    </EPiServer:Property>
                </div>
            </div>
            <div class="affiliations">
                <EPiServer:Property runat="server" PropertyName="AffiliationContent" />
            </div>
        </div>
    </div>
    <asp:Panel runat="server" ID="pnlPromotionFlyout" Visible="false">
        <div class="promotion-flyout">
            <EPiServer:Property ID="propPromotionFlyout" runat="server" PropertyName="PromotionFlyoutContent" />
            <i class="fa fa-times promotion-close"></i>
        </div>
    </asp:Panel>
</asp:Content>
