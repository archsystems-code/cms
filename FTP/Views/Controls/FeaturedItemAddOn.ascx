<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedItemAddOn.ascx.cs" Inherits="ASI.Web.Views.Controls.FeaturedItemAddOn" %>

<%@ Register TagPrefix="EPiCommerce" Namespace="ASI.Web.Views.Controls" Assembly="ASI.Web" %>

<h2>
    Featured Products </h2>
<asp:Panel ID="PanelItems" CssClass="mySamples" runat="server" Visible="true">
    <ul class="cart">
        <li><asp:Label ID="CollectionName" runat="server" CssClass="collectionName" Text='<%#parentCatalogName %>'></asp:Label></li>
        <asp:Repeater runat="server" ID="RepeaterFeaturedItems" EnableViewState="false" OnItemDataBound="RepeaterFeaturedItems_ItemDataBound" >
            <ItemTemplate>


                <li><asp:HyperLink runat="server" ID="hlThumb">
                    <epicommerce:assetimage runat="server" id="AssetImage1" entry='<%# (Container.DataItem) %>' assetgroup="ThumbnailGroup"  />
                </asp:HyperLink>
                    <asp:DropDownList ID="Qty" runat="server" AutoPostBack="false"
                        Visible="true" onchange="if (this.value == '11') {alert('An ASI representative will contact you'); }" >
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem Value="11">10+</asp:ListItem>
                    </asp:DropDownList>
                    <span>Product:</span>
                    <asp:Label ID="ProductName" runat="server" Text='<%# Eval("Name") %>' />
                    <asp:Label ID="Image1" runat="server" Text="hmm"> </asp:Label>
                    <a href="#" class="remove" >Remove Item</a>
                    <asp:HiddenField ID="hdnID" ClientIDMode="Static" runat="server" Value='<%# Eval("ID") %>'/>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>





    <asp:LinkButton ID="Button2" runat="server" Text="Add to Cart" OnClick="Continue_Click" CssClass="continueShop btn"
        OnClientClick="$('.modalRecommend, .modalSamples, #Modal_backgroundElement').hide(); return true;" />
	<a href="#" class="btn secondary close">No Thanks</a>
    
</asp:Panel>

<script type="text/javascript">
    $(document).ready(function () {
        $('img.popupsample').tooltip({
            delay: 0,
            showURL: false,
            track: true,
            bodyHandler: function () {
                return $("<img/>").attr("src", this.src);
            }
        });
        $('img.popupsampleglass').tooltip({
            delay: 0,
            showURL: false,
            track: true,
            bodyHandler: function () {
                return $("<img/>").attr("src", $(this).parent().parent().children(":first").attr('src'));
            }
        });

        $('.remove').on('click', function (evt) {
            var $target = $(evt.currentTarget);
            $target.parent().hide();
            $("#hdnID", $target.parent()[0]).val("");
            return false;
        });

    });

</script>