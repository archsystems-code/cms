<%@ Page Title="" Language="C#" MasterPageFile="~/SalesPortal/SalesPortalMaster.Master" AutoEventWireup="true" CodeBehind="SalesPortalLogin.aspx.cs" Inherits="ASI.Web.SalesPortal.SalesPortalLogin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"></asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="checkout">
        <div class="notLoggedIn">
            <h2>Login</h2>
            <div class="first login">
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
                        <small>
                            <asp:HyperLink NavigateUrl="/Forgot-Password" runat="server" ID="hlForgotPassword">Forgot your Password?</asp:HyperLink></small>
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
    </div>
</asp:Content>
