<%@ Page Title="" Language="C#" MasterPageFile="~/SalesPortal/SalesPortalMaster.Master" AutoEventWireup="true" CodeBehind="SalesPortalLanding.aspx.cs" Inherits="ASI.Web.SalesPortal.SalesPortalLanding" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <nav runat="server" id="portalNav">
        <div class="sub">
            <ul>
                <li><a id="homeTabAnchor">
                    <EPiServer:Property ID="pptHomeHeaderTabText" runat="server" PropertyName="HomeHeaderTabText" />
                </a></li>
                <li><a id="digitalTabAnchor">
                    <EPiServer:Property ID="pptDigitalLibraryTabText" runat="server" PropertyName="DigitalLibraryTabText" />
                </a></li>
                <li><a id="portalTabAnchor">
                    <EPiServer:Property ID="pptSalesPortalTabText" runat="server" PropertyName="SampleCollateralFormTabText" />
                </a></li>
                <li><a id="quoteTabAnchor">
                    <EPiServer:Property ID="pptQuoteRequestTabText" runat="server" PropertyName="QuoteRequestTabText" />
                </a></li>
            </ul>
        </div>
    </nav>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- Home --%>
    <div class="sales-portal-home sales-portal-tab">
        <div class="topCallout">
            <EPiServer:Property ID="pptNews" runat="server" PropertyName="News" />
        </div>
    </div>

    <%-- Digital Library --%>
    <div class="sales-portal-digital-library sales-portal-tab">

        <div class="topCallout">
            <EPiServer:Property ID="pptDigitalLibraryNews" runat="server" PropertyName="DigitalLibraryNews" />
        </div>

        <div class="salesPortalForm">
            <%-- Resource Download Section --%>
            <div class="sales-portal-resource-download">
                <EPiServer:Property ID="Property2" runat="server" CustomTagName="h2" PropertyName="DownloadResourceHeader" />

                <asp:Repeater runat="server" ID="rptDownlaodResourceFiles" OnItemDataBound="rptDownlaodResourceFiles_ItemDataBound">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink runat="server" ID="hplFileName" Target="_blank"></asp:HyperLink>
                            <asp:Literal runat="server" ID="ltrFileDescription"></asp:Literal>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul> 
                    </FooterTemplate>
                </asp:Repeater>

            </div>
        </div>
    </div>

    <%-- Collateral Form --%>
    <div class="sales-portal-form sales-portal-tab">

        <div class="topCallout">
            <EPiServer:Property ID="pptFormNews" runat="server" PropertyName="FormNews" />
        </div>

        <asp:Panel runat="server" ID="formPanel" CssClass="salesPortalForm">

            <%-- General Information Section --%>
            <div class="sales-portal-general-information">
                <EPiServer:Property ID="Property1" runat="server" CustomTagName="h2" PropertyName="GeneralInformationHeader" />

                <div class="half">
                    <p>
                        <label>Date of Visit:</label>
                        <asp:TextBox runat="server" ID="tbxDateOfVisit" ClientIDMode="Static" Placeholder="MM/DD/YYYY"></asp:TextBox>
                    </p>
                    <p>
                        <label>Contact:</label>
                        <asp:TextBox runat="server" ID="tbxContact" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Account Name:</label>
                        <asp:TextBox runat="server" ID="tbxAccountName" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Account Executive:</label>
                        <asp:TextBox runat="server" ID="tbxAccountExecutive" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Project Name/Resource:</label>
                        <asp:TextBox runat="server" ID="tbxProjectName" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>E-mail:</label>
                        <asp:TextBox runat="server" ID="tbxEmail" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Phone:</label>
                        <asp:TextBox runat="server" ID="tbxPhone" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Project Type:</label>
                        <asp:DropDownList runat="server" ID="ddlProjectType" ClientIDMode="Static">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="Corporate">Corporate</asp:ListItem>
                            <asp:ListItem Value="Healthcare">Healthcare</asp:ListItem>
                            <asp:ListItem Value="Hospitality">Hospitality</asp:ListItem>
                            <asp:ListItem Value="Institutional">Institutional</asp:ListItem>
                            <asp:ListItem Value="Multi-Family/Residential">Multi-Family/Residential</asp:ListItem>
                            <asp:ListItem Value="Retail">Retail</asp:ListItem>
                            <asp:ListItem Value="Showroom/Tradeshow">Showroom/Tradeshow</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p>
                        <label>Location:</label>
                        <asp:TextBox runat="server" ID="tbxProjectLocation" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Shipping Account #:</label>
                        <asp:TextBox runat="server" ID="tbxShippingAccountNumber" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Type of Shipping:</label>
                        <asp:DropDownList runat="server" ID="ddlTypeOfShipping" ClientIDMode="Static">
                            <asp:ListItem Value="">--Select--</asp:ListItem>
                            <asp:ListItem Value="FedEx">FedEx</asp:ListItem>
                            <asp:ListItem Value="UPS">UPS</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                    <p id="shippingOptionPanel">
                        <label>Shipping Option:</label>
                        <select id="shippingOption">
                        </select>
                        <asp:HiddenField runat="server" ID="hidShippingOption" Value="" ClientIDMode="Static" />
                    </p>
                </div>

                <div class="half">

                    <p>
                        <label>Address:</label>
                        <asp:TextBox runat="server" ID="tbxAddress" CssClass="textArea" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </p>
                    <p>
                        <label>Notes:</label>
                        <asp:TextBox runat="server" ID="tbxExtraNotes" CssClass="textArea" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                    </p>

                </div>
            </div>

            <%-- Collateral Assets Section --%>
            <div class="sales-portal-collateral-assets">
                <EPiServer:Property ID="Property3" runat="server" CustomTagName="h2" PropertyName="CollateralAssetsListHeader" />

                <asp:Repeater runat="server" ID="rptCollateralSampleBrandList" OnItemDataBound="rptCollateralSampleBrandList_ItemDataBound">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="accordion">
                            <p runat="server" id="brandHeader" style="clear: both; overflow: hidden">
                                <span class="sample-collection-brand-header-first">
                                    <a href='#<%# Container.ItemIndex + 1%>'>
                                        <asp:Literal runat="server" ID="ltrBrandName"></asp:Literal>
                                    </a>
                                </span>

                            </p>
                            <div>
                                <div class="sample-collection-brand-sub-header">
                                    <p>
                                        <EPiServer:Property ID="pptPresentedText" runat="server" PropertyName="PresentedText" />
                                    </p>
                                    <p>
                                        <EPiServer:Property ID="pptDroppedOffText" runat="server" PropertyName="DroppedOffText" />
                                    </p>
                                    <p>
                                        <EPiServer:Property ID="pptUpdatedText" runat="server" PropertyName="UpdatedText" />
                                    </p>
                                    <p>
                                        <EPiServer:Property ID="pptRequestText" runat="server" PropertyName="RequestText" />
                                    </p>
                                </div>

                                <asp:Repeater runat="server" ID="rptCollateralSampleTypeList" OnItemDataBound="rptCollateralSampleTypeList_ItemDataBound">
                                    <ItemTemplate>
                                        <div style="clear: both; overflow: hidden">
                                            <div class="sales-portal-brand-type-left">
                                                <asp:PlaceHolder runat="server" ID="plhBrandTypePanel">
                                                    <p>
                                                        <asp:Literal runat="server" ID="ltrTypeName"></asp:Literal>
                                                    </p>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="plhIndividualTypePanel" Visible="false">
                                                    <p class="sample-collection-individual-list-image">
                                                        <img src="/imgs/catalog.jpg" />
                                                    </p>
                                                </asp:PlaceHolder>
                                            </div>
                                            <div class="sales-portal-brand-type-right">

                                                <asp:Repeater runat="server" ID="rptCollateralSampleTypeSubBrand" OnItemDataBound="rptCollateralSampleTypeSubBrand_ItemDataBound">

                                                    <ItemTemplate>

                                                        <asp:PlaceHolder runat="server" ID="plhSubbrandText">
                                                            <li style="clear: both; overflow: hidden">
                                                                <p class="sales-portal-brand-type-subbrand-text">
                                                                    <asp:Literal runat="server" ID="litSubBrandName"></asp:Literal>
                                                                </p>
                                                            </li>
                                                        </asp:PlaceHolder>

                                                        <asp:Repeater runat="server" ID="rptCollateralSampleItem" OnItemDataBound="rptCollateralSampleItem_ItemDataBound">
                                                            <ItemTemplate>



                                                                <li style="clear: both; overflow: hidden">

                                                                    <asp:PlaceHolder runat="server" ID="plhBrandCollectionItemPanel">
                                                                        <p class="sample-collection-name">
                                                                            <span>
                                                                                <asp:Literal runat="server" ID="ltrSampleCollectionName"></asp:Literal></span>
                                                                        </p>
                                                                        <p class="sample-collection-sku">
                                                                            <span>
                                                                                <asp:Literal runat="server" ID="ltrSampleSKU"></asp:Literal></span>
                                                                        </p>
                                                                        <p class="sample-collection-image">
                                                                            <span>
                                                                                <asp:Image runat="server" ID="imgSampleImage" /></span>
                                                                        </p>
                                                                    </asp:PlaceHolder>

                                                                    <asp:PlaceHolder runat="server" ID="plhIndividualItemPanel" Visible="false">
                                                                        <p class="sample-collection-individual-item-name">
                                                                            <span>
                                                                                <asp:Literal runat="server" ID="ltrSampleIndividualSKU"></asp:Literal></span>
                                                                        </p>
                                                                    </asp:PlaceHolder>

                                                                    <p class="sample-collection-checkbox">
                                                                        <asp:CheckBox ID="cbxPresented" runat="server" />
                                                                        <asp:CheckBox ID="cbxDroppedOff" runat="server" />
                                                                        <asp:CheckBox ID="cbxUpdated" runat="server" />
                                                                        <asp:CheckBox ID="cbxRequest" runat="server" />
                                                                        <asp:HiddenField runat="server" ID="hidSampleSKU" />
                                                                    </p>
                                                                </li>



                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                    </ItemTemplate>

                                                </asp:Repeater>


                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>

            </div>

            <%-- Note Section --%>
            <div class="sales-portal-note">
            </div>

            <%-- Submit Section --%>
            <div class="sales-portal-submit">

                <p class="errormessage">Please fill all required fields.</p>

                <asp:Button runat="server" ID="btnSubmit" CssClass="btn" Text="Submit" OnClientClick="return GeneralInformationValidation();" OnClick="btnSubmit_Click" />

            </div>

        </asp:Panel>
    </div>

    <%-- Quote Request --%>
    <div class="sales-portal-quote sales-portal-tab">
        <div class="topCallout">
            <EPiServer:Property ID="Property4" runat="server" PropertyName="QuoteNews" />
        </div>

        <div class="sales-portal-general-information">

            <div class="half">

                <p>
                    <label>Account Name:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteAccountName" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>Contact:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteContact" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>E-mail:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteEmail" ClientIDMode="Static"></asp:TextBox>
                </p>
                <p>
                    <label>Phone:</label>
                    <asp:TextBox runat="server" ID="tbxQuotePhone" ClientIDMode="Static"></asp:TextBox>
                </p>
                <p>
                    <label>Account Executive:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteAccountExecutive" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>Billing Address:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteBillingAddress" CssClass="quote-request-textArea" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                </p>


            </div>

            <div class="half">

                <p>
                    <label>Project Name:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteProjectName" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>Material Specifier:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteMaterialSpecifier" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>Project Type:</label>
                    <asp:DropDownList runat="server" ID="ddlQuoteProjectType" ClientIDMode="Static">
                        <asp:ListItem Value="">--Select--</asp:ListItem>
                        <asp:ListItem Value="Corporate">Corporate</asp:ListItem>
                        <asp:ListItem Value="Healthcare">Healthcare</asp:ListItem>
                        <asp:ListItem Value="Hospitality">Hospitality</asp:ListItem>
                        <asp:ListItem Value="Institutional">Institutional</asp:ListItem>
                        <asp:ListItem Value="Multi-Family/Residential">Multi-Family/Residential</asp:ListItem>
                        <asp:ListItem Value="Retail">Retail</asp:ListItem>
                        <asp:ListItem Value="Showroom/Tradeshow">Showroom/Tradeshow</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <label>Location:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteLocation" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>Product SKU:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteProductSKU" ClientIDMode="Static"></asp:TextBox>
                </p>

                <p>
                    <label>Sq. Footage Required/No. of Pieces:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteNoOfPieces" ClientIDMode="Static" CssClass="sales-portal-general-information-small-input"></asp:TextBox>
                </p>

                <p>
                    <label>Shipping Address:</label>
                    <asp:TextBox runat="server" ID="tbxQuoteShippingAddress" CssClass="quote-request-textArea" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                </p>

            </div>

        </div>


        <%-- Note Section --%>
        <div class="sales-portal-note">
            <p>
                <label>Notes:</label>
                <asp:TextBox runat="server" ID="tbxQuoteFormNotes" CssClass="notesArea" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
            </p>
        </div>

        <%-- Submit Section --%>
        <div class="sales-portal-submit">

            <p class="errormessage">Please fill all required fields.</p>

            <asp:Button runat="server" ID="Button1" CssClass="btn" Text="Submit" OnClientClick="return QuoteFormGeneralInformationValidation();" OnClick="btnQuote_Submit_Click" />

        </div>

    </div>

</asp:Content>
