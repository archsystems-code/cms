<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccordianBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.AccordianBlockControl" %>



    <asp:Repeater runat="server" ID="rptCells">
        <HeaderTemplate>
            <div class="accordion">
        </HeaderTemplate>
        <ItemTemplate>
            <p><a href='#<%# Container.ItemIndex + 1%>'> <%# Eval("Headline") %></a></p>
			<div>
				<%# Eval("Body") %>
			</div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>