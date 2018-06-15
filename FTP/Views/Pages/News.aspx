<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="ASI.Web.Views.Pages.News" %>

<%@ Register Src="~/Views/Controls/NewsStoryItem.ascx" TagPrefix="uc1" TagName="NewsStoryItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="newsMedia">

        <div class="header">
            <h1>2013 News</h1>
            <div class="year">
                <h3>Select Year</h3>
                <ul>
                    <asp:Repeater runat="server" ID="rptNewsYears">
                        <ItemTemplate>
                            <li>
                                <a href='<%# GetYearLinkURL(Eval("Year")) %>'><%# Eval("Year") %></a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>

        <asp:Repeater runat="server" ID="rptNewsItems">
            <ItemTemplate>
                <div class="month">
                    <h2>
                        <%# Eval("Month") %>
                    </h2>
                    <ul class="newsStories">
                        <uc1:NewsStoryItem runat="server" id="ucNewsStoryItem" />
                    </ul>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
