<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BlogItem.ascx.cs" Inherits="ASI.Web.Views.Controls.BlogItem" %>
<article>
	<p class="date"><asp:Literal runat="server" ID="litDate" /></p>
	<h1>
		<asp:Hyperlink runat="server" ID="hlPageName">
            <EPiServer:Property runat="server" PropertyName="PageName" ID="propPageName" />
		</asp:Hyperlink>
	</h1>
    <EPiServer:Property runat="server" PropertyName="MainBody" PageLink='<%# PageLink %>' />
	<p>Posted at <asp:Literal runat="server" ID="litPostDate" /></p>
	<asp:Hyperlink runat="server" ID="hlCommentsLink">
        Comments (<asp:Literal runat="server" ID="litCommentCount" />)
	</asp:Hyperlink>
</article>