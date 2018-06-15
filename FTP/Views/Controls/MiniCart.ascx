<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MiniCart.ascx.cs" Inherits="ASI.Web.Views.Controls.MiniCart" %>

<div class="mini-cart-header">
    <span runat="server" id="spnQuantity"></span>
</div>
<div class="mini-cart-content">
    <asp:Repeater runat="server" ID="rptCartItems">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <asp:Image runat="server" ID="imgThumb" CssClass="mini-cart-thumbnail" />
                <div class="mini-cart-item-text">
                    <h5>
                        <asp:Literal runat="server" ID="litFullCollectionName" /></h5>
                    <p><%# Eval("DisplayName") %></p>
                    <p>Quantity: <%# ((int)(Container.DataItem as Mediachase.Commerce.Orders.LineItem).Quantity)  %></p>
                    <p>
                        <asp:Literal runat="server" ID="litSquareFootage" />
                    </p>
                    <p class="mini-cart-item-price">
                        Price: 
                <asp:Literal runat="server" ID="litTotalPrice" />
                    </p>
                </div>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>

    <p class="mini-cart-totals">
        Total:
        <asp:Literal runat="server" ID="litSubtotal" />
    </p>
    <div class="mini-cart-buttons">
        <a href="#" class="btn secondary continue-shopping">Continue Shopping</a>
        <asp:HyperLink runat="server" ID="hlCheckout" CssClass="btn">Checkout</asp:HyperLink>
    </div>
</div>
