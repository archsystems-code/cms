<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="ASI.Web.Views.Pages.Checkout.Confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="checkout">
		<ul class="crumbs">
			<li class="complete">Billing</li>
			<li class="complete">Shipping</li>
			<li class="complete">Review Order</li>
			<li class="complete">Payment</li>
			<li class="complete">Confirmation</li>
		</ul>
		<div class="confirmation">
			<EPiServer:Property ID="Property2" runat="server" CustomTagName="h3" PropertyName="ConfirmationHeader" />
			<EPiServer:Property ID="Property3" runat="server" PropertyName="ConfirmationText" />
			<p><strong>Order <%= TrackingNumber %> </strong></p>
            <EPiServer:Property runat="server" PropertyName="ContinueShoppingLink" CssClass="btn" />
            <EPiServer:Property runat="server" PropertyName="OrderHistoryLink" CssClass="btn secondary" />
		</div>

        <asp:MultiView ID="Survey" runat="server" ActiveViewIndex="0">

            <asp:View runat="server">

		<div class="survey">
			<EPiServer:Property ID="Property1" runat="server" CustomTagName="h3" PropertyName="SurveyHeader" />
			<div class="half">
				<p>How did you initially hear about the product you purchased at ASI Online?</p>
				<asp:RadioButtonList ID="HearAboutUs" RepeatLayout="UnorderedList" runat="server">
					<asp:ListItem>Web search (Google, etc.) </asp:ListItem>
					<asp:ListItem>Press/Publication </asp:ListItem>
					<asp:ListItem>Tradeshow </asp:ListItem>
					<asp:ListItem>Colleague </asp:ListItem>
					<asp:ListItem>Visit to ASI Showroom</asp:ListItem>
					<asp:ListItem>Other (please explain)</asp:ListItem>
				</asp:RadioButtonList>
				<div>

					<asp:TextBox TextMode="MultiLine" ID="OtherText" runat="server" />
				</div>
			</div>
			<div class="half">
				<p>How would you rate the ease of purchasing materials at ASI Online?</p>
				<asp:RadioButtonList ID="EaseOfUse" RepeatLayout="UnorderedList" runat="server">
					<asp:ListItem> 1 - Difficult</asp:ListItem>
					<asp:ListItem>2</asp:ListItem>
					<asp:ListItem>3</asp:ListItem>
					<asp:ListItem>4</asp:ListItem>
					<asp:ListItem>5 - Easy</asp:ListItem>
				</asp:RadioButtonList>
			</div>
			<asp:Button ID="btnSubmit" runat="server" CssClass="btn" Text="Submit"></asp:Button>
		</div>
            </asp:View>

            <asp:View runat="server">
                <p>Thank you for filling out the survey.</p>
            </asp:View>
        </asp:MultiView>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
