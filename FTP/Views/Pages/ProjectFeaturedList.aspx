<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.Master" AutoEventWireup="true" CodeBehind="ProjectFeaturedList.aspx.cs" Inherits="ASI.Web.Views.Pages.ProjectFeaturedList" %>

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
                            <a href='<%# Eval("StaticLinkURL") %>' target="_blank">
                                <img src='<%#  (Container.DataItem as ASI.Web.Models.Pages.ProjectDetailsPage).FeaturedPhoto.ToString() %> ' />
                            </a>
                        </div>
                        <div class="text">
                            <h2>
                                <!-- Macy's, Herald Square, New York, NY - 3/13/2014 -->
                                <a href='<%# (Container.DataItem as ASI.Web.Models.Pages.ProjectDetailsPage).ConstantContactLink.ToString() %>' target="_blank">
                                    <span><%# Eval("Name") %></span>
                                    <p><%#  Eval("Location") %> - <%# (Container.DataItem as ASI.Web.Models.Pages.ProjectDetailsPage).PublicationDate.ToString("M/d/yyyy") %></p>
                                </a>
                            </h2>
                            <EPiServer:Property runat="server" PropertyName="FeaturedDescription"></EPiServer:Property>
                            <p>
                                <a href='<%# (Container.DataItem as ASI.Web.Models.Pages.ProjectDetailsPage).ConstantContactLink.ToString() %>' class="btn" target="_blank">More &raquo;
                                </a>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater runat="server" ID="rptCaseStudyItems">
                <ItemTemplate>
                     <div class="projectItem">
                        <div class="image">
                            <a href='<%# Eval("StaticLinkURL") %>' target="_blank">
                                <img src='<%#  (Container.DataItem as ASI.Web.Models.Pages.ProjectDetailsPage).LandingPagePhoto.ToString() %> ' />
                            </a>
                        </div>
                        <div class="text">
                            <h2>                                
                                <a href='<%# Eval("StaticLinkURL") %>' target="_blank">
                                    <span><%# Eval("Name") %></span>
                                    <p><%#  Eval("Location") %> - <%# (Container.DataItem as ASI.Web.Models.Pages.ProjectDetailsPage).Created.ToString("M/d/yyyy") %></p>
                                </a>
                            </h2>
                            <EPiServer:Property runat="server" PropertyName="TestimonialBlurb"></EPiServer:Property>
                            <p>
                                <a href='<%# Eval("StaticLinkURL") %>' class="btn" target="_blank">More &raquo;
                                </a>
                            </p>
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
