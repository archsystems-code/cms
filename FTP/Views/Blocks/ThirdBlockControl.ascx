<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ThirdBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.ThirdBlockControl" %>
    <asp:Repeater runat="server" ID="rptCells">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
				<EPiServer:Property ID="Property1" runat="server" PropertyName="MainBody" />
			</li>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>