<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CEUTakeTestButtonBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.SetBlocks.CEUTakeTestButtonBlockControl" %>

<div class="takeTestInstructionMsg">
    <EPiServer:Property runat="server" PropertyName="InstructionMessage" />
</div>

<asp:LinkButton runat="server" ID="lbTakeTest" CssClass="takeTestLink btn">
    <EPiServer:Property runat="server" PropertyName="LinkText" />
</asp:LinkButton>