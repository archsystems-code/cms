<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="ASI.Web.Views.Pages.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style type="text/css">
        .success
        {
            background: no-repeat scroll 0 0 #EAFEC9;
            border: 1px solid #CADEAB;
        }
        .failure
        {
            background: no-repeat scroll 0 0 #FFEEEE;
            border: 1px solid #FFA1A1;
        }
        .message
        {
            min-height: 33px;
            padding: 15px;
        }
    </style>
    <div style="height: 400px; width: 97%" class="requestThirds">
        <h2>
            Reset Password</h2>
        <p>
            Type in your email address. A new password will be emailed to you.</p>
        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Email Address:     </asp:Label>
        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
            ErrorMessage="Email is required." ToolTip="User Name is required." ValidationGroup="Login1"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator runat="server" ID="ValidateEmailRegEx" ControlToValidate="UserName"
            Display="Dynamic" ErrorMessage="Make sure the email is valid." ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ValidationGroup="Login1" />
        <br />
        <asp:LinkButton ID="LoginButton" runat="server" CommandName="Login" Text="Reset Password"
            CssClass="btn" ValidationGroup="Login1" /><br />
        <br />
        <br />
        <br />
        <asp:Label ID="Outcome" runat="server" EnableViewState="False" Style="font-size: 12px"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>