<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PressCategoryItemSection.ascx.cs" Inherits="ASI.Web.Views.Controls.PressCategoryItemSection" %>

<h3><asp:PlaceHolder runat="server" ID="phTitle" /></h3>
<ul>
    <asp:Repeater runat="server" ID="rptPressItems">
        <ItemTemplate>
            <li>
                <a href='<%# Eval("PressUrl") %>'><%# Eval("PressTitle") %> target="_blank"</a>
                <%# Eval("PressDescription") %>
            </li>
        </ItemTemplate>N
    </asp:Repeater>
</ul>
<asp:HyperLink runat="server" ID="hlReadMore" class="btn">View More &raquo;</asp:HyperLink>