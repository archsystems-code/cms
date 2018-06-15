<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectMainBlockControl.ascx.cs" Inherits="ASI.Web.Views.Blocks.ProjectMainBlockControl" %>
<div class="box">
	<a id="SegmentUrl" runat="server" href="">
		<EPiServer:Property ID="Property2" PropertyName="ImageUrl" runat="server" />
		<asp:Label ID="PageName" runat="server"></asp:Label>
	</a>
</div>