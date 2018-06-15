<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="ASI.Web.Views.Pages.Checkout.Checkout" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="checkout">
		<asp:MultiView ID="mvCheckout" runat="server" ActiveViewIndex="0">
			<asp:View runat="server" ID="vwEmptyCart">
				<h3>Your cart is empty</h3>
				<p>Your cart is empty-Please shop for items to purchase</p>
				<p><a href="#">Continue Shopping *NOT WIRED*</a></p>
				<p><a href="#">Order History *NOT WIRED*</a></p>
			</asp:View>
			<asp:View runat="server" ID="vwNotLoggedIn">
				<div class="notLoggedIn">
					<h2>Login / Register</h2>
					<div class="first login">
						<h3>Log In</h3>
						<p>Already registered? Please login in below:</p>
						<ul>
							<li>
								<asp:Label ID="Label1" runat="server" AssociatedControlID="tbxEmail">Email Address</asp:Label>
								<asp:TextBox runat="server" ID="tbxEmail" />
							</li>
							<li>
								<asp:Label ID="Label2" runat="server" AssociatedControlID="tbxPassword">Password</asp:Label>
								<asp:TextBox runat="server" ID="tbxPassword" TextMode="Password" />
							</li>
							<li>
								<asp:LinkButton runat="server" ID="lbLogin" CssClass="btn">Login</asp:LinkButton>
							</li>
							<li>
								<asp:Literal runat="server" ID="FailureText" />
							</li>
							<li>
								<small><asp:HyperLink NavigateUrl="/Forgot-Password" runat="server" ID="hlForgotPassword">Forgot your Password?</asp:HyperLink></small>
							</li>
						</ul>
					</div>
					<div class="second register highlightSec right">
						<div class="content">
							<h3>Create an account!</h3>
							<p>Please take a moment to register with us. This will save your information for future orders and allow you to checkout faster , access your order status and view order history.</p>							
                            <asp:HyperLink runat="server" ID="btnRegister" CssClass="btn">Register</asp:HyperLink>
						</div>
					</div>	
				</div>
			</asp:View>
		</asp:MultiView>
	</div>
</asp:Content>