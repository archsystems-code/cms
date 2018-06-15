<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EPiServer.Business.Commerce.UI.Models.OrderGadget.Settings>" %>

<%@ Import Namespace="EPiServer.Cms.Shell"%>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html"%>

<%@ Import Namespace="EPiServer.Core" %>

<%= Html.ShellValidationSummary()%>

<div class="epi-paddingHorizontal-small epi-formArea">
    <% Html.BeginGadgetForm("StoreConfiguration"); %>
        <%= Html.AntiForgeryToken()%>
        <fieldset>
            <legend><%= Html.Translate("/EPiServer/Shell/Resources/Texts/Settings") %></legend>
            <div class="epi-size15">
                <div>
                    <%= Html.LabeledTextBox("UpdateInterval", Html.Translate("/Commerce/Gadget/OrderGadget/updateInterval"), null, new { @class = "epi-size4 required", maxlength = 4 }, null)%>
                </div>
            </div>
        </fieldset>
        <div class="epi-buttonContainer-simple">
            <%= Html.AcceptButton() %>
            <%= Html.CancelButton() %>
        </div>
    <% Html.EndForm(); %>
</div>
