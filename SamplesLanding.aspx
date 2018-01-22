<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.Master" AutoEventWireup="true" CodeBehind="SamplesLanding.aspx.cs" Inherits="ASI.Web.Views.Pages.SamplesLanding" %>
<%@ Register Src="~/Views/Controls/SampleRequestModal.ascx" TagName="SampleRequestModal" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="generalTemplate sampleLanding">
	<div class="topCallout">
		<div class="mainText">
			<EPiServer:Property ID="Property2" runat="server" CustomTagName="h2" PropertyName="Heading" />
			<div>
				<EPiServer:Property ID="Property6" runat="server" PropertyName="CalloutText" />
			</div>
		</div>
		<div class="catalog">
			<AdageEpiLibrary:ImageProperty runat="server" PropertyName="BindersImage" PageLink='<%# ProductBinderPageLink %>' AltTextMetaName="Description" />

            <asp:Repeater runat="server" ID="rptBinders">
                <HeaderTemplate>
                    <ul>
                        <li><EPiServer:Property ID="Property6" runat="server" CustomTagName="h4" PropertyName="CatalogHeader" /></li>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
					    <span><%# Eval("Text") %></span>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" CommandName="AddBinder"
                                OnClientClick="return IsLoggedIn();" CommandArgument='<%# Eval("Text") %>'
                                CausesValidation="false">Add to Cart</asp:LinkButton>
				    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
		</div>
	</div>

	<div class="samples">
		<EPiServer:Property ID="Property1" runat="server" CustomTagName="h2" PropertyName="MainTextHeader" />		
		<EPiServer:Property ID="Property5" runat="server" PropertyName="BrandArea" />
		<EPiServer:Property ID="Property4" runat="server" PropertyName="MainBody" />
	</div>
</div>

    <uc:SampleRequestModal runat="server" ID="sampleRequestModal" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>