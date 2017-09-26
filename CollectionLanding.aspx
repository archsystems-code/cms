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
        <div id="swatchModal" style="display: none;">Foo</div>
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
    <script type="text/javascript" src="https://malsup.github.io/min/jquery.cycle.all.min.js"></script>
    <script type="text/javascript">
      'use strict';
    
      $(document).ready(function () {
        const hasDigitalCatalog = $("body").html().includes("Download Digital Catalog");
        const hasInstallationVideo = $(".videoLink").length;
        const hasMaterialExpert = $(".askExpert").length;
        const hasPress = $(".collectionPress").length;
        const hasSamples = $(".addsamplerequest").length;
        const collectionColor = $(".productInfoWrapper h1").css("background-color");
        const availableForPurchase = $(".purchaseASI").length;
    
        addContentSkeleton();
        movePlusSigns(collectionColor);
        moveWorlds();
        moveCarts();
        initSwatchModal();
        initSlideshow();
        redesignLayout();
        addSwatchFeatures();
    
        let $materialExpert = $($(".askExpert")[0]);
        let $featuredProject = $(".featuredProject");
        if ($featuredProject.length) {
          $($featuredProject.children().children()[0]).text("Additional Inspirational Project Photos")
          $($(".tabsContainer ul")[0]).append("<li class='projectPhotos Featured' style='cursor: pointer'></li>")
          let projectPhotos =
            "<svg id='featured' width='200' height='100%' data-name='featured' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 554.21 153.81'><defs><style>.featured-text{isolation:isolate;font-size:55.25px;font-family:HelveticaNeueLTStd-Th, Helvetica Neue LT Std; fill:#d78f54; font-weight: lighter;}.featured-cls-1{fill:#d97e43;}.featured-cls-2{fill:none;opacity:0.08;}.featured-cls-3{fill:#5b7f71;}.featured-cls-4{fill:#7ea0c4;}.featured-cls-5{fill:#815374;}.featured-cls-6{fill:#edaa00;}.featured-cls-7{fill:#753d29;}</style></defs><text class='featured-text' transform='translate(152.31 95.16)'>Project Photos</text><circle class='featured-cls-2' cx='76.91' cy='76.91' r='76.91'/><polygon class='featured-cls-3' points='77.09 79.14 107.4 91.49 106.84 122.5 77.09 79.14'/><polygon class='featured-cls-4' points='77.09 79.14 77.09 113.94 106.84 122.5 77.09 79.14'/><polygon class='featured-cls-5' points='77.09 79.14 77.09 113.94 47.48 122.5 77.09 79.14'/><polygon class='featured-cls-6' points='77.09 79.14 46.47 91.61 47.48 122.5 77.09 79.14'/><polygon class='featured-cls-7' points='77.09 79.14 28.99 66.09 46.47 91.61 77.09 79.14'/><polygon class='featured-cls-3' points='77.09 79.14 58.04 55.52 28.99 66.09 77.09 79.14'/><polygon class='featured-cls-4' points='77.09 79.14 58.04 55.52 77.09 31.31 77.09 79.14'/><polygon class='featured-cls-5' points='77.09 79.14 95.93 55.52 77.09 31.31 77.09 79.14'/><polygon class='featured-cls-6' points='124.82 66.09 95.93 55.52 77.09 79.14 124.82 66.09'/><polygon class='featured-cls-7' points='124.82 66.09 107.4 91.49 77.09 79.14 124.82 66.09'/></svg>"
          $(".projectPhotos").append(projectPhotos);
        }
        let $productSpecs = $(".productSpecs");
        let $press = $(".collectionPress");
        let $images = $(".collectionThumbs");
        $images.addClass("tabContentContainer");
    
        $materialExpert.removeClass("askExpert");
        $materialExpert.remove();
        $press.remove();
        $featuredProject.remove();
        $productSpecs.remove();
    
        let productPhotos =
          "<svg version='1.1' id='pictures' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 212 51.8' style='enable-background:new 0 0 212 51.8;' xml:space='preserve' width='200' height='100%'><style type='text/css'>.st0{fill:" +
          collectionColor +
          ";}.st1{font-size:20.25px;font-family:HelveticaNeueLTStd-Th, Helvetica Neue LT Std; font-weight: lighter;}.st3{fill:none;}.st4{fill:" + collectionColor + ";}.st5{fill:" + collectionColor + ";}.st6{fill:" + collectionColor + ";}</style><text transform='matrix(1 0 0 1 59.3057 33.5787)' class='st0 st1 st2'>Product Images</text><path class='st3' d='M25.9,0C11.6,0,0,11.6,0,25.9s11.6,25.9,25.9,25.9s25.9-11.6,25.9-25.9C51.7,11.6,40.2,0,25.9,0L25.9,0L25.9,0'/><polygon class='st0' points='35.4,12.8 24,24.3 35.5,35.8 '/><polygon class='st4' points='35.4,12.8 24,24.3 12.4,12.7 '/><polygon class='st5' points='12.7,35.7 24.1,24.3 12.5,12.8 '/><polygon class='st6' points='35.5,35.7 24.1,24.3 12.5,35.9 '/><polygon class='st0' points='36.9,15.4 36.9,36.9 15.6,36.9 15.6,39.1 39.3,39.1 39.3,15.4 '/></svg>";
        $($(".tabsContainer ul")[0]).append("<li class='productImages Pictures' ></li>")
        $(".productImages").append(productPhotos);
    
        if (hasSamples) {
          $($(".tabsContainer ul")[0]).append("<li class='requestSample'></li>");
          $(".requestSample").css("display", "flex");
          $(".requestSample").html($('.addsamplerequest'));
          $(".requestSample a").css("color", "#d78f54");
          $(".requestSample a").css("font-family", "HelveticaNeueLTStd-Th, Helvetica Neue LT Std");
          $(".requestSample a").css("font-size", "20px");
          $(".requestSample a").css("font-weight", "lighter");
          $(".requestSample a").css("display", "flex");
          $(".requestSample a").css("align-items", "center");
          $(".addsamplerequest").css("background-image", "none");
          $(".addsamplerequest").css("display", "flex");
          $(".addsamplerequest").css("align-items", "center");
          Array.from($('.addsamplerequest a')).forEach(function(el) {
              $(el).html($(el).html().replace("Click to", ""))
            })
          let requestProductSample =
            "<svg style='margin-right: 10px;' width='35'  id='chain' data-name='Chain' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100.13 110.13'><defs><style>.chain-1{fill:#6d6c72;}.chain-2{fill:#fefefe;}.chain-3{fill:#6e6d73;}.chain-4{fill:#fcfbfc;}.chain-5{fill:#f5f4f5;}.chain-6{fill:#f1f0f2;}.chain-7{fill:#e5e5e7;}.chain-8{fill:#e4e4e7;}.chain-9{fill:#d5d4d7;}.chain-10{fill:#6f6f71;}</style></defs><path class='chain-1' d='M47,1h7c2.52,1,5.28.85,7.82.87C79.19,2,100.28,22.35,100,43.09c-.07,5.16.16,10.33-.11,15.49-1.34,25.76-28.29,42-46.35,42-21.24.1-36.76-8.7-47.4-26.79-2.91-5-3.71-10.41-3.93-15.94-.54-13.65-1-27.17,8.51-38.84,8.66-10.58,19-17.16,32.93-17.51C44.75,1.51,46,1.84,47,1Z' transform='translate(-0.94 -0.93)'/><path class='chain-2' d='M47,1c-1.3,1.7-3.35,1.19-5,1.55C17,7.78.07,30.61,3,55.15,6,80.36,27.31,99,52.24,98.28s45.54-20.47,47-45.09C100.72,27.77,83,6.07,57.59,2.1,56.37,1.91,54.86,2.46,54,1c14.67,0,29.33.07,44-.07,2.5,0,3.07.57,3.07,3.07q-.14,52,0,104c0,2.5-.56,3.07-3.06,3.06q-47-.15-94,0c-2.5,0-3.07-.56-3.06-3.06q.14-52,0-104C.93,1.5,1.5.91,4,.93,18.33,1.07,32.67,1,47,1Z' transform='translate(-0.94 -0.93)'/><path class='chain-3' d='M40,77c-1.76-2.53-4.28-4.62-4.69-8-1.57-2.8,1.09-4,2.44-5,4.27-3.23,7.72-7.22,11.35-11.07,3.53-3,5.14-8.1,10.2-9.51a6.34,6.34,0,0,1,2.32-.63,2.93,2.93,0,0,1,1.37.65,14.45,14.45,0,0,1,2.15,7c.66,6.73,1.7,13.43,3,20.07.64,3.29-.27,5.12-3.47,5.92C59.35,77.77,54.1,79.15,48.73,80c-5.52.83-6.49-.06-7.31-5.72A2.46,2.46,0,0,1,40,77Z' transform='translate(-0.94 -0.93)'/><path class='chain-4' d='M62.06,44a2.81,2.81,0,0,1-.93.13c-2.2.89-3.9.12-5.31-1.59-2.63-3.89-6.21-6.91-9.53-10.15-2.43-2.37-5.07-2.44-7.5-.06-7.14,7-15.27,12.81-22.25,20-2.75,2.82-3.25,5.23-.29,8,3.61,3.42,6,8,10.32,10.76.87,1.12,2.07,2.13,1.35,3.81C26.3,77,25,76.1,23.5,74.58Q15.85,66.69,8.08,58.92c-1.92-1.91-2-3.28.11-5.26C22,40.88,35.68,28,49.38,15.1c1.3-1.22,2.46-2.35,4.13-.52C59.33,21,65.18,27.33,71,33.73A.73.73,0,0,1,70.86,35c-.55,1.34-1.11,2.69-2.84,2.85l-3.93,4C64.46,43.55,63.72,44.2,62.06,44Z' transform='translate(-0.94 -0.93)'/><path class='chain-5' d='M62.06,44l2-2.13c3.17,8,3.09,16.52,4.65,24.78C70.68,76.94,70.4,77,60.11,78.92c-4.08.77-8.29,1.16-12.19,2.46-4.64,1.55-7.21.55-8-4.38.43-3.5-2.34-7,0-11.23,2.36,2.76,2.23,5.86,2.69,8.54.77,4.42,3.11,5.46,7.08,4.45,4.34-1.11,8.71-2.14,13.07-3.2,2-.5,4.29-1.32,3.86-3.75-1.59-9-1.69-18.16-4-27A3.06,3.06,0,0,0,62.06,44Z' transform='translate(-0.94 -0.93)'/><path class='chain-6' d='M68,37.83,70.86,35c-.38,2.25,1.54,3.19,2.7,4.46,5.49,6,11,12,16.72,17.77,2.63,2.65,2.59,4.44-.28,6.76-3.47,2.8-6,6.65-9.75,9.19-1.1.26-1.52-.17-1.31-1.27,2.63-2.74,5.17-5.58,7.92-8.21,2.25-2.15,2.47-4,.19-6.29C80.6,51,75,43.77,68,37.83Z' transform='translate(-0.94 -0.93)'/><path class='chain-7' d='M27.92,74.86l-3-1.72c0-1.72,1.32-2.62,2.45-3.56,5.75-4.79,11.12-10,16.43-15.24,1.51-1.49,3.06-3.24,5.62-2.1a1.57,1.57,0,0,1,.66,2L35.26,69C32.58,70.69,30.95,73.66,27.92,74.86Z' transform='translate(-0.94 -0.93)'/><path class='chain-8' d='M78.94,71.88l1.31,1.27c-2.29,2.14-4.55,4.3-6.88,6.4-.75.67-1.5,2.13-2.74.56a1.6,1.6,0,0,1,.83-2.75C74.78,76.58,76.16,73.3,78.94,71.88Z' transform='translate(-0.94 -0.93)'/><path class='chain-9' d='M50.13,54.22l-1-1.19a2.39,2.39,0,0,1,.31-3.88c3.46-2.41,5.22-6.31,8.34-9,1.5,1,1.27,3.46,3.37,3.93Z' transform='translate(-0.94 -0.93)'/><path class='chain-3' d='M57.76,40.17c.88,2.85-.14,4.92-2.39,6.78S51.19,51,49.11,53C42.9,58.79,36.68,64.54,30.5,70.33c-1.59,1.49-3,3.13-5.53,2.81-4.34-4.59-8.6-9.25-13-13.74-2.38-2.41-2.47-4.31.15-6.63,9.22-8.13,18.36-16.35,27.49-24.58C42,26,43.93,26.53,46,28.66,49.87,32.56,53.84,36.34,57.76,40.17Z' transform='translate(-0.94 -0.93)'/><path class='chain-10' d='M51.31,22.24c1.62.44,2.82,1.12,2.82,2.69a2.65,2.65,0,0,1-2.79,2.87,2.51,2.51,0,0,1-2.57-2.55C48.67,23.44,50,22.71,51.31,22.24Z' transform='translate(-0.94 -0.93)'/></svg>"
          $(".requestSample a").prepend(requestProductSample);
        }
    
        function addContentSkeleton() {
          $($('.collectionInfo').children()[0]).children().attr("id", "mainContainer");
          let content = $("#mainContainer").children();
          let tabsContainer = $(
            "<div class='tabsContainer'><ul style='margin-top: 15px; display: flex; list-style-type: none; width: 100%; flex-wrap: wrap;'></div>"
          )
          let instructions = $(
            "<p id='instructions'><strong style='font-size: 16px; font-weight: lighter; line-height: 1em;'>Click images below for <span style='font-weight: bold;'>Specifications, Installation details, request individual samples,</span> or <span style='font-weight: bold;'>purchase the material.</span></strong></p>"
          );
          $("#mainContainer").html("").append("<div id='main'></div>")
          $("#main").append(content).append(tabsContainer).append(instructions);
          $(".slideshow").css("margin-bottom", "10px");
        }
    
        function redesignLayout() {
          $(".productInfoWrapper h1").css("margin", "0");
          $("#MainContent_MainContent_RightSideDiv").hide();
          $(".subCollection ul").css("display", "flex");
          $(".subCollection ul").css("flex-wrap", "wrap");
          $(".subCollection ul").css("width", "690px");
          $(".subCollection ul").css("justify-content", "space-around");
          $(".subCollection ul li").css("width", "200px");
          $(".tabsContainer ul li").css("cursor", "pointer");
          $(".interior nav ul li a").css("width", "200px");
          $(".interior nav ul li a img:first-child").css("width", "125px");
          $(".interior nav ul li a img:first-child").css("height", "125px");
          $(".interior nav ul li a img:first-child").css("margin-left", "0");
          $(".interior nav ul li a span img").css("width", "15px");
          $(".interior nav ul li a span img").css("height", "15px");
          $(".interior nav ul li a span img:first-child").css("margin-left", "5px");
          $('.prodSku').css("font-weight", "bold");
          $('.prodSku').css("font-size", "20px");
          $('.prodName').css("font-weight", "bold");
          $('.prodName').css("font-size", "20px");
          $(".otherProjectsCopy a").attr("target", "_blank");
        }
    
        function addSwatchFeatures() {
          const purchase = $(".purchaseASI").length;
          Array.from($(".subCollection ul li")).forEach(function (el, i) {
            let ajaxUrl = $(el).children()[0].href;
            let productSku = $($(el).children()[1]).children().closest(".prodSku");
            let productName = $($(el).children()[1]).children().closest(".prodName");
            let productSample = $($(el).children()[1]).children().closest(".openModal");
            if (localStorage.getItem(productSku.text())) {
              productSample = localStorage.getItem(productSku.text());
            } else {
              localStorage.setItem(productSku.text(), productSample.prop("outerHTML"))
            }
            let productSpecs = $(
              "<svg id='specs' class='specIcon' width='30' height='100%' data-name='specs' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 125 132.88' style='margin-right: 5px; cursor: pointer;'><defs><style>.specs-cls-1{fill:none;}.specs-cls-2{fill:#825474;}.specs-cls-3{fill:#763e2a;}.specs-cls-4{fill:#7ea0c3;}.specs-cls-5{fill:#ebab21;}.specs-cls-6{fill:#5b7f71;}}</style></defs><path class='specs-cls-1' d='M26.13-21.13A66.44,66.44,0,1,0,92.57,45.31,66.44,66.44,0,0,0,26.13-21.13' transform='translate(40.31 21.13)'/><polygon class='specs-cls-2' points='66.52 43.83 53.41 21.13 40.31 43.83 66.52 43.83 66.52 43.83'/><polygon class='specs-cls-3' points='79.56 66.44 66.45 43.74 53.35 66.44 79.56 66.44 79.56 66.44'/><polygon class='specs-cls-4' points='92.67 89.13 79.56 66.43 66.45 89.13 92.67 89.13 92.67 89.13'/><polygon class='specs-cls-5' points='79.56 111.87 66.45 89.17 53.35 111.87 79.56 111.87 79.56 111.87'/><polygon class='specs-cls-6' points='92.74 43.84 79.63 21.13 66.52 43.84 92.74 43.84 92.74 43.84'/><polygon class='specs-cls-5' points='66.52 43.78 53.41 66.48 40.31 43.78 66.52 43.78 66.52 43.78'/><polygon class='specs-cls-4' points='79.63 21.13 66.52 43.83 53.41 21.13 79.63 21.13 79.63 21.13'/><polygon class='specs-cls-6' points='79.56 66.4 66.45 89.1 53.35 66.4 79.56 66.4 79.56 66.4'/><polygon class='specs-cls-2' points='92.67 89.14 79.56 111.85 66.45 89.14 92.67 89.14 92.67 89.14'/><polygon class='specs-cls-3' points='66.52 89.17 53.41 111.87 40.31 89.17 66.52 89.17 66.52 89.17'/></svg>"
            )
            productSpecs.data("url", ajaxUrl);
            let productBuy = $(
              "<svg width='30' height='30' class='shopIcon' version='1.1' id='shop' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 45.6 45.6' style='cursor: pointer;' xml:space='preserve'><path d='M22.8,0C10.2,0,0,10.2,0,22.8s10.2,22.8,22.8,22.8c12.6,0,22.7-10.1,22.8-22.7C45.7,10.3,35.5,0.1,22.9,0	C22.9,0,22.8,0,22.8,0z M39.6,16.5L34.8,31H17.7c0.3,1.1,0.5,1.8,0.5,1.9s0.3,1.1,1.2,1.1h12.8c2,0,3.7,1.7,3.7,3.7c0,0,0,0.1,0,0.1	c0,2.1-1.7,3.8-3.8,3.8c-2.1,0-3.8-1.7-3.8-3.8c0-0.6,0.1-1.2,0.4-1.7h-6.2c0.3,0.5,0.4,1.1,0.4,1.7c0,2.1-1.7,3.8-3.8,3.8	s-3.8-1.7-3.8-3.8c0-1.2,0.5-2.4,1.5-3.1c-0.3-0.4-0.5-0.8-0.6-1.3c-0.1-0.3-3.5-13.3-5.6-22c-0.2-0.7-0.4-0.7-0.6-0.7H7.1V8.6H10	c1.3,0,2.4,1,2.6,2.3c0.3,1.1,0.5,2.3,0.8,3.5h26.2V16.5z'/><path d='M19,39.5c0.9,0,1.7-0.8,1.7-1.7s-0.8-1.7-1.7-1.7c-0.9,0-1.7,0.8-1.7,1.7C17.3,38.7,18.1,39.5,19,39.5z'/><path d='M32,39.5c0.9,0,1.7-0.8,1.7-1.7s-0.8-1.7-1.7-1.7l0,0c-0.9,0-1.7,0.8-1.7,1.7S31.1,39.5,32,39.5z'/><path d='M17.1,28.9h16.1l4.1-12.4H13.9C15.1,21,16.3,25.7,17.1,28.9z'/></svg>"
            )
            productBuy.data("url", ajaxUrl);
            let iconsContainerId = "iconsContainer-" + i;
            $($(el).children()[1]).html("").append(productSku).append(productName).append("<div id=" +
              iconsContainerId + " style='display: flex; justify-content: center;'></div>")
            $("#" + iconsContainerId).html("").append(productSpecs)
            if (productSample.length) {
              $("#" + iconsContainerId).append($(productSample).html(
                "<svg version='1.1' id='Layer_1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 24 24' style='margin-right: 10px;' xml:space='preserve' width='30' height='100%'><style type='text/css'>.sample-chain{fill:#D78F54;}</style><path class='sample-chain' d='M22,8v12H6V8H22z M24,6H4v16h20V6z M22,4H2v16h1V5h19V4z M20,2H0v16h1V3h19V2z'/></svg>"
              ));
            }
            if (purchase) {
              $("#" + iconsContainerId).append(productBuy)
            }
          });
        }
    
        function moveWorlds() {
          Array.from($(".sustainable")).forEach(function (el) {
            let $world = $(el);
            $(el).parent().parent().find("a").find("span").css("width", "inherit");
            $(el).parent().parent().find("a").find("span").append($world);
          });
        }
    
        function moveCarts() {
          Array.from($(".forPurchase")).forEach(function (el) {
            let $cart = $(el);
            $(el).parent().parent().find("a").find("span").css("width", "inherit");
            $(el).parent().parent().find("a").find("span").append($cart);
          });
        }
    
        function movePlusSigns(color) {
          if (window.location.href.indexOf("ASI-Stone")) {
            Array.from($(".plus")).forEach(function (el, i) { 
              $(el).parent().css("position", "absolute")
              $(el).css("background", color)
              $(el).css("font-size", "inherit")
              $(el).css("border-radius", "50%")
              if (i < 3) {
                $(el).parent().css("top", "50px")
                $(el).css("padding", "10px")
              } else if (i == 3) {
                $(el).parent().css("top", "-15px")
                $(el).parent().css("right", "0")                                      
                $(el).css("padding", "5px")
              } else {      
                $(el).parent().css("top", "-15px")
                $(el).parent().css("right", "30px")                                      
                $(el).css("padding", "5px")
              }
            })
          } else {
            Array.from($(".plus")).forEach(function (el) {
              $(el).parent().css("position", "absolute")
              $(el).parent().css("top", "50px")
              $(el).css("background", color)
              $(el).css("font-size", "inherit")
              $(el).css("border-radius", "50%")
              $(el).css("padding", "10px")
            })
          }
        }
    
        function initSwatchModal() {
          $("#swatchModal").dialog({
            autoOpen: false
          });
        }
    
        function initSlideshow() {
          if ($(".slideshow").length) {
            $(".slideshow")
              .before(
                '<div id="prev"><svg version="1.1" id="Livello" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 256 256" style="enable-background:new 0 0 256 256;" xml:space="preserve"><style type="text/css">.st10{fill:#D78F54;stroke:#D78F54;}</style><path class="st10" d="M204.5,31.3c0.1,6.2-2.3,12.5-7,17.3l-78,79.3L199,206c9.6,9.4,9.7,24.9,0.3,34.5c-9.4,9.6-24.9,9.7-34.5,0.3L50.6,128.6L162.8,14.5c9.4-9.6,24.9-9.734.5-0.3C202,18.9,204.5,25.1,204.5,31.3z"/></svg><div>'
              )
              .before(
                '<div id="next"><svg version="1.1" id="Livello_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 256 256" enable-background="new 0 0 256 256" xml:space="preserve"><path fill="#D78F54" stroke="#D78F54" d="M50.6,223.9c0-6.2,2.4-12.5,7.1-17.2l78.7-78.6L57.7,49.3c-9.5-9.5-9.5-25,0-34.5c9.5-9.5,25-9.5,34.5,0L205.4,128L92.2,241.1c-9.5,9.5-25,9.5-34.5,0C53,236.4,50.6,230.1,50.6,223.9z"/></svg></div>'
              )
              .cycle({
                fx: "fade",
                prev: "#prev",
                next: "#next",
                pause: 1,
                timeout: 5000,
                speed: 1500,
                height: 400,
                fit: true
              });
            $("#prev").css("position", "relative");
            $("#prev").css("top", "200px");
            $("#prev").css("width", "30px");
            $("#prev").css("height", "30px");
            $("#prev").css("z-index", "10");
            $("#prev").css("margin-top", "-30px");
            $("#prev").css("cursor", "pointer");
            $("#next").css("position", "relative");
            $("#next").css("float", "right");
            $("#next").css("width", "30px");
            $("#next").css("height", "30px");
            $("#next").css("top", "170px");
            $("#next").css("z-index", "10");
            $("#next").css("cursor", "pointer");
          }
        }
    
        function showPictures() {
          $("#instructions").show();
          $(".tabContentContainer").replaceWith($images);
          $(".tabsContainer ul li").css("cursor", "pointer");
          addSwatchFeatures();
        }
    
        function showSpecs() {
          $(".tabContentContainer").replaceWith($productSpecs);
          $productSpecs.addClass("tabContentContainer");
          $("#instructions").hide();
          $(".tabsContainer ul li").css("cursor", "pointer");
        }
    
        function showPress() {
          $(".tabContentContainer").replaceWith($press);
          $press.addClass("tabContentContainer");
          $("#instructions").hide();
          $(".tabsContainer ul li").css("cursor", "pointer");
        }
    
        function showMaterials() {
          $(".tabContentContainer").replaceWith($materialExpert);
          $materialExpert.addClass("tabContentContainer");
          $("#instructions").hide();
          $(".tabsContainer ul li").css("cursor", "pointer");
        }
    
        function showFeaturedProjects() {
          $("#instructions").hide();
          $(".tabContentContainer").replaceWith($featuredProject);
          $featuredProject.addClass("tabContentContainer");
          $(".tabsContainer ul li").css("cursor", "pointer");
        }
    
        let $catalogLi = '';
        if (hasDigitalCatalog) {
          $catalogLi = $("<li class='' style='display: flex;'></li>")
          let $catalog = $('a:contains("Download Digital Catalog")')
          $('p:contains("Download Digital Catalog")').css("display", "none")
          $catalog.css("display", "flex")
          $catalog.css("align-items", "center")
          $catalog.attr("target", "_blank")
          $catalog.html("<svg version='1.1' id='plusIcon' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 24 24' style='enable-background:new 0 0 24 24;' xml:space='preserve' width='25'> <style type='text/css'>.plus{fill:#D78F54;}</style><path class='plus' d='M12,0C5.4,0,0,5.4,0,12s5.4,12,12,12s12-5.4,12-12S18.6,0,12,0z M19,14h-5v5h-4v-5H5v-4h5V5h4v5h5V14z'/></svg><p style='color: #d78f54; font-family: HelveticaNeueLTStd-Th, Helvetica Neue LT Std; font-size: 20px; font-weight: lighter; margin-bottom: 0; margin-left: 10px;'>Catalog</p>")
          $catalogLi.append($catalog)
        }
        let $videoLi = '';
        if (hasInstallationVideo) {
          $videoLi = $("<li class='video' style='display: flex;'></li>")
          let $video = $(".videoLink")
          $video.remove();
          $video.css("display", "flex")
          $video.css("align-items", "center")
          $video.attr("target", "_blank")
          $video.html("<svg version='1.1' id='video' width='35'  xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' x='0px' y='0px' viewBox='0 0 512.001 512.001' style='fill:#d78f54; margin-left: 10px' xml:space='preserve'><g><g>	<path d='M481.086,188.037c-3.454-2.062-7.737-2.159-11.278-0.253l-73.901,39.777v-34.087c0-6.312-5.118-11.429-11.428-11.429 h-18.586c23.179-18.799,38.024-47.493,38.024-79.594C403.918,45.96,357.958,0,301.465,0c-48.218,0-88.757,33.487-99.598,78.424   c-14.182-17.112-35.587-28.032-59.497-28.032c-42.6,0-77.256,34.657-77.256,77.256c0,21.199,8.586,40.426,22.459,54.4H77.138 c-6.312,0-11.429,5.117-11.429,11.429v51.879H36.776c-6.312,0-11.429,5.117-11.429,11.429v44.944 c0,6.312,5.117,11.429,11.429,11.429h28.932v51.879c0,6.312,5.117,11.429,11.429,11.429h134.825l-61.946,118.825 c-2.918,5.596-0.746,12.499,4.851,15.417c1.688,0.88,3.494,1.297,5.273,1.297c4.123,0,8.105-2.239,10.143-6.147l60.523-116.098 l60.524,116.098c2.038,3.91,6.021,6.147,10.144,6.147c1.779,0,3.586-0.417,5.273-1.297c5.597-2.918,7.769-9.821,4.85-15.417 l-61.946-118.825h134.827c6.311,0,11.429-5.117,11.429-11.429v-34.088l73.901,39.777c1.694,0.911,3.555,1.365,5.416,1.365 c2.03,0,4.059-0.541,5.862-1.617c3.454-2.063,5.567-5.789,5.567-9.811V197.848C486.653,193.825,484.54,190.1,481.086,188.037z			 M65.709,290.297H48.205V268.21h17.504V290.297z M301.465,22.857c43.888,0,79.595,35.706,79.595,79.595 c0,43.889-35.706,79.594-79.595,79.594c-43.888,0-79.594-35.706-79.594-79.594C221.872,58.564,257.578,22.857,301.465,22.857z M214.192,156.054c6.104,9.904,13.847,18.693,22.847,25.992h-39.872C204.476,174.684,210.3,165.855,214.192,156.054z M142.37,73.248c29.995,0,54.399,24.403,54.399,54.399c0,29.996-24.403,54.4-54.399,54.4c-29.995,0-54.399-24.403-54.399-54.4 C87.972,97.651,112.375,73.248,142.37,73.248z M373.05,246.691v65.123v41.79H231.013c-0.021,0-0.041,0-0.062,0h-0.302 c-0.013,0-0.026,0-0.039,0H88.566v-51.879v-44.944v-51.879H373.05V246.691z M463.796,341.529l-67.889-36.542v-51.468   l67.889-36.542V341.529z'/></g></g><g>	<g>	<path d='M142.37,92.931c-19.143,0-34.716,15.574-34.716,34.716c0,19.143,15.574,34.716,34.716,34.716 c19.143,0,34.716-15.574,34.716-34.716C177.087,108.505,161.513,92.931,142.37,92.931z M142.37,141.791 c-7.8,0-14.145-6.345-14.145-14.145c0-7.8,6.345-14.145,14.145-14.145c7.8,0,14.145,6.345,14.145,14.145 C156.515,135.446,150.169,141.791,142.37,141.791z'/></g></g><g>	<g>	<path d='M301.465,52.595c-27.491,0-49.856,22.366-49.856,49.857c0,27.49,22.365,49.856,49.856,49.856 c27.491,0,49.856-22.366,49.856-49.856C351.321,74.961,328.957,52.595,301.465,52.595z M301.465,129.451 c-14.887,0-26.999-12.112-26.999-26.999c0-14.887,12.112-27,26.999-27s26.999,12.112,26.999,27S316.352,129.451,301.465,129.451z'	/></g></g><g>	<g>	<path d='M264.593,238.137h-124.26c-5.997,0-10.857,4.861-10.857,10.857v60.519c0,5.997,4.861,10.857,10.857,10.857h124.26	c5.997,0,10.857-4.861,10.857-10.857v-60.519C275.45,242.999,270.589,238.137,264.593,238.137z M253.735,298.656H151.19v-38.804 h102.546V298.656z'/>	</g></g><g>	<g>	<circle cx='324.536' cy='260.422' r='11.429'/></g></g><g>	<g>	<circle cx='324.536' cy='298.079' r='11.429'/></g></g></svg><p style='color: #d78f54; font-family: HelveticaNeueLTStd-Th, Helvetica Neue LT Std; font-size: 20px; font-weight: lighter; margin-bottom: 0; margin-left: 10px;'>Installation Video</p>")
          $videoLi.append($video);
        }
    
        let $materialLi = '';
        if (hasMaterialExpert) {
          $materialLi = $("<li class='Materials'></li>");
          $materialLi.append("<svg id='expert' width='200' height='100%' data-name='expert' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 581.41 132.88'><defs><style>.expert-cls-1{font-size:56.25px;fill:#d78f54;font-family:HelveticaNeueLTStd-Th, Helvetica Neue LT Std; font-weight: lighter;}.materials-cls-2{fill:none;}.materials-cls-3{fill:#763e2a;}.materials-cls-4{fill:#7ea0c3;}.materials-cls-5{fill:#5b7f71;}.materials-cls-6{fill:#ebab21;}.materials-cls-7{fill:#825474;}</style></defs><text class='expert-cls-1' transform='translate(152.33 86.16)'>Material Expert</text><path class='materials-cls-2' d='M81.44-23.42A66.44,66.44,0,1,0,147.88,43,66.44,66.44,0,0,0,81.44-23.42' transform='translate(-15 23.42)'/><polygon class='materials-cls-3' points='66.42 77.46 57.18 61.44 47.94 77.46 66.42 77.46 66.42 77.46'/><polygon class='materials-cls-4' points='75.62 93.4 66.38 77.39 57.13 93.4 75.62 93.4 75.62 93.4'/><polygon class='materials-cls-5' points='84.94 109.45 75.69 93.44 66.45 109.45 84.94 109.45 84.94 109.45'/><polygon class='materials-cls-3' points='66.42 109.45 57.18 93.44 47.94 109.45 66.42 109.45 66.42 109.45'/><polygon class='materials-cls-6' points='84.94 77.42 75.69 61.41 66.45 77.42 84.94 77.42 84.94 77.42'/><polygon class='materials-cls-5' points='66.42 77.36 57.18 93.37 47.94 77.36 66.42 77.36 66.42 77.36'/><polygon class='materials-cls-6' points='75.62 93.36 66.38 109.37 57.13 93.36 75.62 93.36 75.62 93.36'/><polygon class='materials-cls-4' points='75.62 61.51 66.38 77.52 57.13 61.51 75.62 61.51 75.62 61.51'/><polygon class='materials-cls-4' points='57.18 61.51 47.94 77.52 38.69 61.51 57.18 61.51 57.18 61.51'/><polygon class='materials-cls-7' points='84.94 77.36 75.69 93.37 66.45 77.36 84.94 77.36 84.94 77.36'/><polygon class='materials-cls-7' points='94.18 61.62 84.94 77.64 75.69 61.62 94.18 61.62 94.18 61.62'/><polygon class='materials-cls-3' points='66.42 39.47 57.18 23.45 47.94 39.47 66.42 39.47 66.42 39.47'/><polygon class='materials-cls-4' points='75.62 55.41 66.38 39.4 57.13 55.41 75.62 55.41 75.62 55.41'/><polygon class='materials-cls-6' points='84.94 39.44 75.69 23.43 66.45 39.44 84.94 39.44 84.94 39.44'/><polygon class='materials-cls-5' points='66.42 39.37 57.18 55.38 47.94 39.37 66.42 39.37 66.42 39.37'/><polygon class='materials-cls-4' points='75.62 23.52 66.38 39.53 57.13 23.52 75.62 23.52 75.62 23.52'/><polygon class='materials-cls-7' points='84.94 39.37 75.69 55.38 66.45 39.37 84.94 39.37 84.94 39.37'/></svg>")
        }
    
        let $pressLi = '';
        if (hasPress) {
          $pressLi = $("<li class='Press'></li>")
          $pressLi.append("<svg id='press' style='margin-left: -30px' width='115' height='100%' data-name='press' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 282.05 132.88'><defs><style>.press-cls-1{font-size:50.25px;font-family:HelveticaNeueLTStd-Th, Helvetica Neue LT Std;font-weight: lighter;}.press-cls-1,.press-cls-8{fill:#d78f54;}.press-cls-2{fill:none;}.press-cls-3{fill:#5b7f71;}.press-cls-4{fill:#7ea0c3;}.press-cls-5{fill:#825474;}.press-cls-6{fill:#763e2a;}.press-cls-7{fill:#ebab21;}</style></defs><title>ASI-Press</title><text class='press-cls-1' transform='translate(120.21 86.37)'>Press</text><path class='press-cls-2' d='M19.06-20.27A66.44,66.44,0,1,0,85.5,46.16,66.44,66.44,0,0,0,19.06-20.27' transform='translate(47.38 20.27)'/><polygon class='press-cls-3' points='63.25 30.09 47.38 20.93 47.38 39.26 63.25 30.09 63.25 30.09'/><polygon class='press-cls-4' points='63.25 30.09 47.38 39.26 63.25 48.42 63.25 30.09 63.25 30.09'/><polygon class='press-cls-5' points='63.25 30.09 63.25 48.42 79.13 39.26 63.25 30.09 63.25 30.09'/><polygon class='press-cls-4' points='63.25 48.42 63.25 66.75 79.13 57.59 63.25 48.42 63.25 48.42'/><polygon class='press-cls-6' points='63.25 84.89 63.25 103.22 79.13 94.05 63.25 84.89 63.25 84.89'/><polygon class='press-cls-3' points='63.25 48.42 47.38 57.59 63.25 66.75 63.25 48.42 63.25 48.42'/><polygon class='press-cls-6' points='63.28 66.68 47.4 75.84 63.28 85.01 63.28 66.68 63.28 66.68'/><polygon class='press-cls-7' points='79.13 39.26 63.25 48.42 79.13 57.59 79.13 39.26 79.13 39.26'/><polygon class='press-cls-5' points='79.13 57.59 63.25 66.75 79.13 75.92 79.13 57.59 79.13 57.59'/><polygon class='press-cls-4' points='79.13 75.72 63.25 84.89 79.13 94.05 79.13 75.72 79.13 75.72'/><polygon class='press-cls-3' points='79.13 94.05 63.25 103.22 79.13 112.38 79.13 94.05 79.13 94.05'/><polygon class='press-cls-6' points='63.25 48.42 47.38 39.26 47.38 57.59 63.25 48.42 63.25 48.42'/><polygon class='press-cls-7' points='63.25 66.75 47.38 57.59 47.38 75.92 63.25 66.75 63.25 66.75'/><polygon class='press-cls-5' points='63.25 84.89 47.38 75.72 47.38 94.05 63.25 84.89 63.25 84.89'/><polygon class='press-cls-7' points='63.25 103.22 63.25 84.89 47.38 94.05 63.25 103.22 63.25 103.22'/><polygon class='press-cls-8' points='49.06 20.27 80.81 38.6 80.81 103.8 86.94 106.49 86.94 36.89 49.06 20.27 49.06 20.27'/><polygon class='press-cls-3' points='63.28 66.68 63.28 85.01 79.15 75.84 63.28 66.68 63.28 66.68'/></svg>")
        }
    
        $(".rightCol").append(
          "<div id='bottomTabs' class='tabsContainer'><ul style='padding-top: 15px; display: flex; list-style-type: none; width: 100%;  flex-wrap: wrap; justify-content: space-evenly;border-top: #ddd 1px solid;'></ul></div>"
        );
        $("#bottomTabs ul").append($catalogLi).append($videoLi).append($materialLi).append($pressLi)
    
        $(document).on("click", ".tabsContainer ul li", function (e) {
          if (e.currentTarget.className === "Pictures" || e.currentTarget.classList.contains("Pictures")) {
            e.preventDefault();
            showPictures();
          } else if (e.currentTarget.className === "Specs") {
            e.preventDefault();
            showSpecs();
          } else if (e.currentTarget.className === "Press") {
            e.preventDefault();
            showPress();
          } else if (e.currentTarget.className === "Materials") {
            e.preventDefault();
            showMaterials();
          } else if (e.currentTarget.className === "Featured" || e.currentTarget.classList.contains("Featured")) {
            e.preventDefault();
            showFeaturedProjects();
          }
        });
        $('body').on("click", ".moreProjectsLink", function (event) {
          event.preventDefault();
          $('.moreProjectsReveal').slideToggle(function () {
            $('.moreProjectsLink').text(
              $(this).is(':visible') ? "Other Projects ▲" : "Other Projects ▼");
          });
        });
        $(document).on("click", "#specs", showSpecifications);
        $(document).on("click", "#shop", showCart);
      });
      // ]]>
    
      function showSpecifications(e) {
        e.preventDefault();
        let url = $(e.currentTarget).data().url;
        let productPage =
          "<div id='loading' style='display: flex; justify-content: center'><p>Loading Specs...</p></div><iframe src=" +
          url +
          " id='productPage' style='display: none; position: relative; top: -675px; left: -665px;' width='1024' height='1400' scrolling='no'></iframe>"
        $("#swatchModal").html(productPage);
        $("#swatchModal").dialog("open");
        $("#productPage").load(function () {
          $("#loading").hide();
          $("#swatchModal").html(document.getElementById('productPage').contentWindow.$('.productSpecs'));
        })
        $("#swatchModal").parent().css("width", "400px")
      }
    
      function showCart(e) {
        e.preventDefault();
        let url = $(e.currentTarget).data().url;
        let productPage =
          "<div id='loading' style='display: flex; justify-content: center'><p>Loading Your Cart...</p></div><iframe src=" +
          url +
          " id='productPage' style='display: none; position: relative; top: -525px; left: -574px;' width='1024' height='1400' scrolling='no' ></iframe>"
        $("#swatchModal").html(productPage);
        $("#swatchModal").dialog("open");
        $("#productPage").load(function () {
          if (document.getElementById('productPage').contentWindow.$('.detailsPricing').length) {
            $("#loading").hide();
            $(this).show();
          } else {
            $("#loading").html("<p>This product is not in stock.</p>");
          }
          document.getElementById('productPage').contentWindow.$("#MainContent_MainContent_ctl00_buttonAddToCart").on(
            "click",
            function () {
              $("#swatchModal").dialog("close");
              setTimeout(function () {
                location.reload();
              }, 5000);
            })
        })
        $("#swatchModal").parent().css("max-height", "180px")
        $("#swatchModal").parent().css("width", "450px")
      }
    </script>
</asp:Content>
