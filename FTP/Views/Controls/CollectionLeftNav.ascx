<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CollectionLeftNav.ascx.cs" Inherits="ASI.Web.Views.Controls.CollectionLeftNav" %>
<nav class="productNav" id="navMenuContainer" runat="server">
    <h3>ASI
        <asp:Literal runat="server" ID="litBrandName"></asp:Literal>
        Collections</h3>
    <asp:Repeater runat="server" ID="rptCollections">
        <HeaderTemplate>
            <ul class="collectionNavigation">
        </HeaderTemplate>
        <ItemTemplate>
            <li runat="server" id="subcollectionNavigationList">
                <a href='<%# Eval("StaticLinkURL") %>'>
                    <asp:Image ImageUrl="" ID="thumbnailImage" runat="server" />
                    <EPiServer:Property ID="Property1" runat="server" PropertyName="PageName" />
                </a>
                <div class="icons">
                    <asp:Image ID="imgIconEnviro" CssClass="sustainable" runat="server" Visible="false" ImageUrl="/imgs/icon_environ.gif" />
                    <asp:Image ID="imgAvailable" CssClass="forPurchase" runat="server" Visible="false" ImageUrl="/imgs/Cart_icon.png" />
                </div>

                <asp:Repeater runat="server" ID="rptCollectionSubCollection">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li runat="server" id="subcollectionNavigationListItem">
                            <a href="<%# Eval("LinkURL") %>">
                                <%# Eval("Name") %>
                            </a>
                            <div class="icons">
                                <asp:Image ID="imgIconEnviro" CssClass="sustainable" runat="server" Visible="false" ImageUrl="/imgs/icon_environ.gif" />
                                <asp:Image ID="imgAvailable" CssClass="forPurchase" runat="server" Visible="true" ImageUrl="/imgs/Cart_icon.png" />
                            </div>
                            <asp:Repeater runat="server" ID="rptCollectionThirdLevelCollection">
                                <HeaderTemplate>
                                    <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li runat="server" id="thirdCollectionNavigationListItem">
                                        <a href="<%# Eval("LinkURL") %>">
                                            <%# Eval("Name") %>
                                        </a>
                                        <div class="icons small">
                                            <asp:Image ID="imgIconEnviro" CssClass="sustainable" runat="server" Visible="false" ImageUrl="/imgs/icon_environ.gif" />
                                            <asp:Image ID="imgAvailable" CssClass="forPurchase" runat="server" Visible="false" ImageUrl="/imgs/Cart_icon.png" />
                                        </div>
                                        <asp:Repeater runat="server" ID="rptCollectionFourthLevelCollection">
                                            <HeaderTemplate>
                                                <ul>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li runat="server" id="fourthCollectionNavigationListItem">
                                                    <a href="<%# Eval("LinkURL") %>">
                                                        <%# Eval("Name") %>
                                                    </a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</nav>


<section class="leftCol calloutBucket">
    <asp:Panel runat="server" ID="pnlInspirationalProjectMenu" CssClass="askExpert" Visible="false">
        <h2>Visual Display / Merchandising Elements</h2>
        <asp:Repeater runat="server" ID="rptInspirationalProjectList">
            <HeaderTemplate>
                <ul class="collectionNavigation">
            </HeaderTemplate>
            <ItemTemplate>
                <li runat="server" id="subcollectionNavigationList">
                    <a href='<%# Eval("StaticLinkURL") %>'>
                        <asp:Image ImageUrl="" ID="thumbnailImage" runat="server" />
                        <EPiServer:Property ID="Property1" runat="server" PropertyName="PageName" />
                    </a></li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </asp:Panel>
</section>

