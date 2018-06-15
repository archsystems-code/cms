<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlockPreview.aspx.cs" Inherits="ASI.Web.Views.Blocks.BlockPreview" %>

<link href="http://arcelormittal.adagetechnologies.com/stylesheets/screen.css" rel="stylesheet" media="screen" />

<form id="Form1" runat="server">
<EPiServer:Property ID="FullWidthPreviewProperty" runat="server">
    <RenderSettings EnableEditFeaturesForChildren="true" />
</EPiServer:Property>
</form>
