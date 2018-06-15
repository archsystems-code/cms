<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingPageBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.LandingPageBlockControl" %>

<EPiServer:Property ID="Property1" PropertyName="Header" CssClass="headerBar" CustomTagName="h2" runat="server" />
<asp:Panel runat="server" ID="pnlWysiwygs">
    <asp:Repeater runat="server" ID="rptWysiwygList">
        <ItemTemplate>
            <div class="third" runat="server" ID="divWYSIWYGBlock" >
                <%# Eval("ContentBlock")%>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Panel>