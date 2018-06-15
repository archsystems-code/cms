<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<EPiServer.Business.Commerce.UI.Models.OrderGadget.Settings>" %>

<%= Html.AutoUpdate(1000 * Model.UpdateInterval, "Index")%>
<div class="epiOrderGadget"></div>