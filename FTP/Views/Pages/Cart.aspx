<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="ASI.Web.Views.Pages.Cart" %>
<%@ Register Src="~/Views/Controls/CommerceCart.ascx" TagName="CommerceCart" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="cartWrap">
		<EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h2" />
        <asp:Panel runat="server" ID="pnlError" Visible="false" CssClass="validation">
            <p>An error occurred while attempting to process your cart.  Some of your items may have been removed from the cart.  We are sorry for the inconvinience.  
            Please review your cart and re-add any missing items.</p> 
        </asp:Panel>
        <uc:CommerceCart runat="server" ID="commerceCart" TotalType="Simple" EditableQuantities="true" WorkflowType="Validate" />
        <div class="promo">
            <asp:Label ID="PromoCodeLbl" AssociatedControlID="PromoCode" runat="server">Apply Promo Code:</asp:Label>
		    <asp:TextBox ID="PromoCode" runat="server" />
            <asp:LinkButton runat="server" ID="lbApplyPromo" Text="Apply" />
            <asp:Label runat="server" ID="lblInvalidPromoCode" Visible="false"/>
        </div>
		<div class="left clearBoth">
			<EPiServer:Property ID="Property1" runat="server" PropertyName="ContinueShoppingLink" CssClass="btn secondary" />
		</div>
        <div class="right">
            <asp:LinkButton ID="lbUpdateQuantity" CssClass="btn secondary" runat="server">Update Qty</asp:LinkButton>
			<asp:LinkButton ID="checkout" CssClass="btn" runat="server">Checkout</asp:LinkButton>
        </div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
