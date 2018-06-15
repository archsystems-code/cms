<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductPicker.aspx.cs"
    Inherits="EPiServer.Business.Commerce.UI.Edit.ProductPicker.ProductPicker" %>

<%@ Register Assembly="Episerver.UI" Namespace="EPiServer.UI.WebControls" TagPrefix="EPiServerUI" %>
<%@ Register Assembly="Episerver" Namespace="EPiServer.UI.WebControls" TagPrefix="EPiServer" %>
<%@ Import Namespace="EPiServer" %>
<%@ Import Namespace="EPiServer.Core" %>
<asp:Content ContentPlaceHolderId="FullRegion" runat="server">
    <asp:ScriptManager ID="productPickerScriptManager" runat="server" ></asp:ScriptManager>
    <link rel="stylesheet" href ='<%= ResolveUrl("~/ClientResources/ProductPicker/ProductPicker.css")  %>' type="text/css"/>
    <style type="text/css">
        span.SortDescending
        {
            background-image: url("<%=UriSupport.ResolveUrlFromUtilBySettings("images/BaseSprite.png")%>");
            background-position: right -1195px;
            padding-right: 24px;
            height: 1.22em;
            display: inline-block;
        }
        span.SortAscending
        {
            background-image: url("<%=UriSupport.ResolveUrlFromUtilBySettings("images/BaseSprite.png")%>");
            background-position: right -1228px;
            padding-right: 24px;
            height: 1.22em;
            display: inline-block;
        }
    </style>
    <script type="text/javascript">
        var timer = null;
        function AsyncSearch(e) {
            if (timer != null) {
                clearTimeout(timer);
            }
            timer = setTimeout(UpdPanelUpdate, 400);
        }

        function UpdPanelUpdate() {
            var box = document.getElementById('<%=searchBox.ClientID%>');
            if (box != null) {
                if (box.value != null) {
                    var obj = document.getElementById("<%= text.ClientID %>");
                    obj.value = box.value;
                    timer = null;
                    __doPostBack("<%= button.UniqueID %>", "");
                }
            }
        }
    
</script>
    <div class="EP-systemMessage" id="errorDiv" style="display:none;"></div>
    <div class="mainRegion">
            <div class="catalogTree">
                <asp:TreeView runat="server" ID="catalogTreeView" OnSelectedNodeChanged="catalogTreeView_SelectedNodeChanged" />
            </div>
            <div class="separatorVertical"></div>
            <div class="productList">
            <div class="searchBoxDiv">
                <label for="searchBox"><%=Translate("/Commerce/productpicker/searchTitle")%>  </label><br />
                <asp:TextBox id="searchBox" runat="server"  CssClass="episize240" MaxLength="255" OnTextChanged ="searchBox_TextChanged" ></asp:TextBox>
                <EPiServerUI:ToolButton ID="SearchButton" SkinID="Search" Text="<%$ Resources: EPiServer, button.search %>"
                 ToolTip="<%$ Resources: EPiServer, button.search %>" runat="server" OnClientClick="javascript:UpdPanelUpdate();return false;" />
            </div>
                <asp:UpdatePanel ID="productGridViewUpdatePanel" runat="server" UpdateMode="Conditional" >
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="catalogTreeView" EventName="SelectedNodeChanged" />
                         <asp:AsyncPostBackTrigger ControlID="button" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>
                         <label for="text" style="display:none;">&nbsp;</label>
                         <asp:TextBox ID="text" runat="server" style="display:none;"></asp:TextBox>
                            <asp:Button ID="button" runat="server" OnClick="button_Click" style="display:none;"/>
                        <asp:GridView ID="productGridView" runat="server" AutoGenerateColumns="false" OnRowCreated="productGridView_RowCreated" AllowPaging="true" PageIndex="0"
                            PageSize="20" AllowSorting="true" OnSorting="productGridView_Sorting" OnPageIndexChanging="productGridView_PageIndexChanging" PagerStyle-CssClass="epipager" EnableViewState="False" >
                            <Columns>
                                <asp:TemplateField HeaderText="<%$ Resources: EPiServer, Commerce.productpicker.productid %>" SortExpression="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="productIDLabel" runat="server" CssClass="GridItem" Text='<%# Eval("Code")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources: EPiServer, Commerce.productpicker.productname %>" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="productNameLabel" runat="server" CssClass="GridItem" Text='<%# HttpUtility.HtmlEncode(Eval("Name").ToString())%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
    </div>
    <div class="separatorLine">
    </div>
    <div class="topLeftPadding">
        <EPiServerUI:ToolButton ID="saveChanges" Text="<%$ Resources: EPiServer, button.select %>"
            ToolTip="<%$ Resources: EPiServer, button.select %>" SkinID="Check" runat="server"
            GeneratesPostBack="false" OnClientClick="onSelect()" />
        <EPiServerUI:ToolButton ID="nothingButton" GeneratesPostBack="False" runat="server"
            OnClientClick="onNothing();" Text="<%$ Resources: EPiServer, Commerce.catalogBrowserProperty.noSelection %>"
            ToolTip="<%$ Resources: EPiServer, Commerce.catalogBrowserProperty.noSelection %>"
            SkinID="Delete" />
        <EPiServerUI:ToolButton ID="cancelButton" runat="server" SkinID="Cancel" Text="<%$ Resources: EPiServer, button.cancel %>"
            ToolTip="<%$ Resources: EPiServer, button.cancel %>" GeneratesPostBack="false"
            OnClientClick="onCancel()" />
    </div>

    <script type='text/javascript' language="javascript">
        var separator = "|";
        var selectedProductCode = null;
        var selectedProductName = null;
        // selectedLevel value:
        //      -1: a product is selected
        //       0: a root node is selected
        //       1: a catalogNode is selected
        var selectedLevel = -1;
        function onSelect() {
            if (selectedLevel == 0) {
                $('#errorDiv').html('<%= Translate("/Commerce/productpicker/invalidSelection") %>').css('display', 'block');
                return;
            }
            EPi.GetDialog().Close(selectedProductCode + separator + selectedProductName + separator + selectedLevel);
        }

        function onCancel() {
            EPi.GetDialog().Close(null);
        }

        function onNothing() {
            EPi.GetDialog().Close("-1" + separator + "-1");
        }

        function ChangeRowColor(rowID, productCode, productName) {
            $(".selectedRow").removeClass('selectedRow').addClass('unselectRow');
            $("#" + rowID).removeClass('unselectRow').addClass('selectedRow');
            // Hide the errorDiv
            $('#errorDiv').css('display', 'none')
            selectedProductCode = productCode;
            selectedProductName = productName;
            // Set the selectedLevel to -1 to indicate that a product is selected
            selectedLevel = -1;
        }

        /* 
         * This function will be called when user click on a catalog node.
         * It will set the node to selected state.
         */
        function CatalogNodeClick(event) {
            var seltreeNode = event.srcElement || event.target;
            if ($(seltreeNode).is('a')) {
                // Remove all selectedcatalognode class
                $('.selectedcatalognode').removeClass('selectedcatalognode');
                // Set the node to be selected.
                $(seltreeNode).addClass('selectedcatalognode');
                // Reset the selected product
                $(".selectedRow").removeClass('selectedRow').addClass('unselectRow');
                // Hide the errorDiv
                $('#errorDiv').css('display', 'none');
                // Get the href of the selected node
                var href = seltreeNode.href;
                var index = href.lastIndexOf("|");
                // The index > 0 means the selected node is not a root node (everything or brands...)
                if (index > 0) {
                    selectedProductCode = href.substring(index + 1, href.length - 2);
                    selectedProductName = $(seltreeNode).text();
                    selectedLevel = 1;
                } else {
                    // Selected a root node is not allow
                    selectedProductCode = '';
                    selectedProductName = '';
                    selectedLevel = 0;
                }
            }
        }
    </script>
</asp:Content>
