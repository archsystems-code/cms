<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SampleRequests.ascx.cs" Inherits="ASI.Web.Views.Controls.SampleRequests" %>

<h2>Your Requested Samples</h2>
<asp:Panel ID="PanelYourSamples" CssClass="mySamples" runat="server" Visible="false">
    <ul class="cart">
        <asp:Repeater runat="server" ID="RepeaterYourSamples" EnableViewState="false">
            <ItemTemplate>
                <li runat="server" visible='<%# Eval("Binder") == null %>'>
                    <asp:Label ID="Name" runat="server" CssClass="collectionName" /></li>
                <asp:HiddenField ID="hdnID" runat="server" Value='<%# Eval("CollectionEPiPageID") %>' />
                <asp:Repeater runat="server" ID="RepeaterSKUS" EnableViewState="false" OnItemDataBound="RepeaterSKUS_ItemDataBound">
                    <ItemTemplate>
                        <li>
                            <asp:Image ID="ImageCollection" runat="server" />
                            <asp:DropDownList ID="Qty" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                Visible='<%# !IsStudent %>' onchange="if (this.value == '11') {alert('An ASI representative will contact you'); }">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem Value="11">10+</asp:ListItem>
                            </asp:DropDownList>
                            <span>Individual:</span>
                            <asp:Label ID="Image1" runat="server" Text='<%# Eval("SKUString") %>' />
                            <asp:LinkButton ID="LinkButtonRemove1" runat="server" CssClass="remove" Text="Remove" CommandName="RemoveSKU"
                                CausesValidation="false" CommandArgument='<%# Eval("SKUString") %>' />
                            <asp:HiddenField ID="hdnSKU" runat="server" Value='<%# Eval("SKUString") %>' />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater runat="server" ID="RepeaterSingles">
                    <ItemTemplate>
                        <li>
                            <div class="container" style="position: relative">
                                <img class="popupsample"
                                    alt="Request chain" src='<%# GetSampleSingleImage(DataBinder.Eval(Container.NamingContainer.NamingContainer, "DataItem.CollectionEPiPageID").ToString(),Container.DataItem.ToString()) %>'>
                                <div class="magnifyingglass">
                                    <img alt="zoom in" src="/imgs/find.png"
                                        class="popupsampleglass">
                                </div>
                            </div>
                            <asp:Label ID="Image1" runat="server" Text='<%# GetSingleString(DataBinder.Eval(Container.NamingContainer.NamingContainer, "DataItem.CollectionEPiPageID").ToString(),Container.DataItem.ToString()) %>' />
                            <asp:LinkButton ID="LinkButtonRemove2" runat="server" CssClass="remove" Text="Remove" CommandName="RemoveChain"
                                CausesValidation="false" CommandArgument='<%# Container.DataItem %>' />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Repeater runat="server" ID="RepeaterChains">
                    <ItemTemplate>
                        <li>
                            <div class="container" style="position: relative">
                                <img class="popupsample"
                                    alt="Request chain" src='<%# GetSampleChainImage(DataBinder.Eval(Container.NamingContainer.NamingContainer, "DataItem.CollectionEPiPageID").ToString(),Container.DataItem.ToString()) %>'>
                                <div class="magnifyingglass">
                                    <img alt="zoom in" src="/imgs/find.png"
                                        class="popupsampleglass">
                                </div>
                            </div>
                            <asp:Label ID="Image1" runat="server" Text='<%# GetChainString(DataBinder.Eval(Container.NamingContainer.NamingContainer, "DataItem.CollectionEPiPageID").ToString(),Container.DataItem.ToString()) %>' />
                            <asp:LinkButton ID="LinkButtonRemove2" runat="server" CssClass="remove" Text="Remove" CommandName="RemoveChain"
                                CausesValidation="false" CommandArgument='<%# Container.DataItem %>' />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:PlaceHolder ID="PlaceHolder2" runat="server" Visible='<%# Eval("Box") != null %>'>
                    <li>
                        <div class="container" style="position: relative">
                            <img class="popupsample"
                                alt="Request box" src='<%# GetSampleImage(Eval("CollectionEPiPageID").ToString(), "Box") %>'>
                            <div class="magnifyingglass">
                                <img alt="zoom in" src="/imgs/find.png"
                                    class="popupsampleglass">
                            </div>
                        </div>
                        <asp:Label ID="Box" CssClass="special" runat="server">Sample Box</asp:Label>
                        <asp:LinkButton ID="LinkButtonRemove3" runat="server" CssClass="remove" CommandName="RemoveBox" CommandArgument='<%# Eval("CollectionEPiPageID")%>'
                            CausesValidation="false" Text="Remove" />
                    </li>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="PlaceHolder3" runat="server" Visible='<%# Eval("ProductBinder") != null %>'>
                    <li>
                        <div class="container" style="position: relative">
                            <img class="popupsample"
                                alt="Request binder" src='<%# GetSampleImage(Eval("CollectionEPiPageID").ToString(), "Binder") %>'>
                            <div class="magnifyingglass">
                                <img alt="zoom in" src="/imgs/find.png"
                                    class="popupsampleglass">
                            </div>
                        </div>
                        <asp:Label ID="Label1" CssClass="special" runat="server">Product Binder</asp:Label>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="remove" CommandName="RemoveProductBinder"
                            CommandArgument='<%# Eval("CollectionEPiPageID")%>' CausesValidation="false" Text="Remove" />
                    </li>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="PlaceHolder4" runat="server" Visible='<%# Eval("ProductBrochure") != null %>'>
                    <li>
                        <div class="container" style="position: relative">
                            <img class="popupsample"
                                alt="Request box" src='<%# GetSampleImage(Eval("CollectionEPiPageID").ToString(), "ProductBrochure") %>'>
                            <div class="magnifyingglass">
                                <img alt="zoom in" src="/imgs/find.png"
                                    class="popupsampleglass">
                            </div>
                        </div>
                        <asp:Label ID="Label3" CssClass="special" runat="server">Sample Brochure</asp:Label>
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="remove" CommandName="RemoveProductBrochure" CommandArgument='<%# Eval("CollectionEPiPageID")%>'
                            CausesValidation="false" Text="Remove" />
                    </li>
                </asp:PlaceHolder>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible='<%# Eval("Binder") != null %>'>
                    <li>
                        <div class="container" style="position: relative">
                            <asp:Image ID="BinderImage" CssClass="popupsample" runat="server" ImageUrl='<%# Eval("BinderImageUrl") %>' />
                            <div class="magnifyingglass">
                                <img alt="zoom in" src="/imgs/find.png"
                                    class="popupsampleglass">
                            </div>
                        </div>
                        <asp:Label ID="Label2" CssClass="special" runat="server"><%# Eval("Binder")%></asp:Label>
                        <asp:LinkButton ID="LinkButtonRemove4" runat="server" CssClass="remove" CommandName="RemoveBinder"
                            CommandArgument='<%# Eval("Binder")%>' CausesValidation="false" Text="Remove" />
                    </li>
                </asp:PlaceHolder>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    <asp:HyperLink runat="server" ID="ContinueShoppingFromCheckout" Text="Continue Shopping"
        NavigateUrl="~/en-US/Request-Samples/" Visible="False" CssClass="btn"></asp:HyperLink>
    <asp:LinkButton ID="Button2" runat="server" Text="Continue Shopping" CssClass="continueShop btn"
        OnClientClick="$('.modalRecommend, .modalSamples, #Modal_backgroundElement').hide(); return false;" />
    <asp:HyperLink ID="hlCheckout" runat="server"
        CssClass="btn">Check Out Samples</asp:HyperLink>
</asp:Panel>
<asp:Panel ID="PanelNoItems" runat="server" CssClass="noneMessage">
    <p>You have not requested any samples</p>
    <asp:LinkButton ID="LinkButton3" runat="server" Text="Continue Shopping" CssClass="submit noThanks btn"
        OnClientClick="$('.modalRecommend, .modalSamples').hide(); $find('Modal').hide(); return false;" />
</asp:Panel>
<script type="text/javascript">
    $(document).ready(function () {
        $('img.popupsample').tooltip({
            delay: 0,
            showURL: false,
            track: true,
            bodyHandler: function () {
                return $("<img/>").attr("src", this.src);
            }
        });
        $('img.popupsampleglass').tooltip({
            delay: 0,
            showURL: false,
            track: true,
            bodyHandler: function () {
                return $("<img/>").attr("src", $(this).parent().parent().children(":first").attr('src'));
            }
        });
    });
</script>
