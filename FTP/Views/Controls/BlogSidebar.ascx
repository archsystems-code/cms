<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogSidebar.ascx.cs" Inherits="ASI.Web.Views.Controls.BlogSidebar" %>
<div class="item">
    <AdageEpiLibrary:ImageProperty runat="server" PropertyName="PrimaryImage" PageLink='<%# BlogListPageLink %>' AltTextMetaName="Description" />
	</div>
	<div class="item">
        <EPiServer:Property runat="server" PropertyName="AboutMeHeader" PageLink='<%# BlogListPageLink %>' CustomTagName="h3" />
		<EPiServer:Property runat="server" PropertyName="AboutMeContent" PageLink='<%# BlogListPageLink %>' />
	</div>
	<div class="item">
		<EPiServer:Property runat="server" PropertyName="SubscribeHeader" PageLink='<%# BlogListPageLink %>' CustomTagName="h3" />
		<EPiServer:Property runat="server" PropertyName="SubscribeContent" PageLink='<%# BlogListPageLink %>' />
	</div>
	<div class="item archive">
		<EPiServer:Property runat="server" PropertyName="ArchiveHeader" PageLink='<%# BlogListPageLink %>' CustomTagName="h3" />

        <asp:Repeater runat="server" ID="rptArchives">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <a href="#"><asp:Literal runat="server" ID="litNameWithCounts" /></a>

                    <asp:Repeater runat="server" ID="rptMonths">
                        <HeaderTemplate>
                            <ul>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li>
                                <a href="#"><asp:Literal runat="server" ID="litNameWithCounts" /></a>
                                <asp:Repeater runat="server" ID="rptEntries">
                                    <HeaderTemplate>
                                        <ul>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <asp:Hyperlink runat="server" ID="hlBlogEntry">
                                                <EPiServer:Property runat="server" PropertyName="PageName" />
                                            </asp:Hyperlink>
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
	</div>
	<div class="item">
		<EPiServer:Property runat="server" PropertyName="FavoriteBlogsHeader" PageLink='<%# BlogListPageLink %>' CustomTagName="h3" />
		<EPiServer:Property runat="server" PropertyName="FavoriteBlogsContent" PageLink='<%# BlogListPageLink %>' />		
	</div>
	<div class="item">
	    <EPiServer:Property runat="server" PropertyName="FavoritePublicationsHeader" PageLink='<%# BlogListPageLink %>' CustomTagName="h3" />
		<EPiServer:Property runat="server" PropertyName="FavoritePublicationsContent" PageLink='<%# BlogListPageLink %>' />	
</div>