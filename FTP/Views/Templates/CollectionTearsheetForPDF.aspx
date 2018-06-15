<%@ Page Language="C#" AutoEventWireup="true"
    Inherits="Templates_CollectionTearsheetForPDF" CodeBehind="CollectionTearsheetForPDF.aspx.cs" %>

<%@ Register TagPrefix="EPiCommerce" Namespace="ASI.Web.Views.Controls" Assembly="ASI.Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="pdf.css" type="text/css" runat="server" id="ASICSS" />
    <link rel="stylesheet" id="StyleSheet" runat="server" href="pdfstyles.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="pdf" class="<%= SectionClass %>">
            <asp:Label ID="NewIcon" runat="server" CssClass="newicon" Text="New" />
            <asp:PlaceHolder ID="UpdatedIcon" runat="server">
                <span class="updatedicon" style="color: Red">UPDATED</span>
            </asp:PlaceHolder>
            <asp:Label ID="CollectionTextHTML" CssClass="collectionTxt" runat="server" />
            <table>
                <tr>
                    <td style="width: 65%; text-align: left;" class="products" valign="top">
                        <asp:Repeater runat="server" ID="rptDataListSKUs" OnItemDataBound="rptDataListSKUs_ItemDataBound">
                            <ItemTemplate>
                                <h2>
                                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Name") %>'></asp:Literal></h2>
                                <asp:DataList ID="DataListSKUs" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                    RepeatLayout="Table">
                                    <ItemTemplate>
                                        <div class="sku">
                                            <EPiCommerce:AssetImage runat="server" ID="AssetImage1" Entry='<%# (Container.DataItem) %>'
                                                AssetGroup="ThumbnailGroup" />
                                        </div>
                                        <div class="name">
                                            <asp:Label runat="server" CssClass="prodName" ID="displayName"></asp:Label><br />
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ID") %>' />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                    <td class="specs" valign="top">
                        <h1>Specifications</h1>
                        <asp:Label runat="server" ID="Specs"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
