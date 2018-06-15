<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MonitorData>" %>
<%@ Import Namespace="EPiServer" %>
<%@ Import Namespace="EPiServer.Business.Commerce.UI.Models.CmoGadget"%>
<%@ Import Namespace="EPiServer.Cms.Shell"%>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html"%>
<%@ Import Namespace="System.Web.Mvc"%>

<script type="text/javascript" src="<%= EPiServer.UriSupport.ResolveUrlFromUtilBySettings("javascript/system.js") %>" ></script>
<script type="text/javascript" src="<%= EPiServer.UriSupport.ResolveUrlFromUtilBySettings("javascript/dialog.js") %>" ></script>
<script type="text/javascript" src="<%= EPiServer.UriSupport.ResolveUrlFromUtilBySettings("javascript/EPiServerScriptManager.js") %>" ></script>
<script type="text/javascript">
//<![CDATA[
    if (EPi === undefined || EPi == null) {
        EPi = {};
    }
    EPi.ResolveUrlFromUtil = function (url) {
        return '<%= EPiServer.UriSupport.ResolveUrlFromUtilBySettings("") %>' + url;
    }
//]]>
</script>

<div class="epi-size15">
    <div>
        <%=Html.Hidden("Id") %>
        <%=Html.Label("monitorType", Html.Translate("/Commerce/Gadget/CMO/type"))%>
        <span id="monitorType">
            <%=Html.LabeledRadioButton("Type", "Product View", CommerceMonitorType.View, Model == null ? true : Model.Type == CommerceMonitorType.View)%>
            <%=Html.LabeledRadioButton("Type", "Product Order", CommerceMonitorType.Order, Model == null ? false : Model.Type == CommerceMonitorType.Order)%>
        </span>
    </div>
    <div id="pickerContainer">
        <%=Html.LabeledTextBox("Name", Html.Translate("/Commerce/Gadget/CMO/productcategory"), null, new { @class = "epi-size3 epi-readonly", @readOnly = "true" }, null)%>
        <input type="button" name="browseButton" value="..." class="epismallbutton" title="<%= Html.Translate("/Commerce/Gadget/CMO/selectelement") %>" />
        <%=Html.Hidden("Code") %>
        <%=Html.Hidden("IsCategory")%>
    </div>
    <div>
        <%=Html.LabeledTextBox("ApplicationKey", Html.Translate("/Commerce/Gadget/CMO/applicationkey"), null, new { @class = "epi-size3" }, null)%>
    </div>
    <div>
        <%=Html.LabeledTextBox("Url", Html.Translate("/Commerce/Gadget/CMO/urlforwebservice"), null, new { @class = "epi-size3" }, null)%>
    </div>
</div>