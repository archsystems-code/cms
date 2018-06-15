<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectLeftNavItem.ascx.cs" Inherits="ASI.Web.Views.Controls.ProjectLeftNavItem" %>

<ul>
    <li runat="server" id="liRootContainer">
        <asp:HyperLink runat="server" ID="hlSegmentName" />
        <asp:PlaceHolder runat="server" ID="phCategoryNavItems">
        <ul>
            <asp:Repeater ID="rptNavItems" runat="server">
                <ItemTemplate>
                    <li runat="server" id="liContainer">
                        <asp:HyperLink runat="server" ID="hlMenuLink" />
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        </asp:PlaceHolder>
    </li>
</ul>