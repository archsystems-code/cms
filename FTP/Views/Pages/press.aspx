<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/Interior.master" AutoEventWireup="true" CodeBehind="Press.aspx.cs" Inherits="ASI.Web.Views.Pages.Press" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="press">
        <h1>Press</h1>
        <div class="featured main twoThird">
            <EPiServer:Property runat="server" PropertyName="MainFeaturedPressItemBlock" />
        </div>
        <div class="subFeatures">
            <EPiServer:Property runat="server" PropertyName="FeaturedPress" />
        </div>

        <div class="pressSegments">
            <div class="pressList twoThird">
                <EPiServer:Property runat="server" PropertyName="ASIInTheNewsBlock" />
            </div>
            <div class="pressNews twoThird">
                <div class="pressList segment">
                    <EPiServer:Property ID="Property5" runat="server" PropertyName="HospitalityBlock" />
                </div>
                <div class="pressList segment">
                    <EPiServer:Property ID="Property6" runat="server" PropertyName="RetailBlock" />
                </div>
                <div class="pressList segment">
                    <EPiServer:Property ID="Property7" runat="server" PropertyName="MFResidentialBlock" />
                </div>
                <div class="pressList segment">
                    <EPiServer:Property ID="Property8" runat="server" PropertyName="BlogsBlock" />
                </div>

            </div>
        </div>
        <div class="pressItems third">
            <div class="pressList asiBrands">
                <EPiServer:Property ID="Property9" runat="server" PropertyName="ASIPressReleasesBlock" />
            </div>
            <div class="pressList">
                <EPiServer:Property ID="Property10" runat="server" PropertyName="ASIPressBlock" />
            </div>
        </div>
        <div class="subLinks">
            <EPiServer:Property runat="server" PropertyName="FooterHeading" CustomTagName="h4" />
            <div class="third">
                <EPiServer:Property runat="server" PropertyName="FooterLink1" />
            </div>
            <div class="third">
                <EPiServer:Property ID="Property3" runat="server" PropertyName="FooterLink2" />
            </div>
            <div class="third">
                <EPiServer:Property ID="Property4" runat="server" PropertyName="FooterLink3" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
