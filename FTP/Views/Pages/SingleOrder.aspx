<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="SingleOrder.aspx.cs" Inherits="ASI.Web.Views.Pages.SingleOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	
<asp:MultiView runat="server" ID="mvWrapper">
    <asp:View runat="server" ID="vwValid">
        	<div class="orderInfo">
		<table>
			<tr>
				<th>Status:</th>
				<td><%= OrderStatus %></td>
			</tr>
			<tr>
				<th>Order Date:</th>
                <td><%= OrderDate %></td>
			</tr>
			<tr>
				<th>Order Number:</th>
				<td><%= TrackingNumber %></td>
			</tr>
		</table>
		<a href="#" class="btn">View All Orders</a>
	</div>
	<div class="singleOrder">
		<div class="info">
			<h2>Ship To:</h2>
			<ul>
				<li><%= ShippingAddress.Line1 %></li>
				<li runat="server" id="liShipAddressLine2">
                    <%= ShippingAddress.Line2 %>
				</li>
				<li><%= ShippingAddress.City %>, <%= ShippingAddress.State %></li>
				<li><%= ShippingAddress.CountryCode %></li>
				<li><%= ShippingAddress.PostalCode %></li>
			</ul>
		</div>
		<div class="info">
			<h2>Bill To:</h2>
			<ul>
				<li><%= BillingAddress.Line1 %></li>
				<li runat="server" id="liBillAddressLine2">
                    <%= BillingAddress.Line2 %>
				</li>
				<li><%= BillingAddress.City %>, <%= BillingAddress.State %></li>
				<li><%= BillingAddress.CountryCode %></li>
				<li><%= BillingAddress.PostalCode %></li>
			</ul>
		</div>
		<table>
			<thead>
				<tr>
					<th>Description</th>
					<th class="qty">Qty</th>
					<th class="salePrice">Sale Price</th>
					<th>Total</th>
				</tr>
			</thead>
			<tbody>

                <asp:Repeater runat="server" ID="rptItems">
                    <ItemTemplate>
                        <tr>
					        <td><%# Eval("DisplayName") %></td>
					        <td class="qty"><%# ((int)(Container.DataItem as Mediachase.Commerce.Orders.LineItem).Quantity)  %></td>
					        <td class="salePrice"><asp:Literal runat="server" ID="litListPrice" /></td>
					        <td><asp:Literal runat="server" ID="litTotalPrice" /></td>
				        </tr>
                    </ItemTemplate>
                </asp:Repeater>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">Subtotal:</td>
					<td><%= FormattedSubtotal %></td>
				</tr>
				<tr runat="server" id="trDiscount"> 
					<td colspan="3">Discount:</td>
					<td><%= FormattedDiscount %></td>
				</tr>
				<tr>
					<td colspan="3">Tax:</td>
					<td><%= FormattedTax %></td>
				</tr>
				<tr>
					<td colspan="3">Shipping:</td>
					<td><%= FormattedShipping %></td>
				</tr>
				<tr>
					<td colspan="3">Total:</td>
					<td><%= FormattedTotal %></td>
				</tr>
			</tfoot>
		</table>
	</div>
    </asp:View>
    <asp:View runat="server" ID="vsError">
        <EPiServer:Property runat="server" PropertyName="ErrorMessage" />
    </asp:View>
</asp:MultiView>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
