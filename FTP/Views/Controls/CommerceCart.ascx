<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommerceCart.ascx.cs" Inherits="ASI.Web.Views.Controls.CommerceCart" %>

<EPiServer:Property runat="server" PropertyName="ShippingErrorMessage" ID="propShippingError" CssClass="validation" CustomTagName="div" />

<table>
	<thead>
		<tr>
			<th>Item</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Total</th>
		</tr>
	</thead>
	<tbody>
        <asp:Repeater runat="server" ID="rptCartItems">
            <ItemTemplate>
                <tr>
					<td>
						<asp:Image runat="server" ID="imgThumb" />
						<div class="text">
							<h3><asp:Literal runat="server" ID="litFullCollectionName" /></h3>
							<p><%# Eval("DisplayName") %></p>
                            <asp:HiddenField runat="server" ID="hfCatalogEntryID" Value='<%# Eval("CatalogEntryId") %>' />
						</div>
					</td>
					<td><asp:Literal runat="server" ID="litListPrice" /></td>
					<td>
						<asp:TextBox ID="tbxQuantity" runat="server" Visible='<%# EditableQuantities %>' />
						<asp:Placeholder runat="server" ID="phQuantityUneditable" Visible='<%# !EditableQuantities %>'>
                            <%# ((int)(Container.DataItem as Mediachase.Commerce.Orders.LineItem).Quantity)  %>
                        </asp:Placeholder>
					</td>
					<td><asp:Literal runat="server" ID="litTotalPrice" /></td>
				</tr>
            </ItemTemplate>
        </asp:Repeater>
	</tbody>
	<tfoot>
        <asp:MultiView runat="server" ID="mvTotal">
            <asp:View runat="server" ID="vwSimple">
                <tr>
			        <td colspan="4">
				        <p><strong><%= FormattedSubtotal %></strong></p>
			        </td>
		        </tr>
            </asp:View>
            <asp:View runat="server" ID="vwFull">
                <tr>
			        <td colspan="3">Subtotal</td>
			        <td><%= FormattedSubtotal %></td>
		        </tr>
		        <tr>
			        <td colspan="3">Shipping, Packaging, and Crating</td>
			        <td><%= FormattedShipping %></td>
		        </tr>
                <tr runat="server" id="trDiscount" visible="false" class="promoApplied">
			        <td colspan="3">Discount</td>
			        <td><%= FormattedDiscount %></td>
		        </tr>
		        <tr>
			        <td colspan="3">Tax</td>
			        <td><%= FormattedTax %></td>
		        </tr>
		        <tr class="total">
			        <td colspan="3">
				        <strong>Total</strong>
			        </td>
			        <td>
				        <strong><%= FormattedTotal %></strong>
			        </td>
		        </tr>
            </asp:View>
        </asp:MultiView>
		


        

	</tfoot>
</table>