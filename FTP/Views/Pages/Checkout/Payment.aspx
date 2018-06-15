<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="ASI.Web.Views.Pages.Checkout.Payment" %>
<%@ Register TagPrefix="Commerce" TagName="CreditCard" Src="~/Commerce/plugins/Payment/Authorize/PaymentMethod.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="checkout">
		<ul class="crumbs">
			<li class="complete">Billing</li>
			<li class="complete">Shipping</li>
			<li class="complete">Review Order</li>
			<li class="active">Payment</li>
			<li>Confirmation</li>
		</ul>
		<EPiServer:Property ID="Property2" runat="server" CustomTagName="h2" PropertyName="PaymentHeader" />
		<div class="second paymentMethod">
            <Commerce:CreditCard runat="server" id="ccProcess" />
            <EPiServer:Property runat="server" ID="propPayPalInstructions" PropertyName="PayPalInstructions" Visible="false" />
            <p class="validation"><asp:Literal runat="server" ID="litError" /></p>
		</div>
	</div>
	<div class="navBtns">
		<asp:LinkButton runat="server" ID="lbPrevPage" CssClass="btn secondary" Text="Previous Page"  />
		<asp:LinkButton runat="server" ID="lbSubmit" CssClass="btn" Text="Submit Order" CausesValidation="true" ValidationGroup="Authorize" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
