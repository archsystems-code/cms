<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Cms.Shell" %>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Core" %>

<% 
    string namingContainer = ViewData["NamingContainer"].ToString();
%>

<span class="epi-criteria-inlineblock">
	<label class="epi-criteria-label" for=<%= namingContainer + "OrderTimes" %>><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/orderfrequencycriteria/ordertimes","Ordered")%></label>
	<%= Html.TextBox(namingContainer + "OrderTimes", null, new { dojoType = "dijit.form.NumberSpinner", constraints = "{min:0, places:0}", required="true" })%>
	<label class="epi-criteria-label" for=<%= namingContainer + "NumberOfDays" %>><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/orderfrequencycriteria/withindays","times within the last")%></label>
	<%= Html.TextBox(namingContainer + "NumberOfDays", null, new { dojoType = "dijit.form.NumberSpinner", constraints = "{min:0, places:0}", required="true" })%>
	<label class="epi-criteria-label" ><%= LanguageManager.Instance.TranslateFallback("/Commerce/visitorgroups/orderfrequencycriteria/numberofdays","days")%></label>
</span>
