<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsStoryItem.ascx.cs" Inherits="ASI.Web.Views.Controls.NewsStoryItem" %>

<asp:Repeater runat="server" ID="rptNewsStories" >
    <ItemTemplate>
        <li>
            <img src='<%# Eval("NewsItemThumbnail") %>'>
            <div>
                <h3><%# Eval("NewsItemTitle") %></h3>
                <div><%# Eval("NewsItemDescription") %></div>
            </div>
        </li>
    </ItemTemplate>
</asp:Repeater>