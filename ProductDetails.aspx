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

            var wWidth = $(window).width();
            var dWidth = wWidth * 0.9;
            $(".largeThumbModal").dialog({
                autoOpen: false,
                modal: true,
                width: dWidth,
                minheight: 350,
                draggable: false,
                dialogClass: 'largeThumbModalWrapper'
            });

            $(".showLargeImage").click(function () {
                $(".largeThumbModal").dialog("open");

                return false;
            });

            if ($('.displayName').text().length === 1) {
                $('.displayName').remove()
            }

            if ($(".variations").html().includes("styles") && $(".variations p").text() == "Additional colors and styles") {
                $(".variations p").text("Additional colors")
            }

            $('.productImage a.showLargeImage').after($('.productInfo .nameSku'))
            $('.nameSku').css("text-align", "center")
            $('.nameSku').css("font-weight", "bold")
            $('.nameSku').css("clear", "both")
            $('.nameSku').css("display", "flex")
            $('.nameSku').css("flex-direction", "column")
            $('.nameSku').css("padding-top", "8px")
        });
    </Script>

</asp:Content>