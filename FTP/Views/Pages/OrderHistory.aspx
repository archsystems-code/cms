<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ASI.Web.Views.Pages.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="orderHistory">
		<EPiServer:Property ID="Property2" runat="server" CustomTagName="h1" PropertyName="Header" />
		<EPiServer:Property ID="Property1" runat="server" PropertyName="Text" />

        <asp:Repeater runat="server" ID="rptOrderHistory">
            <HeaderTemplate>
                <table>
                    <thead>
                        <tr>
                            <th><EPiServer:Property runat="server" PropertyName="OrderDateHeader" /></th>
                            <th><EPiServer:Property runat="server" PropertyName="ConfirmationNumberHeader" /></th>
                            <th><EPiServer:Property runat="server" PropertyName="OrderStatusHeader" /></th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%#((DateTime)Eval("Created")).ToString("MMMM dd, yyyy")%></td>
                    <td>
                        <asp:Hyperlink runat="server" ID="hlTrackingNumber">
                            <%#Eval("TrackingNumber")%>
                        </asp:Hyperlink>
                    </td>
                    <td><%#Eval("Status")%></td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                    </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
