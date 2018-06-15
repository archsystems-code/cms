<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PressListByCategoryBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.SetBlocks.PressListByCategoryBlockControl" %>

<EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h3" />
<asp:Repeater runat="server" ID="rptPressList">
    <HeaderTemplate>
        <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li runat="server" id="liWrapper">
            <a href='<%# Eval("PressItemFile") %>' target="_blank">
                <EPiServer:Property ID="Property1" runat="server" PropertyName="PageName" />
            </a>
            <EPiServer:Property ID="Property2" runat="server" PropertyName="PressItemDescription" />
			<small>
				<asp:Hyperlink runat="server" ID="hlTearsheet" Target="_blank" Visible="false">
					&raquo; View Tearsheet
				</asp:Hyperlink>
			</small>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul> 
    </FooterTemplate>
</asp:Repeater>

<asp:Hyperlink runat="server" ID="hlViewMore" CssClass="btn">
    <asp:Literal runat="server" id="litBtnText" /> &raquo;
</asp:Hyperlink>