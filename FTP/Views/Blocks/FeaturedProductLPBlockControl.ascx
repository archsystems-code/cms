<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedProductLPBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.FeaturedProductLPBlockControl" %>

<EPiServer:Property ID="FeaturedProductHeader" runat="server" PropertyName="FeaturedProductHeader" CustomTagName="h2" CssClass="headerBar" />
<div class="whatsnextList">
    <div class="item">
        <asp:Image ID="featuredProductImage1" runat="server" />
        <div class="text noMargin">
            <h3>
                <asp:HyperLink ID="featuredProductLink1" runat="server" /></h3>
            <EPiServer:Property ID="FeaturedProductDetails1" runat="server" PropertyName="FeaturedProductDetails1" />
        </div>
    </div>
    <div class="item">
        <asp:Image ID="featuredProductImage2" runat="server" />
        <div class="text noMargin">
            <h3>
                <asp:HyperLink ID="featuredProductLink2" runat="server" /></h3>
            <EPiServer:Property ID="FeaturedProductDetails2" runat="server" PropertyName="FeaturedProductDetails2" />
        </div>
    </div>
    <div class="item">
        <asp:Image ID="featuredProductImage3" runat="server" />
        <div class="text noMargin">
            <h3>
                <asp:HyperLink ID="featuredProductLink3" runat="server" /></h3>
            <EPiServer:Property ID="FeaturedProductDetails3" runat="server" PropertyName="FeaturedProductDetails3" />
        </div>
    </div>
    <div class="item">
        <asp:Image ID="featuredProductImage4" runat="server" />
        <div class="text noMargin">
            <h3>
                <asp:HyperLink ID="featuredProductLink4" runat="server" /></h3>
            <EPiServer:Property ID="FeaturedProductDetails4" runat="server" PropertyName="FeaturedProductDetails4" />
        </div>
    </div>
</div>
