<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MonitorData>" %>
<%@ Import Namespace="EPiServer" %>
<%@ Import Namespace="EPiServer.Business.Commerce.UI.Models.CmoGadget"%>
<%@ Import Namespace="EPiServer.Cms.Shell"%>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html"%>
<%@ Import Namespace="System.Web.Mvc"%>
<%= Html.ShellValidationSummary()%>

<div class="epi-paddingHorizontal-small epi-formArea">
    <% Html.BeginGadgetForm("Edit"); %>
        <%= Html.AntiForgeryToken()%>
        <fieldset>
            <legend><%= Html.Translate("/Commerce/Gadget/CMO/editmonitor")%></legend>
            <% Html.RenderPartial("Detail", Model); %>
        </fieldset>
        <div class="epi-buttonContainer-simple">
            <%= Html.AcceptButton() %>
            <%= Html.CancelButton() %>
        </div>
    <% Html.EndForm(); %>
</div>
