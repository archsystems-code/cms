<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RandomizedImageBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.RandomizedImageBlockControl" %>

<asp:PlaceHolder runat="server" ID="phSet">
	<h2>
		<EPiServer:Property ID="Property1" runat="server" PropertyName="Headline" CustomTagName="span" />
	</h2>
    <asp:HyperLink runat="server" ID="hlImage">
	    <asp:Image runat="server" ID="imgImage" />
    </asp:HyperLink>

    <asp:Image runat="server" ID="imgNoLink" Visible="false" />
    <EPiServer:Property ID="Property2" runat="server" PropertyName="MainBody" />
</asp:PlaceHolder>

<asp:PlaceHolder runat="server" ID="phNotSet" Visible="false">
    <p>The Folder property is not set to a valid folder.</p>
</asp:PlaceHolder>