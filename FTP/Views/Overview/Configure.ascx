<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Settings>" %>
<%@ Import Namespace="EPiServer.Business.Commerce.UI.Models.Overview"%>
<%@ Import Namespace="EPiServer.Cms.Shell"%>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html"%>
<%= Html.ShellValidationSummary()%>
<div class="epi-paddingHorizontal-small epi-formArea">
    <% Html.BeginGadgetForm("StoreConfiguration"); %>
        <%= Html.AntiForgeryToken()%>
        <fieldset>
            <legend><%= Html.Translate("/EPiServer/Shell/Resources/Texts/Settings") %></legend>
            <div class="epi-size15">
                <div>
                    <%= Html.LabeledTextBox("RefreshInterval", Html.Translate("/Commerce/Gadget/OverviewGadget/RefreshInterval"), null, new { @class = "epi-size3 required", maxlength = 4 }, null)%>
                </div>
            </div>
        </fieldset>
        <div class="epi-buttonContainer-simple">
            <%= Html.AcceptButton() %>
            <%= Html.CancelButton() %>
        </div>
    <% Html.EndForm(); %>
</div>