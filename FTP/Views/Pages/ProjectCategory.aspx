<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="ProjectCategory.aspx.cs" Inherits="ASI.Web.Views.Pages.ProjectCategory" %>

<%@ Register Src="~/Views/Controls/Breadcrumbs.ascx" TagPrefix="uc1" TagName="Breadcrumbs" %>
<%@ Register Src="~/Views/Controls/ProjectLeftNav.ascx" TagPrefix="uc1" TagName="ProjectLeftNav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftNav" runat="server">
    <section class="leftCol calloutBucket">
        <uc1:ProjectLeftNav runat="server" id="ProjectLeftNav" />
    </section>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainFixed ssegment">
        <uc1:Breadcrumbs runat="server" id="Breadcrumbs" />
        <div class="list">
            <asp:Repeater runat="server" ID="rptProjectDetailItems">
                <ItemTemplate>
                    <div class="projectItem">
                        <div class="image">
                            <a href='<%# Eval("NavigateUrl") %>'>
                                <img src='<%# Eval("ImageURL") %>' />
                            </a>
                        </div>
                        <div class="text">
                            <h2><span><%# Eval("Name") %></span><p><%# Eval("Location") %></p>
                            </h2>
                            <h3><%# Eval("FullAandDFirmName") %></h3>
                            <div id="featuredProductWrap" class="featuredProducts">

                                <asp:Repeater ID="rptProductList" runat="server">
                                    <HeaderTemplate>
                                        <h5>
                                        Featuring
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <span class="items">
                                        <asp:HyperLink ID="hlCollectionLink" runat="server" CssClass="productListLink"></asp:HyperLink>
                                        <asp:Repeater runat="server" ID="rptProductLink">
                                            <HeaderTemplate>&nbsp;-</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:HyperLink runat="server" ID="hplProductLink"></asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        </span>
                                    </ItemTemplate>
                                    <FooterTemplate></h5></FooterTemplate>
                                </asp:Repeater>

                            </div>
                            <div class="testimonial" runat="server" id="divTestimonial">
                                <%# Eval("TestimonialBlurb") %>
                                <p>
                                    <a href='<%# Eval("NavigateUrl") %>' class="btn">More &raquo; 
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="/js/lib/underscore.js"></script>
    <script src="/js/lib/jquery.pager.js"></script>
    <script>
        $('.list').page({
            innerItemTag: "div[class='projectItem']",
            pageSize: 10,
            useNextPrev: false
        });
    </script>
</asp:Content>
