<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<EPiServer.Business.Commerce.UI.Models.OrderGadget.OrderModel>" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="EPiServer.Shell.Web.Mvc.Html" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head id="Head1" runat="server">
		<title>Order gadget report</title>
        <link rel="stylesheet" href="<%= ResolveUrl("~/ClientResources/OrderGadget/OrderGadget.css") %>" type="text/css"/>
	</head>
	<body>
        <form id="Form1" runat="server">
            <script runat="server">                        
              protected void Page_Load(object sender, EventArgs e) 
              {
                  if (Model != null)
                  {
                      PerfReportViewer.LocalReport.DataSources.Add(Model.Sales.SalesSource);
                      PerfReportViewer.LocalReport.DataSources.Add(Model.Sales.SalesMonthlySource);
                      var assembly = System.Reflection.Assembly.Load("EPiServer.Business.Commerce.UI");
                      var stream = assembly.GetManifestResourceStream("EPiServer.Business.Commerce.UI.Views.OrderGadget.PerformanceReport.rdlc");
                      if (stream != null)
                      {
                          PerfReportViewer.LocalReport.LoadReportDefinition(stream);
                          PerfReportViewer.DataBind();
                      }
                  }
              }
            </script>
            <div id="salesGraphContainer">
                <asp:ScriptManager ID="scripManager" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="PerfReportViewer" runat="server" ShowDocumentMapButton="False"
                    ShowExportControls="False" ShowFindControls="False" ShowPageNavigationControls="False"
                    ShowPrintButton="False" ShowPromptAreaButton="False" ShowRefreshButton="False"
                    ShowZoomControl="False" Font-Names="Verdana" Font-Size="8pt" SizeToReportContent="True"
                    AsyncRendering="False" Width="100%" ShowToolbar="False">
                    <LocalReport />
                </rsweb:ReportViewer>
            </div>
            <div class="epiSalesTitle"><EPiServer:Translate ID="TranslateSalesTitle" Text="/Commerce/Gadget/OrderGadget/purchaseorderstitle" runat="server" /></div>
            <div id="epiPurchaseOrders">
                <div id="epiPurchaseOrdersToday"><div class="epiPurchaseOrderLabel"><EPiServer:Translate ID="TranslateSalesToday" Text="/Commerce/Gadget/OrderGadget/orderstoday" runat="server" /></div><span><%= Model.Sales.NumberOfOrdersToday %></span></div>
                <div id="epiPurchaseOrdersWeekly"><div class="epiPurchaseOrderLabel"><EPiServer:Translate ID="TranslateSalesWeekly" Text="/Commerce/Gadget/OrderGadget/ordersweekly" runat="server" /></div><span><%= Model.Sales.NumberOfOrdersThisWeek %></span></div>
                <div id="epiPurchaseOrdersMonthly"><div class="epiPurchaseOrderLabel"><EPiServer:Translate ID="TranslateSalesMonthly" Text="/Commerce/Gadget/OrderGadget/ordersmonthly" runat="server" /></div><span><%= Model.Sales.NumberOfOrdersThisMonth %></span></div>
                <div id="epiPurchaseOrdersAnnually"><div class="epiPurchaseOrderLabel"><EPiServer:Translate ID="TranslateSalesAnnually" Text="/Commerce/Gadget/OrderGadget/ordersannually" runat="server" /></div><span><%= Model.Sales.NumberOfOrdersThisYear %></span></div>
            </div>
        </form>
    </body>
</html>