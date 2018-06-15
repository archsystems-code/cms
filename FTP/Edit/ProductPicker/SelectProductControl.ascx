<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectProductControl.ascx.cs" Inherits="EPiServer.Business.Commerce.UI.Edit.ProductPicker.SelectProductControl" %>
<asp:HiddenField ID="productCodeHiddenField" runat="server" />
<asp:HiddenField ID="selectCatalogNodeHiddenField" runat="server" />
<asp:TextBox ID="productNameTextBox" runat="server" style="background-color: #EFEFEF;" /><input id="browseButton" type="button" value="..." class="epismallbutton" runat="server" />

<script language="javascript" type="text/javascript">
    function ProductBrowser(textBoxId, hiddenFieldId, selectCatalogHiddenFieldId) {
        this.textBoxId = textBoxId;
        this.hiddenFieldId = hiddenFieldId;
        this.selectCatalogHiddenFieldId = selectCatalogHiddenFieldId;
    }

    ProductBrowser.prototype.CreateDialog = function(url, productCode) {
        if (!url) {
             url = '<%= ResolveUrl("~/Edit/ProductPicker/ProductPicker.aspx?ProductCode=") %>' + productCode;
        }
        var features = { width: 800, height: 708, scrollbars: "no" };
        var callBackAgruments = this.hiddenFieldId + "|" + this.textBoxId + "|" + this.selectCatalogHiddenFieldId;
        this.dialog = EPi.CreateDialog(url, this.DialogClosedCallBack, callBackAgruments, productCode, features);
    }

    ProductBrowser.prototype.DialogClosedCallBack = function (returnedValue, callBackAgruments) {
        if (returnedValue) {
            var values = returnedValue.split("|");
            var fields = callBackAgruments.split("|");
            if ((values[0] == "-1") || (values[0] == 'null')) {
                document.getElementById(fields[0]).value = "";
                document.getElementById(fields[1]).value = "";
                document.getElementById(fields[2]).value = "-1";
            }
            else {
                // fields[0] is productCodeHiddenField, fields[1] is productNameTextBox, fields[2] is selectCatalogNodeHiddenField
                var allowSelectCatalog = <%=AllowSelectCatalog.ToString().ToLower() %>;
                // If the AllowSelectCatalog property is true, set the productCode, product name
                // and set the value for selectCatalogNodeHiddenField: -1 is a product, 1 is for a catalognode
                if(allowSelectCatalog) {
                    document.getElementById(fields[0]).value = values[0];
                    document.getElementById(fields[1]).value = values[1];
                    document.getElementById(fields[2]).value = values[2];
                } else {
                    if (values[2] > 0){
                        // If AllowSelectCatalog property is false and a catalognode is selected, then set the productCode
                        // and productName to empty
                        document.getElementById(fields[0]).value = "";
                        document.getElementById(fields[1]).value = "";
                    } else {
                        // If AllowSelectCatalog property is false and a product is selected, then set the productCode
                        // and productName to the selected productCode and productName
                        document.getElementById(fields[0]).value = values[0];
                        document.getElementById(fields[1]).value = values[1];
                    }
                    // Set the value for selectCatalogNodeHiddenField to -1
                    document.getElementById(fields[2]).value = "-1";
                }
            }
        }
    }
</script>