<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="SendUpdateEmail.aspx.cs" Inherits="ASI.Web.Views.Pages.UserImport.SendUpdateEmail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="confirmId">
        <EPiServer:Property ID="Header" PropertyName="Header" runat="server" CustomTagName="h2" />
        <EPiServer:Property ID="NewPassword" PropertyName="MainBody" runat="server" />
        <p>The email address we have for you on file is: <strong><asp:Literal runat="server" ID="litEmail" /></strong></p>
        <asp:Button runat="server" CssClass="btn" ID="btnSendMail" Text="Send Account Confirmation Email" />
        <asp:Literal runat="server" ID="litNotification" Text="An email has been sent to the account specified above. You should receive it shortly." Visible="false"  />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
