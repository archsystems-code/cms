<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductTemplate.ascx.cs" Inherits="ASI.Web.Commerce.DisplayTemplates.ProductTemplate" %>

<%@ Register TagPrefix="EPiCommerce" Namespace="ASI.Web.Views.Controls" Assembly="ASI.Web" %>
<%@ Register Src="~/Views/Controls/SampleRequests.ascx" TagName="SampleRequests" TagPrefix="uc" %>
<%@ Register Src="~/Views/Controls/CommerceCart.ascx" TagName="CommerceCart" TagPrefix="uc" %>
<%@ Register Src="~/Views/Controls/FeaturedItemAddOn.ascx" TagPrefix="uc" TagName="FeaturedItemAddOn" %>
<%@ Register Src="~/Views/Controls/SampleRequestModal.ascx" TagName="SampleRequestModal" TagPrefix="uc" %>
<%@ Register Src="~/Views/Controls/SampleOutOfStockModal.ascx" TagName="SampleOutOfStockModal" TagPrefix="uc" %>

<div class="productInfoWrapper">

    <asp:PlaceHolder runat="server" ID="ProductInfoHolder"></asp:PlaceHolder>
    <asp:HiddenField runat="server" ID="hidProductCollectionName" ClientIDMode="Static" />
    <%--<h1><%# ParentCatalogNode.Name %></h1>--%>
    <h1>
        <asp:Label ID="pageHeader" runat="server" Text=""></asp:Label></h1>
    <div class="productWrapper">
        <uc:SampleOutOfStockModal runat="server" ID="sampleOutOfStockModal" />
        <uc:SampleRequestModal runat="server" ID="sampleRequestModal" />
        <div class="productImage">
            <asp:HyperLink runat="server" ID="hlInstallGuide" Target="_blank" CssClass="installDetails" Visible="false">View Installation Details</asp:HyperLink>

            <a runat="server" id="hlHighResLink" href="#" class="showLargeImage">
                <EPiCommerce:AssetImage runat="server" ID="aiThumb" Entry='<%# Entry %>' AssetGroup="ThumbnailGroup" />
            </a>

            <EPiCommerce:AssetImage runat="server" ID="propThumbnailNoHighRes" Entry='<%# Entry %>' AssetGroup="ThumbnailGroup" Visible="false" />


            <asp:HyperLink runat="server" ID="hlCollection" CssClass="back">&laquo; Back to Collection</asp:HyperLink>
            <asp:HyperLink runat="server" ID="hlNextItem" CssClass="next">Next Item in Collection &raquo;</asp:HyperLink>


            <div class="socialMedia">
                <asp:HyperLink ID="PinIt" CssClass="pin-it-button" runat="server" count-layout="horizontal">
					<img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" />
                </asp:HyperLink>
                <%--            
				<asp:HyperLink ID="HyperLink1" runat="server" Style="margin-top: 0px; margin-right: 5px"
					NavigateUrl="" ToolTip="Email to a friend">
					<img src="http://png-3.findicons.com/files/icons/1042/mazes_mini/19/mail.png" alt="Email to a friend" id="image_52704">
				</asp:HyperLink>--%>
            </div>
        </div>

        <div class="productInfo">
            <p class="nameSku">
                <span class="displayName"><%# Entry.ItemAttributes["DisplayName"] %></span>
                <span class="sku"><%# Entry.ID %></span>
            </p>
            <div class="request">
                <asp:Panel runat="server" ID="pnlSamples" CssClass="sampleReq" Visible="false">
                    <h5 style="text-align: center">
                        Request Sample
                    </h5>
                </asp:Panel>

                <div class="viewSamples">
                    <div class="samples sampleCheckout">
                    </div>
                    <div style="display: flex; justify-content: center;">
                        <asp:LinkButton ID="lbIndividual" runat="server" CssClass="openModal">Individual</asp:LinkButton>
                        <asp:LinkButton ID="lbChain" runat="server" CssClass="openModal">Chain</asp:LinkButton>
                        <asp:LinkButton ID="lbBox" runat="server" CssClass="openModal">Box</asp:LinkButton>
                        <asp:LinkButton ID="lbProductBinder" runat="server" CssClass="openModal">Product Binder</asp:LinkButton>
                        <%--  <asp:Label ID="LabelSeparator4" runat="server"> | </asp:Label>
                        <asp:LinkButton ID="lbProductBrochure" runat="server" CssClass="openModal">Product Brochure</asp:LinkButton>--%>
                        <asp:Label ID="LabelContactSales" runat="server">Contact <a href="mailto:sales@archsystems.com">sales</a> for more information</asp:Label>
                    </div>
                    <a id="MainContent_MainContent_ctl00_lbViewRequested" Style="background-image: none; color: black; border: none; margin: 0 auto;"class="openModal" href="javascript:__doPostBack('ctl00$ctl00$MainContent$MainContent$ctl00$lbViewRequested','')">View My Requested Cart</a>
                </div>
            </div>
            <asp:Panel runat="server" ID="pnlFeatured" CssClass="auxProduct">
                <asp:Button ID="ButtonDummy2" runat="server" Text="Button" Style="display: none" />
                <ajax:ModalPopupExtender ID="FeaturedItemModal" TargetControlID="ButtonDummy2" PopupControlID="FeaturedItemPanel"
                    runat="server" OkControlID="Button2" BehaviorID="AuxModal">
                </ajax:ModalPopupExtender>

                <asp:Panel ID="FeaturedItemPanel" runat="server" CssClass="modalRecommend">
                    <div class="modal modalWrap sampleCheckout">
                        <uc:FeaturedItemAddOn runat="server" id="FeaturedItem" />
                        <a href="#" class="close">x</a>
                    </div>
                    <div class="modalOverlay"></div>
                </asp:Panel>
            </asp:Panel>
            <div class="viewSamples">
                <div class="samples sampleCheckout">
                </div>
            </div>
            <div class="productPrices">
                <asp:Panel runat="server" ID="pnlPurchase">
                    <h6>Purchase at Shop ASI</h6>
                    <div class="detailsPricing">
                        <div class="pricePerSf">
                            <h6>Price/SF:</h6>
                            <%= Entry.ItemAttributes["TierPriceInfo"] %>
                            <p><%= Entry.ItemAttributes["SqFtPerContainer"]%> square feet per box</p>
                        </div>
                        <asp:Panel ID="AddToCartPanel" runat="server" CssClass="addToCart">
                            <h6>Enter Desired Quantity:</h6>
                            <asp:TextBox ID="tbQuantity" runat="server" />
                            <strong>SF</strong>
                            <asp:Button ID="buttonAddToCart" runat="server" CssClass="submit" Text="+ Add to Cart" />
                            <asp:Label ID="lblNumberOfBoxes" CssClass="noBoxes" runat="server" />
                        </asp:Panel>
                    </div>
                </asp:Panel>
                <div class="variations">
                    <asp:Repeater runat="server" ID="rptProductVariations" Visible="false">
                        <HeaderTemplate>
                            <p>Additional colors and styles</p>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li runat="server" id="repeaterListItem">
                                <asp:HyperLink runat="server" ID="hlThumb">
                                    <EPiCommerce:AssetImage runat="server" ID="AssetImage1" Entry='<%# (Container.DataItem) %>' AssetGroup="ThumbnailGroup" CssClass="variationAssetImage" />
                                </asp:HyperLink>
                            </li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="addlInfo">
                    <%= Entry.ItemAttributes["AdditionalInfo"] %>
                </div>
            </div>
        </div>
    </div>
    <div class="productPageContent calloutBucket" runat="server" id="RightSideDiv">
        <asp:Panel runat="server" ID="pnlFeaturedProject" CssClass="featuredProject">
            <EPiServer:Property ID="Property1" runat="server" PropertyName="FeaturedProject" PageLink='<%# CollectionEpiPageLink %>' />
        </asp:Panel>
        <div class="productSpecs">
            <h2>Specifications</h2>
            <div class="list">
                <EPiServer:Property ID="Property2" runat="server" PropertyName="Specifications" PageLink='<%# CollectionEpiPageLink %>' />
            </div>


            <div class="print">
                <asp:HyperLink runat="server" ID="hlPrintFriendly">
                        Print Friendly
                </asp:HyperLink>
            </div>
        </div>
    </div>

    <div class="largeThumbModal">
        <EPiCommerce:AssetImage runat="server" ID="aiHighRes" Entry='<%# Entry %>' AssetGroup="highResGroup" Visible="false" />
        <EPiCommerce:AssetImage runat="server" ID="aiHiRes" Entry='<%# Entry %>' AssetGroup="hiResGroup" Visible="false" />
    </div>
</div>
