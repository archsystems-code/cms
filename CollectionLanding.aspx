<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/ProductMaster.master" AutoEventWireup="true" CodeBehind="CollectionLanding.aspx.cs" Inherits="ASI.Web.Views.Pages.CollectionLanding" %>

<%@ Register TagPrefix="EPiCommerce" Namespace="ASI.Web.Views.Controls" Assembly="ASI.Web" %>
<%@ Register Src="~/Views/Controls/SampleRequests.ascx" TagName="SampleRequests" TagPrefix="uc" %>
<%@ Register Src="~/Views/Controls/SampleRequestModal.ascx" TagName="SampleRequestModal" TagPrefix="uc" %>
<%@ Register Src="~/Views/Controls/SampleOutOfStockModal.ascx" TagName="SampleOutOfStockModal" TagPrefix="uc" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <strong runat="server" id="spanCCWarning" visible="false" style="color: red;">NOTE:  The Collection Catalog property for this collection is not set.  To ensure proper navigational and product display, please set this property.</strong>
    <div class="productInfoWrapper">
        <h1>
            <EPiServer:Property ID="epiCollectionName" runat="server" PropertyName="CollectionName" />
            <asp:Image runat="server" ID="imgNewProduct" ImageUrl="/imgs/icon_new.gif" Visible="false" />

            <asp:Label runat="server" ID="lblEarthFriendly" Visible="false" CssClass="EarthFriendly"><img style="width: 14px;" src="/imgs/globe.png" /> <span style="top: -2px;
position: relative;">ASI Sustainable Product</span></asp:Label>

        </h1>

        <div class="collectionInfo">

            <asp:PlaceHolder ID="UpdatedIcon" runat="server">
                <div class="updatediconPanel">
                    <span class="updatedicon">
                        <img src="/imgs/ASI-Updated.jpg" />
                    </span>
                </div>
            </asp:PlaceHolder>

            <div style="overflow: hidden">
                <EPiServer:Property ID="Property2" runat="server" PropertyName="CollectionInfo" />
            </div>
            <asp:Panel ID="PanelSamples" runat="server" Visible="false">
                <div class="requestProductSample">

                    <asp:Repeater runat="server" ID="rptRequestChainsList" OnItemDataBound="rptRequestChainsList_ItemDataBound">
                        <ItemTemplate>
                            <p class="addsamplerequest">
                                <asp:LinkButton ID="btnRequestChain" runat="server" CssClass="openModal" OnClick="Chain_Click"></asp:LinkButton>

                                <asp:HiddenField runat="server" ID="hidRequestChainResourceSKU" />
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>

                    <p class="addsamplerequest" runat="server" id="pBox">
                        <asp:LinkButton ID="Box" runat="server" CssClass="openModal">Sample box offered for this collection</asp:LinkButton>
                    </p>

                    <p class="addsamplerequest" runat="server" id="pProductionBinder">
                        <asp:LinkButton ID="ProductBinder" runat="server" CssClass="openModal">Product binder offered for this collection</asp:LinkButton>
                    </p>

                    <p class="addsamplerequest" runat="server" id="pProductionBrochure">
                        <asp:LinkButton ID="ProductBrochure" runat="server" CssClass="openModal">Product brochure offered for this collection</asp:LinkButton>
                    </p>

                </div>
                <asp:Panel ID="PanelViewSample" CssClass="viewAssort" runat="server">
                    <p><a href="#" class="viewSampleItems" style="padding: 0">View Sample Box Assortment &raquo</a></p>
                </asp:Panel>
            </asp:Panel>

        </div>

        <asp:Panel CssClass="collectionThumbs" runat="server" ID="pnlCollectionThumbs">
            <div class="collectionWrap">
                <EPiServer:Property ID="Property7" runat="server" CustomTagName="h3" PropertyName="SubCollectionName" />
                <asp:Repeater runat="server" ID="rptCollections">
                    <ItemTemplate>
                        <div class="subCollection">
                            <h3>
                                <asp:Label ID="lbCollectionName" runat="server" /></h3>
                            <asp:Repeater runat="server" ID="rptProducts">
                                <HeaderTemplate>
                                    <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li runat="server" id="repeaterListItem">
                                        <asp:HyperLink runat="server" ID="hlThumb">
                                            <EPiCommerce:AssetImage runat="server" ID="AssetImage1" Entry='<%# (Container.DataItem) %>' AssetGroup="ThumbnailGroup" />
                                        </asp:HyperLink>
                                        <p>
                                            <asp:LinkButton ID="lbSample" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="Request" CssClass="openModal">Request Sample</asp:LinkButton>
                                            <asp:Label runat="server" CssClass="prodName" ID="displayName"></asp:Label>
                                            <span class="prodSku"><%# Eval("ID") %></span>
                                        </p>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>

                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <EPiServer:Property ID="Property6" runat="server" CssClass="extraTxt" PropertyName="ExtraContent" />
        </asp:Panel>
        
        <div class="collectionCallouts calloutBucket" runat="server" id="RightSideDiv">
            <asp:Panel runat="server" ID="pnlFeaturedProject" CssClass="featuredProject">
                <EPiServer:Property ID="Property3" runat="server" PropertyName="FeaturedProject" />
            </asp:Panel>
            <div class="productSpecs">
                <h2>Specifications</h2>
                <div>
                    <EPiServer:Property ID="Property4" runat="server" PropertyName="Specifications" />
                </div>
                <div class="print">
                    <asp:HyperLink runat="server" ID="hlPrintFriendly">
                        Print Friendly
                    </asp:HyperLink>
                </div>
            </div>
            <asp:Panel runat="server" ID="pressItemSection" CssClass="collectionPress">
                <h2>Press Featuring <%: CurrentPage.Name %>
                </h2>

                <asp:Repeater runat="server" ID="rptPressItems">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="relatedPressItem">
                            <asp:HyperLink runat="server" ID="hlPressItemPage">
                                <span class="pressTitle"><%# Eval("Name") %></span>
                            </asp:HyperLink>
                            <%# Eval("PressItemDescription") %>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:Panel>
        </div>
    </div>

    <div id="featuredProductWrap" class="featuredProducts">
        <asp:Repeater ID="rptProductList" runat="server">
            <HeaderTemplate>
                <p>
                Featured Products:
            </HeaderTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="hlCollectionLink" runat="server" CssClass="productListLink"></asp:HyperLink>&nbsp;-
							<asp:HyperLink ID="hlProductLink" runat="server" CssClass="productListLink product"></asp:HyperLink>
            </ItemTemplate>

            <FooterTemplate></p></FooterTemplate>
        </asp:Repeater>
    </div>

    <uc:SampleOutOfStockModal runat="server" ID="sampleOutOfStockModal" />
    <uc:SampleRequestModal runat="server" ID="sampleRequestModal" />


    <div id="specialChainTextContentTextDiv" class="chainTextModal" style="display: none">
        <div class="modalOverlay"></div>
        <div class="availSamples">
            <a href="#" class="close">x</a>
            <asp:Label ID="LabelSampleDetails" runat="server" />
        </div>
    </div>
    <div class="pagingNumber">
        <EPiServer:Property ID="Property5" runat="server" PropertyName="pagingNumber" />
    </div>
    <asp:Panel runat="server" ID="pnlPromotionFlyout" Visible="false">
        <div class="promotion-flyout">
            <EPiServer:Property ID="propPromotionFlyout" runat="server" PropertyName="PromotionFlyoutContent" />
            <i class="fa fa-times promotion-close"></i>
        </div>
    </asp:Panel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="LeftNav" runat="server">
    <section class="leftCol calloutBucket">
        <asp:Panel runat="server" ID="pnlAskExpert" CssClass="askExpert">
            <h2><asp:Literal runat="server" ID="testLiteral"></asp:Literal></h2><!--Ask the Material Expert...-->
            <EPiServer:Property ID="askExpertPanel" runat="server" PropertyName="AskTheMaterialExpertContent" CssClass="askExpert" />
        </asp:Panel>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/js/lib/underscore.js"></script>
    <script src="/js/lib/jquery.pager.js"></script>
    <script>

        var pagingNumber = $('.pagingNumber span').text();

        $('.prodName:contains(".")').remove();
        $('.subCollection:first-of-type h3').remove();
        //$('.subCollection:first-of-type h3 span:empty').parent().remove();

        if (pagingNumber !== "") {
            $('.collectionWrap').page({
                innerItemTag: "div[class='subCollection']",
                pageSize: pagingNumber,
                insertBefore: true,
                useNextPrev: false,
                pagerInsideContent: true
            });
        }
    </script>
</asp:Content>
