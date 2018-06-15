<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedProjectBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.SetBlocks.FeaturedProjectBlockControl" %>

<asp:MultiView runat="server" ID="mvWrapper">
    <asp:View runat="server" ID="vwFeaturedProject">
        <h2>Featured Project</h2>

        <asp:HyperLink runat="server" ID="hlViewProject2">
            <asp:Image runat="server" ID="imgProjectImage" />
        </asp:HyperLink>
        <h3>
            <asp:Literal runat="server" ID="litProjectName" />
            <EPiServer:Property runat="server" PropertyName="FullAandDFirmName" PageLink='<%# CurrentBlock.FeaturedProject %>' DisplayMissingMessage="false" />
        </h3>

        <asp:Repeater runat="server" ID="rptProducts">
            <HeaderTemplate>
                <p class="photoFeaturing">
                    Featuring:
            </HeaderTemplate>
            <ItemTemplate>
                <span>
                    <asp:HyperLink runat="server" ID="hplProductCollection"></asp:HyperLink>                                                   
                        <asp:Repeater runat="server" ID="rptProductLink">
                            <HeaderTemplate>&nbsp;-</HeaderTemplate>
                            <ItemTemplate>
                                <asp:HyperLink runat="server" ID="hplProductLink"></asp:HyperLink>                                
                            </ItemTemplate>
                        </asp:Repeater>
                </span>
            </ItemTemplate>
            <FooterTemplate>
                </p>
            </FooterTemplate>
        </asp:Repeater>
        <asp:HyperLink runat="server" ID="hlViewProject" Text="View Testimonial" />

        <asp:PlaceHolder runat="server" ID="phOtherProjects">

            <a class="moreProjectsLink" href="#">Other Projects ▼</a>

            <div class="moreProjectsReveal">
                <asp:Repeater runat="server" ID="rptOtherProject" OnItemDataBound="rptOtherProject_ItemDataBound">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li class="otherProjectsCopy">
                            <asp:HyperLink runat="server" ID="hplProejctLink"></asp:HyperLink>                            
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>



        </asp:PlaceHolder>
    </asp:View>
    <asp:View runat="server" ID="vwFallbackContent">
        <EPiServer:Property runat="server" PropertyName="FallbackHeading" CustomTagName="h2" />
        <EPiServer:Property runat="server" PropertyName="FallbackContent" />
    </asp:View>
</asp:MultiView>




