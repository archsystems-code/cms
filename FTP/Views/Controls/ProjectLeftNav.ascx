<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectLeftNav.ascx.cs" Inherits="ASI.Web.Views.Controls.ProjectLeftNav" %>
<%@ Register Src="~/Views/Controls/ProjectLeftNavItem.ascx" TagPrefix="uc1" TagName="ProjectLeftNavItem" %>

<asp:Repeater runat="server" ID="rptAdditionalLinks">
    <HeaderTemplate>
        <ul class="nav projectTopLinks">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <a href='<%# Eval("StaticLinkUrl") %>' class="header"><%# Eval("PageName") %></a>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>

<ul class="nav projectNav">
    <li>
    <a href="#" class="header">By Market Segment</a>
        <asp:Repeater runat="server" ID="rptNavByMarketingSegment">
            <ItemTemplate>
                <uc1:ProjectLeftNavItem runat="server" id="ProjectLeftNavItem" />
            </ItemTemplate>
        </asp:Repeater>
    </li>
</ul>
<ul class="nav" runat="server" ID="ulHospitalityByVenue" visible="false">
    <li>
    <a href="#" class="header">Hospitality By Venue</a>
        <ul>
            <asp:Repeater runat="server" ID="rptNavHospitalityByVenue" >
                <ItemTemplate>
                    <li runat="server" id="liContainer">
                        <asp:HyperLink runat="server" ID="hlNavItem" />
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </li>
</ul>