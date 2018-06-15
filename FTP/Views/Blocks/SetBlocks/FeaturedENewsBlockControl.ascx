<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedENewsBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.SetBlocks.FeaturedENewsBlockControl" %>

<asp:Hyperlink runat="server" ID="hlImageWrap" Target="_blank">
    <AdageEpiLibrary:ImageProperty runat="server" PropertyName="Thumbnail" PageLink='<%# CurrentBlock.ENewsItem %>' AltTextMetaName="Description"  DisplayMissingMessage="false" />
</asp:Hyperlink>
<h2>
	<EPiServer:Property ID="Property2" runat="server" PropertyName="NewsType" PageLink='<%# CurrentBlock.ENewsItem %>' DisplayMissingMessage="false" />
	<span><asp:Literal runat="server" ID="litPubDate" /></span>
</h2>
<EPiServer:Property ID="Property1" runat="server" PropertyName="Description" PageLink='<%# CurrentBlock.ENewsItem %>' DisplayMissingMessage="false" />
<asp:Hyperlink runat="server" ID="hlViewFull" CssClass="btn" Target="_blank" Visible="false">
    View Full Blast &raquo;
</asp:Hyperlink>