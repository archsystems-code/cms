<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="ProjectDetails.aspx.cs" Inherits="ASI.Web.Views.Pages.ProjectDetails" %>

<%@ Register Src="~/Views/Controls/Breadcrumbs.ascx" TagName="Breadcrumbs" TagPrefix="uc" %>
<%@ Register Src="~/Views/Controls/ProjectLeftNav.ascx" TagPrefix="uc1" TagName="ProjectLeftNav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftNav" runat="server">
    <section class="leftCol calloutBucket">
        <uc1:ProjectLeftNav runat="server" id="ProjectLeftNav" />
    </section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainFixed segments">
        <uc:Breadcrumbs runat="server" ID="ucBreadcrumbs" />
        <div class="projectDetail">

            <EPiServer:Property ID="Property2" PropertyName="Name" runat="server" CustomTagName="h2" />
            <EPiServer:Property ID="Property4" PropertyName="Location" runat="server" CustomTagName="p" />
            <h3>
                <EPiServer:Property ID="Property3" PropertyName="FullAandDFirmName" runat="server" />
            </h3>

            <asp:HiddenField runat="server" ID="hidShowVideoFirst" ClientIDMode="Static" />

            <div class="projectDetailImage">
                <div class="pinIt">
                    <asp:HyperLink ID="PinIt" ClientIDMode="Static" CssClass="pin-it-button pin-it-image" runat="server" count-layout="horizontal">
					        <img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" />
                    </asp:HyperLink>
                </div>

                <asp:Image runat="server" ID="imgProjectDetails" ClientIDMode="Static" CssClass="projectPhoto" />

                <asp:Panel runat="server" ID="pnlPhotoCredit" CssClass="photoCredit">
                    <p style="margin: 0 0 10px;">
                        <span>
                            <asp:Literal runat="server" ID="litPhotoCredit" /></span>
                    </p>
                </asp:Panel>

                <div id="ImageFeaturingProductsText" class="projectFeaturingProductsText">
                    <asp:Literal runat="server" ID="litImageFeaturingProductsText" ClientIDMode="Static"></asp:Literal>
                </div>

            </div>

            <div class="projectDetailVideo">
                <p class="projectVideo"></p>
            </div>

            <asp:Panel runat="server" ID="pnlImages" CssClass="projectImageGallery">
                <asp:Repeater runat="server" ID="rptImageAndVideoList" OnItemDataBound="rptImageAndVideoList_ItemDataBound">
                    <ItemTemplate>
                        <div style="position: relative; left: 0; top: 0; float: left; margin-right: 10px;">
                            <img style="position: relative; top: 0; left: 0;" class="selectPhoto" src="<%# Eval("ImageUrl") %>" width="70px" data-url='<%# Eval("ImageUrl") %>' data-is-image='<%# Eval("IsImage") %>' data-video-url='<%# Eval("VideoUrl") %>' data-photocredit='<%# Eval("PhotoCredit") %>' data-brand='<%# Eval("Brand") %>' data-brand-url='<%# Eval("BrandUrl") %>' data-featuring-text='<%# Eval("Featuringtext") %>' />                            
                            <img src="/imgs/Play.png" style="position: absolute; top: 13px; left: 22px;display:none" class="VideoIconThumbnail" />                            
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </asp:Panel>


            <asp:Panel runat="server" ID="pnlText" CssClass="text">

                <asp:Panel runat="server" ID="pnlFeaturedProductWrap" CssClass="featuredProducts">
                    <asp:Repeater ID="rptProductList" runat="server">
                        <HeaderTemplate>
                            <p>
                            Featuring:
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span class="items">
                                <asp:HyperLink ID="hlCollectionLink" runat="server" CssClass="productListLink"></asp:HyperLink>
                                <asp:Repeater runat="server" ID="rptProductLink">
                                    <HeaderTemplate>&nbsp;-</HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink runat="server" ID="hplProductLink" CssClass="productLink"></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </span>
                        </ItemTemplate>
                        <FooterTemplate></p></FooterTemplate>
                    </asp:Repeater>
                </asp:Panel>

                <asp:PlaceHolder runat="server" ID="plhVideoFeaturing">
                    <div style="overflow: hidden">
                        <asp:Literal runat="server" ID="litVideoFeaturingText"></asp:Literal>
                    </div>
                </asp:PlaceHolder>


                <EPiServer:Property ID="Property1" PropertyName="Testimonial" runat="server" />
                <EPiServer:Property ID="Property5" PropertyName="DesignerName" runat="server" CustomTagName="p" />
            </asp:Panel>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/js/project/projectDetails.js"></script>
</asp:Content>
