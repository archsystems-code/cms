<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DynamicContentPreview.aspx.cs" Inherits="EPiServer.Business.Commerce.UI.Edit.DynamicContentPreview" %>
<%@ Import Namespace="EPiServer.Shell"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1" runat="server">
		<title>Preview Dynamic Content</title>
        <asp:PlaceHolder runat="server">
            <script type="text/javascript" src="<%=Paths.ToShellClientResource("ClientResources/EPiJQuery.js")%>"></script>
        </asp:PlaceHolder>
		<style type="text/css">
			html {
				background-color:#fff;
				overflow:auto;
			}
			html, body {
				margin:0;
				height:100%;
			}
			form {
				padding-left:3px;
			}
		</style>
		<asp:PlaceHolder runat="server">
            		<% foreach (string cssUrl in ContentCssUrls()) { %>
		<link rel='stylesheet' type='text/css' href='<%= cssUrl %>'/>
		<% } %>
        </asp:PlaceHolder>
	</head>
	<body id="content" class="mceContentBody">
		<form id="Form1" runat="server">
			<asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" EnablePartialRendering="true"
				EnableScriptGlobalization="true" LoadScriptsBeforeUI="true" ScriptMode="Auto">
				<Scripts>
					<asp:ScriptReference Path="~/ClientResources/Dialogs/main.js"/>            
				</Scripts>
			</asp:ScriptManager>
			<input type="hidden" id="DynamicContent" runat="server"/>
		</form>
	</body>
</html>