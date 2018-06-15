<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Cms.Shell" %>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Core" %>
<% 
    string namingContainer = ViewData["NamingContainer"].ToString();
%>
<span class="epi-criteria-inlineblock">
    <label class="epi-criteria-label" for=<%= namingContainer + "Total" %>><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/recentspent/totallabel", "Spent at least")%></label>
    <%= Html.TextBox(namingContainer + "Total", null, new { dojoType = "dijit.form.NumberTextBox", constraints= "{min:0}", required="true" })%>
    <%= Html.DropDownList(namingContainer + "Currencies", null, new { dojoType = "dijit.form.FilteringSelect", required = "true" })%>
    <label class="epi-criteria-label" for=<%= namingContainer + "Days" %>><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/recentspent/withindays", "within the last")%></label>
    <%= Html.TextBox(namingContainer + "Days", null, new { dojoType = "dijit.form.NumberSpinner", constraints = "{min:0, places:0}", required="true" })%>
    <label class="epi-criteria-label" ><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/recentspent/days","days")%></label>
</span>
