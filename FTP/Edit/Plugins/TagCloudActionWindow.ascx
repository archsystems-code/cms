<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TagCloudActionWindow.ascx.cs"
    Inherits="EPiServer.Business.Commerce.UI.Edit.Plugin.TagCloudActionWindow" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly ="EPiServer.UI" Namespace ="EPiServer.UI.WebControls" TagPrefix="EPiServerUI"%>    
<%@ Import Namespace="EPiServer" %>
<%@ Import Namespace="EPiServer.Business.Commerce.UI.Edit.Plugin" %>
<%@ Import Namespace="EPiServer.Core" %>
<%@ Import Namespace="EPiServer.Business.Commerce" %>
<style type="text/css">
    span.TagCloudSortDescending
    {
        background-image: url("<%=UriSupport.ResolveUrlFromUtilBySettings("images/BaseSprite.png")%>");
        background-position: right -1195px;
        padding-right: 24px;
        height: 1.22em;
        display: inline-block;
    }
    span.TagCloudSortAscending
    {
        background-image: url("<%=UriSupport.ResolveUrlFromUtilBySettings("images/BaseSprite.png")%>");
        background-position: right -1228px;
        padding-right: 24px;
        height: 1.22em;
        display: inline-block;
    }
</style>
<link id="Link1" type="text/css" rel="Stylesheet" href='<%= ResolveUrl("~/ClientResources/Plugins/TagClouldActionWindow/Styles.css") %>' />
<script type="text/javascript">
    var confirmMessage = '<%= Translate("/Commerce/Edit/Plugin/TagCloud/ConfirmDelete") %>';
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

<asp:ScriptManager runat="server">
</asp:ScriptManager>

<div class="searchBoxDiv">
    <label><%=Translate("/Commerce/Edit/Plugin/TagCloud/SearchTitle")%>  </label>
    <asp:TextBox id="searchBox" runat="server"  CssClass="episize240" MaxLength="255" OnTextChanged ="searchBox_TextChanged" ></asp:TextBox>
    <EPiServerUI:ToolButton ID="SearchButton" SkinID="Search" Text="<%$ Resources: EPiServer, button.search %>" ToolTip="<%$ Resources: EPiServer, button.search %>" runat="server" />
</div>
<div class="updateDiv">
 <asp:UpdateProgress  ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
    <ProgressTemplate>
         <img src='<%= ResolveUrl("~/ClientResources/Plugins/TagClouldActionWindow/Loading.gif") %>' alt="<%=Translate("/Commerce/Edit/Plugin/TagCloud/SearchAltText")%>" width="16" height="16" />
    </ProgressTemplate>
    </asp:UpdateProgress>
</div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
     <asp:AsyncPostBackTrigger ControlID="button" EventName="Click" />
   </Triggers>
   <contenttemplate>
    <asp:TextBox ID="text" runat="server" style="display:none;"></asp:TextBox>
    <asp:Button ID="button" runat="server"
            OnClick="button_Click" style="display:none;"/>


    <div class="epi-contentArea">
    <div class="EP-validationSummary" id="ErrorSummary" runat="server" visible="false" />
    <asp:ValidationSummary ID="ValidationSummary" runat="server" DisplayMode="BulletList"
        CssClass="EP-validationSummary" ValidationGroup="tagValidate" />
    </div>
    <div>
<asp:GridView ID="tagCloudDataGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
    UseAccessibleHeader="true" OnRowEditing="tagCloudDataGridView_RowEditing" OnRowCancelingEdit="tagCloudDataGridView_RowCancelingEdit"
    OnRowDeleting="tagCloudDataGridView_RowDeleting" OnRowUpdating="tagCloudDataGridView_RowUpdating"
    AllowPaging="true" AllowSorting="true" PageIndex="0" PageSize="<%#Constants.TagCloudPerPage%>"
    OnPageIndexChanging="tagCloudDataGridView_PageIndexChanging" OnSorting="tagCloudDataGridView_Sorting"
    OnRowCreated="tagCloudDataGridView_RowCreated" PagerSettings-Mode="Numeric" PagerStyle-CssClass="epipager" OnRowCommand="tagCloudDataGridView_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.TagName %>"
            SortExpression="Name">
            <ItemTemplate>
                <asp:Label ID="tagNameLabel" runat="server" CssClass="GridItem" Text='<%# Eval("Name").ToString().ToHtmlEncoded()%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="tagNameTextBox" runat="server" MaxLength="100" Width="90%" Text='<%# Eval("Name")%>' />
                <asp:RequiredFieldValidator ID="TagNameValidator" runat="server" ControlToValidate="tagNameTextBox" Display="Dynamic"
                    SetFocusOnError="True" ValidationGroup="tagValidate" Text="*" ErrorMessage="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Messages.EmptyTagName %>" />
                <asp:CustomValidator ID="UniqueTagNameValidator" runat="server" ControlToValidate="tagNameTextBox" Display="Dynamic"
                     ErrorMessage="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Messages.TagNameIsNotUnique %>"
                    SetFocusOnError="True" ValidationGroup="tagValidate" OnServerValidate="UniqueTagNameValidator_Validate" Text="*" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField SortExpression="TagItemsCount" HeaderText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.TagHit %>"
            ItemStyle-CssClass="GridNarrowItem">
            <ItemTemplate>
                <asp:Label ID="hitCountLabel" runat="server" CssClass="GridItem" Text='<%# Eval("TagItemsCount")%>' />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="hitCountTextBox" runat="server" SkinID="Size35" MaxLength="9" Text='<%# Eval("TagItemsCount")%>' />
                <asp:RequiredFieldValidator ID="HitCountValidator" runat="server" ControlToValidate="hitCountTextBox" Display="Dynamic"
                    ErrorMessage="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Messages.EmptyHitCount %>" SetFocusOnError="True" ValidationGroup="tagValidate" Text="*" />
                <asp:RegularExpressionValidator ID="HitCountNumberValidator" ControlToValidate="hitCountTextBox" runat="server" 
                    SetFocusOnError="True" ValidationGroup="tagValidate" ValidationExpression="^\d+$" Display="Dynamic"
                     ErrorMessage="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Messages.InvalidHitCount %>" Text="*" />
            </EditItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Delete %>"
            ItemStyle-CssClass="GridNarrowItem">
            <ItemTemplate>
                <asp:ImageButton ImageUrl="<%#DeleteImageThemeUrl %>" AlternateText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Delete %>"
                    CommandName="Delete" CommandArgument='<%# Eval("Id")%>' runat="server" ID="deleteImageButton"
                    OnClientClick="javascript: return confirm(confirmMessage);" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Edit %>"
            ItemStyle-CssClass="GridNarrowItem">
            <ItemTemplate>
                <asp:ImageButton ImageUrl="<%#EditImageThemeUrl %>" AlternateText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Edit %>"
                    CommandName="Edit" CommandArgument='<%# Eval("Id")%>' runat="server" ID="editImageButton" />
            </ItemTemplate>
            <EditItemTemplate>
                <asp:ImageButton ImageUrl="<%#SaveImageThemeUrl %>" AlternateText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Save %>"
                    CommandName="Update" CommandArgument='<%# Eval("Id")%>' runat="server" ID="saveImageButton" ValidationGroup="tagValidate" />
                <asp:ImageButton ImageUrl="<%#CancelImageThemeUrl %>" AlternateText="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.Cancel %>"
                    CommandName="Cancel" runat="server" ID="cancelImageButton" />
            </EditItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<span class="EP-systemMessage" id="warningMessageSpan" runat="server">
    <table>
        <tbody>
            <tr>
                <td>
                    <asp:ImageButton ImageUrl="<%#WarningImageThemeUrl %>" ID="warningImageButton" runat="server" />
                </td>
                <td>
                    <asp:Literal ID="warningMessageLiteral" runat="server" Text="<%$ Resources: EPiServer, Commerce.Edit.Plugin.TagCloud.WarningMessage %>" />
                </td>
            </tr>
        </tbody>
    </table>
</span>
 </div>
    </contenttemplate>
</asp:UpdatePanel>