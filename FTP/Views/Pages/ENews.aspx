<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.master" AutoEventWireup="true" CodeBehind="ENews.aspx.cs" Inherits="ASI.Web.Views.Pages.ENews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="enews">
        <AdageEpiLibrary:HeadingH1Property runat="server" PropertyName="Heading" />
		<div class="enews">
			<ul class="featured">
				<li>
                    <EPiServer:Property runat="server" PropertyName="FeaturedENewsLeft" />
				</li>
				<li>
                    <EPiServer:Property ID="Property1" runat="server" PropertyName="FeaturedENewsMiddle" />
				</li>
				<li>
                    <EPiServer:Property ID="Property2" runat="server" PropertyName="FeaturedENewsRight" />
				</li>
			</ul>
            <EPiServer:Property runat="server" PropertyName="PreviousIssueHeader" CustomTagName="h2" />
            
            <asp:Repeater runat="server" ID="rptPrevious">
                <HeaderTemplate>
                    <ul class="archive">
                </HeaderTemplate> 
                <ItemTemplate>
                    <li>
					    <asp:Hyperlink runat="server" ID="hlImageWrap" Target="_blank">
                            <AdageEpiLibrary:ImageProperty ID="ImageProperty1" runat="server" PropertyName="Thumbnail" AltTextMetaName="Description" />
                        </asp:Hyperlink>
					    <h2>
						    <EPiServer:Property runat="server" PropertyName="NewsType" />
						    <span><asp:Literal runat="server" ID="litPubDate" /></span>
					    </h2>
				    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>

            <asp:Repeater runat="server" ID="rptChildren">
                <HeaderTemplate>
                    <ul class="archiveLinks">
                        <li>View our E-News archive</li>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <a href='<%# Eval("StaticLinkUrl") %>'><%# Eval("PageName") %></a>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
