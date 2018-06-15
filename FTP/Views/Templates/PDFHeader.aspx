<%@ Page Language="C#" AutoEventWireup="true" Inherits="Templates_PDFHeader" Codebehind="PDFHeader.aspx.cs" %>

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
            <div style="width: 100%; height: 75px; vertical-align: middle" id="header" class="brandbackground">
                <h1>
                    <asp:Label ID="LabelTitle" runat="server" Text="Label"></asp:Label>
                </h1>
                <img id="BrandLogo" class="pdflogo" runat="server" src="/pagerror.gif"></img>
            </div>
        </div>
    </form>
</body>
</html>
