<%@ Page language="c#" Inherits="EPiServer.Business.Commerce.UI.Edit.CatalogNodeBrowser.CatalogNodeBrowser" 
Codebehind="CatalogNodeBrowser.aspx.cs" %>
<%@ Register Assembly="Episerver.UI" Namespace="EPiServer.UI.WebControls" TagPrefix="EPiServerUI" %>
<%@ Register Assembly="Episerver" Namespace="EPiServer.UI.WebControls" TagPrefix="EPiServer" %>
<asp:Content ContentPlaceHolderID="FullRegion" runat="server">
    <link rel="stylesheet" href ="../../ClientResources/CatalogNodeBrowser/CatalogNodeBrowser.css" type="text/css"/>
    <asp:ScriptManager ID="scripManager" runat="server"></asp:ScriptManager>
    <div>
         <div class="EP-systemMessage" id="errorDiv" style="display:none;" runat="server"></div>
        <div>
            <asp:UpdateProgress ID="updateProgress" runat="server" DisplayAfter="200" AssociatedUpdatePanelID="updatePanel">
                <ProgressTemplate>
                    <img src="../../ClientResources/CatalogNodeBrowser/Loading.gif" alt="loading" />
                    <label id ="loadingLabel"><%= Translate("/Commerce/catalogBrowserProperty/updating")%></label>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        <div class="catalogTree">
            <asp:UpdatePanel ID="updatePanel" runat="server">
                <ContentTemplate>
                    <div>
                        <asp:TreeView ID ="catalogTree" runat="server">
                            <Nodes>
                              <asp:TreeNode Text="Catalogs" Value="0">
                              </asp:TreeNode>
                            </Nodes>
                        </asp:TreeView>
                        <asp:HiddenField ID="nameField" runat="server">
                            </asp:HiddenField>
                        <asp:HiddenField ID="codeField" runat="server">
                            </asp:HiddenField>
                          <script type='text/javascript'>
                              var nameFieldId = '<%= nameField.ClientID %>';
                              var codeFieldId = '<%= codeField.ClientID %>';
                    </script>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="separatorLine"></div>
        <div class="toppadding">
            <EPiServerUI:ToolButton ID="saveChanges" Text="<%$ Resources: EPiServer, button.select %>"
                            ToolTip="<%$ Resources: EPiServer, button.select %>" SkinID="Check" runat="server" GeneratesPostBack="false" OnClientClick="onSelect()" />
            <EPiServerUI:ToolButton ID="nothingButton" GeneratesPostBack="False" 
                            runat="server" OnClientClick="onNothing();" Text="<%$ Resources: EPiServer, Commerce.catalogBrowserProperty.noSelection %>" 
                            ToolTip="<%$ Resources: EPiServer, Commerce.catalogBrowserProperty.noSelection %>" SkinID="Delete" />    
            <EPiServerUI:ToolButton ID="cancelButton" runat="server" SkinID="Cancel" Text="<%$ Resources: EPiServer, button.cancel %>"
                            ToolTip="<%$ Resources: EPiServer, button.cancel %>" GeneratesPostBack="false" OnClientClick="onCancel()"/>                                        
            <input type="hidden" id="result" />
        </div>
    </div>
    <script type='text/javascript'>
        var errorDiv = document.getElementById("<%= errorDiv.ClientID %>");
        var separator = "|";
        function onSelect() {
            errorDiv.style.display = "none";
            var nameField = document.getElementById(nameFieldId);
            var codeField = document.getElementById(codeFieldId);
            if (codeField.value != null && codeField.value.length > 0) {
                document.getElementById('result').value = codeField.value + separator + nameField.value;
                EPi.GetDialog().Close(codeField.value + separator + nameField.value);
            }
            else {
                errorDiv.innerHTML = '<%= Translate("/Commerce/catalogBrowserProperty/invalidSelection") %>';
                errorDiv.style.display = "block";
            }
        }

        function onCancel() {
            errorDiv.style.display = "none";
            EPi.GetDialog().Close(null);
        }

        function onNothing() {
            errorDiv.style.display = "none";
            document.getElementById('result').value = "-1" + separator + "-1";
            EPi.GetDialog().Close("-1" + separator + "-1");
        }
        
    </script>
</asp:Content>


