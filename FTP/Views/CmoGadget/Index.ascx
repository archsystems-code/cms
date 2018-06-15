<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ViewData>" %>
<%@ Import Namespace="EPiServer.Cms.Shell"%>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html"%>
<%@ Import Namespace="EPiServer.Business.Commerce.UI.Models.CmoGadget" %>
<%@ Import Namespace="EPiServer.Core" %>
<div>
    <% Html.BeginGadgetForm("Delete"); %>
        <%= Html.AntiForgeryToken()%>
        <div class="epi-padding-small epi-overflowHidden">
            <div class="epi-clear epi-floatLeft">
                <span class="epi-button">
                    <span class="epi-button-child">
                        <%=Html.ViewLink(
                            "<input type='button' value='" + Html.Translate("/Commerce/Gadget/CMO/add") + "' class='epi-button-child-item epi-button-gadget-small' />", 
                            Html.Translate("/Commerce/Gadget/CMO/addmonitor"), "Add", null) %>
                    </span>
                </span>
                <span class="epi-button">
                    <span class="epi-button-child">
                        <input class="epi-button-child-item epi-button-gadget-small" disabled="disabled" onclick="javascript: return confirm('<%= Html.Translate("/Commerce/Gadget/CMO/confirmdelete") %>')" type="submit" value="<%= Html.Translate("/Commerce/Gadget/CMO/delete") %>" name="Delete" title="<%= Html.Translate("/Commerce/Gadget/CMO/deletemonitor") %>" />
                    </span>
                </span>
            </div>
        </div>
        <div class="epi-clear epi-width100 epi-gadget-tableWrapper">
            <table class="epi-simple epi-gadgetTable">
                <thead>
                    <tr class="epi-gadget-defaultRow">
                        <th><input type='checkbox' class = 'clsCheckboxSelectAll'/></th>
                        <th scope="col" ><%= Html.Translate("/Commerce/Gadget/CMO/type")%></th>
                        <th scope="col" ><%= Html.Translate("/Commerce/Gadget/CMO/productcategory")%></th>
                        <th scope="col"><%= Html.Translate("/Commerce/Gadget/CMO/applicationkey")%></th>
                        <th scope="col"><%= Html.Translate("/Commerce/Gadget/CMO/edit")%></th>
                    </tr>
                </thead>
                <tbody>
                <% foreach (MonitorData monitor in Model.TableRows)
                   { %>
                    <tr class="epi-gadget-defaultRow clsCMOMonitorRow">
                        <td class="epi-alignTop">
                            <%= string.Format("<input type='checkbox' class = 'clsCheckboxSelectMonitor' value='true' name='TableRows[{0}].IsSelected' />", Model.TableRows.IndexOf(monitor)) %>
						    <%= string.Format("<input type='hidden' value='false' name='TableRows[{0}].IsSelected' />", Model.TableRows.IndexOf(monitor)) %>
                            <%= string.Format("<input type='hidden' value='{0}' name='TableRows[{1}].Id' />", monitor.Id, Model.TableRows.IndexOf(monitor)) %>
                        </td>
                        <td><%= monitor.Type == CommerceMonitorType.Order ? Html.Translate("/Commerce/Gadget/CMO/productorder") : Html.Translate("/Commerce/Gadget/CMO/productview")%></td>
                        <td><%= monitor.Name%></td>
                        <td><%= monitor.ApplicationKey%></td>
                        <td>
                            <% var link = ResolveClientUrl("~/App_Themes/Default/Images/Tools/Edit.gif");  %>
                            <%=Html.ViewLink("<input type=\"image\" src=\"" + link + "\" />", Html.Translate("/Commerce/Gadget/CMO/editmonitor"), "Edit", null, null, new { monitorId = monitor.Id })%>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    <% Html.EndForm(); %>
</div>