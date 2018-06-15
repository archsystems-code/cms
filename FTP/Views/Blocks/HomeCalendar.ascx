<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HomeCalendar.ascx.cs" Inherits="ASI.Web.Views.Blocks.HomeCalendar" %>
<div class="box">
	<h2>
		<EPiServer:Property ID="Property1" runat="server"  PropertyName="Headline" CustomTagName="span" />
	</h2>
	<EPiServer:Property ID="Property2" runat="server"  PropertyName="MainBody" />
	<EPiServer:Property ID="Property3" runat="server" CssClass="moreEvents"  PropertyName="ExtraEvents" />
	<div class="showEventsWrap"><a class="showEvents" href="#">∨</a> </div>
</div>