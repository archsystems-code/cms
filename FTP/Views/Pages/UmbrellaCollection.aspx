<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="UmbrellaCollection.aspx.cs" Inherits="ASI.Web.Views.Pages.UmbrellaCollection" %>

<%@ Register Src="~/Views/Controls/ProjectLeftNav.ascx" TagPrefix="uc1" TagName="ProjectLeftNav" %>
<%@ Register TagPrefix="menu" TagName="CollectionLeftNav" Src="~/Views/Controls/CollectionLeftNav.ascx" %>
<%@ Register Src="~/Views/Controls/SampleRequestModal.ascx" TagName="SampleRequestModal" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftNav" runat="server">
    <section class="leftCol calloutBucket">
        <!-- Just using the project left nav control for right now. Let me know if I can help. Love, Baiel + cicero -->
        <menu:CollectionLeftNav runat="server" ID="leftNavMenu" />
        <asp:Panel runat="server" ID="pnlAskExpert" CssClass="askExpert">
            <h2>Ask the Material Expert...</h2>
            <EPiServer:Property ID="askTheExpertPanel" runat="server" PropertyName="AskTheMaterialExpertContent" CssClass="askExpert" />
        </asp:Panel>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="productInfoWrapper">
        <h1>
            <EPiServer:Property PropertyName="CollectionName" runat="server" ID="epiCollectionName" />
            <asp:Image runat="server" ID="imgNewProduct" ImageUrl="/imgs/icon_new.gif" Visible="false" />
        </h1>
        <div class="collectionInfo">
            <EPiServer:Property ID="Property2" runat="server" PropertyName="CollectionDescription" />
            <asp:Panel ID="PanelSamples" runat="server" Visible="false">
                <div class="requestProductSample">

                    <asp:Repeater runat="server" ID="rptRequestSamplesList" OnItemDataBound="rptRequestSamplesList_ItemDataBound">
                        <ItemTemplate>
                            <p class="addsamplerequest">
                                <asp:LinkButton ID="btnRequestSample" runat="server" CssClass="openModal" OnClick="Sample_Click"></asp:LinkButton>
                                <asp:HiddenField runat="server" ID="hidRequestSampleResourceSKU" />
                            </p>
                        </ItemTemplate>
                    </asp:Repeater>

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

        <uc:SampleRequestModal runat="server" ID="sampleRequestModal" />
        <div id="specialChainTextContentTextDiv" class="chainTextModal" style="display: none">
            <div class="modalOverlay"></div>
            <div class="availSamples">
                <a href="#" class="close">x</a>
                <asp:Label ID="LabelSampleDetails" runat="server" />
            </div>
        </div>
        <EPiServer:Property ID="Property1" runat="server" PropertyName="MainBody" CssClass="umbrellaContent" />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
