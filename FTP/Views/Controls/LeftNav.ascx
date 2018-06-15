<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftNav.ascx.cs" Inherits="ASI.Web.Views.Controls.LeftNav" %>

<nav class="navleftList sideFixed segments">
	<h3>
        <asp:HyperLink ID="lnkHeader" runat="server" />
	</h3>

    <asp:Repeater runat="server" ID="rptChildren" >
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <a href='<%# Eval("StaticLinkUrl") %>'>
                    <EPiServer:Property runat="server" PropertyName="PageName" />
                </a>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>

</nav>