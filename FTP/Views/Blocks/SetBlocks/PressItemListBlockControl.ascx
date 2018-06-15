<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PressItemListBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.SetBlocks.PressItemListBlockControl" %>

<asp:Repeater runat="server" ID="rptFeaturedPressItems">
    <ItemTemplate>
        <div class="featured sub third">
            <a href='<%# Eval("PressUrl") %>' >
                <img src='<%# Eval("ImageUrl") %>' />
				<%# Eval("PressDesc") %>
            </a>
        </div>
    </ItemTemplate>
</asp:Repeater>