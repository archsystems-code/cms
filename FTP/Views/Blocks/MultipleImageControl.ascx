<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MultipleImageControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.MultipleImageControl" %>

<h2>
    <EPiServer:Property ID="ImageControlBlockHeaderTitle" PropertyName="HeaderTitle" runat="server" CustomTagName="span" />
</h2>

<asp:Repeater runat="server" ID="rptImages">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <asp:Multiview runat="server" ID="mvImageWrap">
                <asp:View runat="server" ID="vwWrapped">
                    <a href='<%# Eval("LinkUrl") %>' target="_blank">
			            <asp:Image runat="server" ID="imgWrapped" />
                    </a>
                </asp:View>
                <asp:View runat="server" ID="vwUnwrapped">
			        <asp:Image runat="server" ID="imgUnwrapped" />
                </asp:View>
            </asp:Multiview>
            
            
            <%# Eval("Body") %>
	    </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>

<asp:Hyperlink runat="server" ID="hlButton" CssClass="btn" >
    <EPiServer:Property ID="Property1" runat="server" PropertyName="ButtonText" />
</asp:Hyperlink>


