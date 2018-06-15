<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="System.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Cms.Shell" %>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html" %>
<%@ Import Namespace="EPiServer.Core" %>

<% 
    string namingContainer = ViewData["NamingContainer"].ToString();
%>

<style type="text/css">
.dijitCalendarYearLabel
{
    line-height : 1.5em !important;
    font-weight : normal !important;
    font-size : 1.091em !important;
}

.dijitCalendarYearContainer td
{
    font-weight : normal !important;
    text-align: center !important;
}
</style>

<span class="epi-criteria-inlineblock"><%= Html.DropDownList(namingContainer + "PropertyName", null, new { dojoType = "dijit.form.FilteringSelect" })%></span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "birthdatecontainer" %>">
    <%= LanguageManager.Instance.Translate("/Commerce/visitorgroups/customerpropertiescriterion/fromdate") %> <span class="epi-criteria-inlineblock" ><%= Html.TextBox(namingContainer + "FromDate", null, new { dojoType = "dijit.form.DateTextBox" })%></span>
    <%= LanguageManager.Instance.Translate("/Commerce/visitorgroups/customerpropertiescriterion/todate") %> <span class="epi-criteria-inlineblock" ><%= Html.TextBox(namingContainer + "ToDate", null, new { dojoType = "dijit.form.DateTextBox" })%></span>
</span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "customergroupcontainer" %>"><%= Html.DropDownList(namingContainer + "CustomerGroup", null, new { dojoType = "dijit.form.FilteringSelect" })%></span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "registrationsourcecontainer" %>"><%= Html.TextBox(namingContainer + "RegistrationSource", null, new { dojoType = "dijit.form.TextBox" })%></span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "countrycontainer" %>"><%= Html.DropDownList(namingContainer + "Country", null, new { dojoType = "dijit.form.FilteringSelect" })%></span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "regioncontainer" %>"><%= Html.TextBox(namingContainer + "Region", null, new { dojoType = "dijit.form.TextBox" })%></span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "addresspostalcodecontainer" %>"><%= Html.TextBox(namingContainer + "AddressPostalCode", null, new { dojoType = "dijit.form.TextBox" })%></span>
<span class="epi-criteria-inlineblock" id="<%= namingContainer + "statecontainer" %>"><%= Html.DropDownList(namingContainer + "State", null, new { dojoType = "dijit.form.FilteringSelect" })%></span>

