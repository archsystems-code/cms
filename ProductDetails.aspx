<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/ProductMaster.master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ASI.Web.Views.Pages.ProductDetails" %>
<%@ Register Src="~/Commerce/DisplayTemplates/ProductTemplate.ascx" TagPrefix="uc" TagName="ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:PlaceHolder runat="server" ID="ProductInfoHolder"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">

    <Script>
        $(document).ready(function () {

            $(".largeThumbModal").dialog({
                autoOpen: false,
                modal: true,
                minheight: 350,
                draggable: false,
                dialogClass: 'largeThumbModalWrapper'
            });

            $(".showLargeImage").click(function () {
                $(".largeThumbModal").dialog("open");

                return false;
            });

            $('.displayName:contains(".")').remove();

        });
    </Script>

</asp:Content>