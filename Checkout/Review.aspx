<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="ASI.Web.Views.Pages.Checkout.Review" %>
<%@ Register Src="~/Views/Controls/CommerceCart.ascx" TagName="CommerceCart" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<!-- I took all the code from the Cart.aspx page. Please make it work. Thanks! -- Baiel -->
	<div class="checkout cartWrap">
		<ul class="crumbs">
			<li class="complete">Billing</li>
			<li class="complete">Shipping</li>
			<li class="active">Review Order</li>
			<li>Payment</li>
			<li>Confirmation</li>
		</ul>
		<EPiServer:Property ID="Property3" runat="server" CustomTagName="h2" PropertyName="ReviewHeader" />
        <uc:CommerceCart runat="server" id="commerceCart" TotalDisplay="Full" WorkflowType="Prepare" ApplyDiscountCode="true"  />
		<div class="buttons">
			<div class="left">
				<asp:Hyperlink runat="server" ID="hlEditCart" CssClass="btn secondary smallBtn">Edit my cart</asp:Hyperlink>
			</div>
			<asp:Panel runat="server" ID="pnlTerms" CssClass="right">
				<input type="checkbox" checked="checked" />
				<EPiServer:Property ID="Property1" runat="server" CustomTagName="label" PropertyName="TermsText" />
			</asp:Panel>
		</div>   
	</div>
	<div class="navBtns">
		<asp:LinkButton runat="server" ID="lbPrevPage" CssClass="btn secondary" Text="Previous Page" />
		<asp:LinkButton runat="server" ID="lbNextPage" CssClass="btn" Text="Next Page" />
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>