<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Cms.Shell" %>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Core" %>

<% 
    string namingContainer = ViewData["NamingContainer"].ToString();
%>

<span class="epi-criteria-inlineblock">
	<label class="epi-criteria-label" for=<%= namingContainer + "WithinDays" %>><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/recentorderscriterion/withindays", "Ordered within the last")%></label>
	<%= Html.TextBox(namingContainer + "WithinDays", null, new { dojoType = "dijit.form.NumberSpinner", constraints = "{min:0, places:0}", required = "true" })%>
	<label class="epi-criteria-label" ><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/recentorderscriterion/days", "days")%></label>
</span>
