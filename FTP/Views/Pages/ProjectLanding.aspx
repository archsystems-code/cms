<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="ProjectLanding.aspx.cs" Inherits="ASI.Web.Views.Pages.ProjectLanding" %>

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
    <div class="mainFixed projectsWrapper segments">
        <uc1:Breadcrumbs runat="server" id="Breadcrumbs" />
        <ul class="topMenu">
            <asp:Repeater runat="server" ID="rptTopMenu">
                <ItemTemplate>
                    <li>
                        <asp:HyperLink runat="server" ID="hlCategoryLink" NavigateUrl='<%# Eval("LinkURL") %>'>
							<%# Eval("BrandName") %>
                        </asp:HyperLink>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>

        <div class="project-landing-brand-view">

            <div class="featured wood">
                <div class="image">
                    <asp:HyperLink runat="server" ID="hlProjectLink">
                        <asp:Image runat="server" ID="imgProjectDetails" class="design_selected_field" border="0" />
                        <span>
                            <asp:Literal runat="server" ID="litProjectBrand" />»</span>
                    </asp:HyperLink>
                </div>
                <div class="text">
                    <h2>
                        <asp:Literal runat="server" ID="litName" /></h2>
                    <p>
                        <asp:Literal runat="server" ID="litLocation" />
                    </p>
                    <h3><strong>
                        <asp:Literal runat="server" ID="litFullAandDName" /></strong></h3>
                    <div id="featuredProductWrap" class="featuredProducts">
                        <asp:Repeater ID="rptProductList" runat="server">
                            <HeaderTemplate>
                                <h4>
                                Featuring
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="hlCollectionLink" runat="server" CssClass="productListLink"></asp:HyperLink>&nbsp;-
                            <asp:HyperLink ID="hlProductLink" runat="server" CssClass="productListLink product"></asp:HyperLink>
                            </ItemTemplate>
                            <FooterTemplate></h4></FooterTemplate>
                        </asp:Repeater>                        
                    </div>
                    <asp:Literal runat="server" ID="litTestimonialBlurb" />
                    <p>
                        <strong>
                            <asp:HyperLink runat="server" ID="hlContinueReading">More &raquo;</asp:HyperLink></strong>
                    </p>

                    <span class="btn switch-to-project-list" style="cursor:pointer">Click &raquo; images to view  our
                        <br />
                        gallery of
                        <asp:Literal runat="server" ID="litCategory" />
                        projects
                    </span>
                </div>
            </div>
            <div class="otherProducts">
                <asp:Repeater runat="server" ID="rptOtherProducts">
                    <ItemTemplate>
                        <div class="product" data-width='<%# Eval("ProjectCount") %>'>
                            <div class="image">
                                <a href='<%# Eval("ProjectUrl") %>' title='<%# Eval("ProjectBrand") %> »'>
                                    <img title='<%# Eval("ProjectTitle") %>' alt='<%# Eval("ProjectTitle") %>' src='<%# Eval("ImageUrl") %>' class="design_selected_field" border="0" />
                                    <span><%# Eval("ProjectBrand") %> »</span>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>

        <div class="project-landing-list-view">
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

    </div>

    <script>
        $(function () {

            //$('.project-landing-list-view').hide();

            $('.switch-to-project-list').on('click', function (evt) {
                $('.project-landing-brand-view').hide();
                $('.project-landing-list-view').show();
            });

        });
    </script>


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
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
