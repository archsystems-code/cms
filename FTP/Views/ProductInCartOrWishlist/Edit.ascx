<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Cms.Shell" %>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Core" %>
<% 
    string namingContainer = ViewData["NamingContainer"].ToString();
%>

<span class="epi-criteria-inlineblock"><%= Html.DropDownList(namingContainer + "ComparisonType", null, new { dojoType = "dijit.form.FilteringSelect" })%></span>
<span class="epi-criteria-inlineblock" id='<%= namingContainer + "CategoryContainer" %>'><%= Html.DropDownList(namingContainer + "Category", null, new { dojoType = "dijit.form.FilteringSelect" })%></span>
<span class="epi-criteria-inlineblock" id='<%= namingContainer + "ProductNameContainer" %>'><%= Html.TextBox(namingContainer + "ProductName", null, new { dojoType = "dijit.form.TextBox" })%></span>
<span class="epi-criteria-inlineblock" id='<%= namingContainer + "HasPropertyAndValueContainer" %>'> 
        <%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/productincartorwishlist/propertylabel","Property")%>&nbsp;
        <span class="epi-criteria-inlineblock" ><%= Html.TextBox(namingContainer + "Property", null, new { dojoType = "dijit.form.TextBox" })%></span>
        <%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/productincartorwishlist/valuelabel", "with value")%>&nbsp;
          <span class="epi-criteria-inlineblock" ><%= Html.TextBox(namingContainer + "PropertyValue", null, new { dojoType = "dijit.form.TextBox" })%></span>
</span>

