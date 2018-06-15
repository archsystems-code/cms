<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductPickerSettings.ascx.cs" Inherits="EPiServer.Business.Commerce.UI.Edit.ProductPicker.DynamicContent.ProductPickerSettings" %>
<%@ Register TagPrefix="EPiServer" TagName="SelectProductControl" Src="~/Edit/ProductPicker/SelectProductControl.ascx" %>
<script type="text/javascript">
    function validateProduct(sender, args)
    {
        if (document.getElementById("<%= productpicker.ValueControl.ClientID %>").value == "")
        {
            args.IsValid = false;
            return;
        }
        args.IsValid = true;
    }
    
    jQuery(document).ready(function () {
        var dropDownDisplayPathId = "#<%= dropDownDisplayPath.ClientID %>";

        // Set tooltips for the display path dropdown list and its items
        jQuery(dropDownDisplayPathId).attr("title", jQuery(dropDownDisplayPathId + " option:selected").text());
        jQuery(dropDownDisplayPathId + " option").each(function () {
            jQuery(this).attr("title", jQuery(this).text());
        });

        // change the tooltip of the dropdown when item changed
        jQuery(dropDownDisplayPathId).change(function () {
            jQuery(this).attr("title", jQuery(this).find("option:selected").text());   
        })
    });
</script>
<div class="epirowcontainer" style="margin-left: 8px;">
    <asp:Label ID="Label1" AssociatedControlID="productpicker" ToolTip="<%$ Resources:EPiServer, Commerce.dynamiccontentplugin.productpicker.selectproducttooltip %>" Text="<%$ Resources:EPiServer, Commerce.dynamiccontentplugin.productpicker.selectproduct %>" runat="server" /><br />
    <EPiServer:SelectProductControl runat="server" id="productpicker" style="display:inline;" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" Text="*" ClientValidationFunction="validateProduct"  ErrorMessage="<%$ Resources: EPiServer, Commerce.dynamiccontentplugin.productpicker.selectproductrequire %>" />
    <div>
        <asp:Label ID="Label2" AssociatedControlID="dropDownDisplayPath" ToolTip="<%$ Resources:EPiServer, Commerce.dynamiccontentplugin.productpicker.selectdisplaypathtooltip %>" Text="<%$ Resources:EPiServer, Commerce.dynamiccontentplugin.productpicker.selectdisplaypath %>" runat="server" /><br />
        <asp:DropDownList ID="dropDownDisplayPath" runat="server" ></asp:DropDownList>
    </div>
</div>
