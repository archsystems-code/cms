<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeadlineBodyBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.HeadlineBodyBlockControl" %>

<h2>
	<EPiServer:Property runat="server"  PropertyName="Headline" CustomTagName="span" />
</h2>
<EPiServer:Property runat="server" PropertyName="MainBody" />