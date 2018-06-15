<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Summary>"%>
<%@ Import Namespace="EPiServer.Business.Commerce.UI.Models.Overview"%>
<%@ Import Namespace="System.Web.Mvc" %>
<%@ Import Namespace="EPiServer.Cms.Shell"%>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html"%>
<div id="overviewgadget" class="db-panel-outer">
    <%= Html.AutoUpdate((int)ViewData["RefreshInterval"] * 1000, "Index")%>
    <div class="db-panel">
        <div class="summary-row">
            <div class="summary-item">
                <div class="body">
                    <div class="stat">
                        <div class="image">
                            <img src='<%= EPiServer.Shell.Paths.ToClientResource("Commerce", "ClientResources/Overview/Bundle.gif") %>' id="Image1">
                        </div>
                        <div class="name">
                            <%= Html.Translate("/Commerce/Gadget/OverviewGadget/Products")%>:
                        </div>
                        <div class="value" runat="server" id="EntriesCount"><%= Html.Encode(Model.EntriesCount) %></div>
                    </div>
                </div>
            </div>
            <div class="summary-item">
                <div class="body">
                    <div class="stat">
                        <div class="image">
                            <img src='<%= EPiServer.Shell.Paths.ToClientResource("Commerce", "ClientResources/Overview/node.gif") %>'  id="Image2">
                        </div>
                        <div class="name">
                            <%= Html.Translate("/Commerce/Gadget/OverviewGadget/Categories")%>:
                        </div>
                        <div class="value" runat="server" id="NodesCount"><%= Html.Encode(Model.NodesCount) %></div>
                    </div>
                </div>
            </div>
            <div class="summary-item">
                <div class="body">
                    <div class="stat">
                        <div class="image">
                            <img src='<%= EPiServer.Shell.Paths.ToClientResource("Commerce", "ClientResources/Overview/orders.png") %>'  id="Image3">
                        </div>
                        <div class="name">
                            <%= Html.Translate("/Commerce/Gadget/OverviewGadget/Orders")%>:
                        </div>
                        <div class="value" runat="server" id="OrdersCount"><%= Html.Encode(Model.OrdersCount) %></div>
                    </div>
                </div>
            </div>
            <div class="summary-item">
                <div class="body">
                    <div class="stat">
                        <div class="image">
                            <img src= '<%= EPiServer.Shell.Paths.ToClientResource("Commerce", "ClientResources/Overview/customers.png") %>'  id="Image4">
                        </div>
                        <div class="name">
                            <%= Html.Translate("/Commerce/Gadget/OverviewGadget/Customers")%>:
                        </div>
                        <div class="value" runat="server" id="CustomerCount"><%= Html.Encode(Model.CustomerCount) %></div>
                    </div>
                </div>
            </div>
            <div class="summary-item">
                <div class="body">
                    <div class="stat">
                        <div class="image">
                            <img src='<%= EPiServer.Shell.Paths.ToClientResource("Commerce", "ClientResources/Overview/promotions.png") %>' id="Image5">
                        </div>
                        <div class="name">
                            <%= Html.Translate("/Commerce/Gadget/OverviewGadget/Promotions")%>:
                        </div>
                        <div class="value" runat="server" id="PromotionCount"><%= Html.Encode(Model.PromotionCount) %></div>
                    </div>
                </div>
            </div>                
            
        </div>
    </div>
</div>