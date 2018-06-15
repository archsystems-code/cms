<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="ENewsArchive.aspx.cs" Inherits="ASI.Web.Views.Pages.ENewsArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="eNewsArchive">
        <!-- Guts for the Archive -->
        <%--<h1>E-News Archive for <!--Dynamic Year-->2014</h1>--%>
        <AdageEpiLibrary:HeadingH1Property runat="server" PropertyName="Heading" />
        <!-- Repeater -->
        <%--<ul>
            <li>
                <h2><a href="http://archive.constantcontact.com/fs119/1103596296363/archive/1116875215031.html">Let's Talk Materials: Cast Stone Dimensional Panels</a></h2>
                <p>March 2014</p>
            </li>
            <li>
                <h2><a href="http://archive.constantcontact.com/fs119/1103596296363/archive/1116875215031.html">Let's Talk Materials: Cast Stone Dimensional Panels</a></h2>
                <p>March 2014</p>
            </li>
            <li>
                <h2><a href="http://archive.constantcontact.com/fs119/1103596296363/archive/1116875215031.html">Let's Talk Materials: Cast Stone Dimensional Panels</a></h2>
                <p>March 2014</p>
            </li>
            <li>
                <h2><a href="http://archive.constantcontact.com/fs119/1103596296363/archive/1116875215031.html">Let's Talk Materials: Cast Stone Dimensional Panels</a></h2>
                <p>March 2014</p>
            </li>
            <li>
                <h2><a href="http://archive.constantcontact.com/fs119/1103596296363/archive/1116875215031.html">Let's Talk Materials: Cast Stone Dimensional Panels</a></h2>
                <p>March 2014</p>
            </li>
        </ul>--%>

        <asp:Repeater runat="server" ID="rptChildren">
            <HeaderTemplate>
                <ul>
            </HeaderTemplate>
            <ItemTemplate>
                <li>
                    <h2><asp:Hyperlink runat="server" ID="hlENews">
                        <%# Eval("NewsType") %>

                        </asp:Hyperlink>

                    </h2>
                    <p><asp:Literal runat="server" ID="litPubDate" /></p>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
