<%@ Page Language="C#" AutoEventWireup="true" Inherits="Templates_PDFFooter" Codebehind="PDFFooter.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="pdf.css" type="text/css" runat="server" id="ASICSS" />
	    <link rel="stylesheet" id="StyleSheet" runat="server" href="pdfstyles.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Image runat="server" ID="imgLogo" style="height: 40px" />
        <div id="pdf" style="text-align: center">
            <table style="width: 80%; text-align: center">
                <tr>
                    <td>
                        Tel: 212.206.1730
                    </td>
                    <td>
                        Fax: 212.206.1736
                    </td>
                    <td>
                        sales@archsystems.com
                    </td>
                    <td>
                        <b>www.archsystems.com</b>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
