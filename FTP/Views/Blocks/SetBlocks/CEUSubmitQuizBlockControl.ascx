<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CEUSubmitQuizBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.SetBlocks.CEUSubmitQuizBlockControl" %>

<asp:LinkButton ID="lbLink" runat="server"  CssClass="btn quizSubmit">
    <EPiServer:Property runat="server" PropertyName="LinkText" />
</asp:LinkButton>