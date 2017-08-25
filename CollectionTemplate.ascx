<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CollectionTemplate.ascx.cs" Inherits="ASI.Web.Commerce.DisplayTemplates.CollectionTemplate" %>

<%@ Register TagPrefix="EPiCommerce" Namespace="ASI.Web.Views.Controls" Assembly="ASI.Web" %>


<asp:panel class="collectionThumbs" runat="server" id="pnlCollectionThumbs">
	<asp:Repeater runat="server" ID="rptProducts"> 
		<HeaderTemplate>
			<ul>
		</HeaderTemplate>
		<ItemTemplate>
			<li>
				<asp:Hyperlink runat="server" ID="hlThumb">
					<EPiCommerce:AssetImage runat="server"  ID="AssetImage1" Entry='<%# (Container.DataItem) %>' AssetGroup="ThumbnailGroup" /> 
				</asp:Hyperlink>
                    
				<p>
					<a href="#">Request Sample (WIRE)</a>
					<span class="prodName"><%# Eval("Name") %></span>
					<span class="prodSku"><%# Eval("ID") %></span>
				</p>
			</li>
		</ItemTemplate>
		<FooterTemplate>
			</ul>
		</FooterTemplate>
	</asp:Repeater>
</asp:panel>        
 