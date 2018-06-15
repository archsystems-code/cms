<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="ASI.Web.Views.Pages.Testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	
	<div class="mainContent borderless testimonials">
		<div class="welcome">
			<div class="rotator">
				<h2>
					<EPiServer:Property ID="pageheader" PropertyName="PageHeader" runat="server" />
				</h2>
				<div class="navi">
				</div>
				<!--<EPiServer:Property ID="featuredprojectitems" PropertyName="FeaturedProjectItems" runat="server" />-->
				<div class="slideshow">

					<asp:Repeater runat="server" ID="rptProjectsList">
						<ItemTemplate>
							<div class="slide">
								<div class="image">
									<a href="<%# Eval("PageUrl") %>">
										<img src=<%# Eval("AnImageUrl") %> alt="" />
									</a>
								</div>
								<div class="text">
									<h4>
										<a href="<%# Eval("PageUrl") %>"><%# Eval("Name") %></a>
										<p><a href="<%# Eval("PageUrl") %>"><%# Eval("Location") %></a></p>
									</h4>
									<h5><%# Eval("FullAandDFirmName") %></h5>
									<%# Eval("TestimonialBlurb") %>
									<a href="<%# Eval("PageUrl") %>" class="btn">Continue Reading &raquo;</a>
								</div>
							</div>
						</ItemTemplate>
					</asp:Repeater>

				</div>
			</div>
			<div class="clientList">
				<EPiServer:Property ID="clientlistheader" PropertyName="ClientListHeader" CustomTagName="h2" runat="server" />
				<EPiServer:Property runat="server" PropertyName="ClientList" CustomTagName="div" />
					</div>
					</div>

		<div class="list">
			<div class="title">
				<h2>Designers Share Their Vision</h2>
				<div class="nav">
					<a href="#" class="previousTestimonial">&laquo; Previous</a>
					<span>|</span>
					<a href="#" class="nextTestimonial">Next &raquo;</a>
				</div>
			</div>
			<asp:Repeater runat="server" ClientIDMode="Static" ID="rptTestimonials">
				<ItemTemplate>
					<div class="wrap">
						<div class="image">
							<a href='<%# Eval("NavigateUrl") %>' >
								<img src='<%# Eval("ImageURL") %>' />
							</a>
						</div>
						<div class="text">
							<h4><%# Eval("Name") %></h4>
							<h4><%# Eval("Location") %></h4>
							<h5><%# Eval("FullAandDFirmName") %></h5>
							<%# Eval("TestimonialBlurb") %> 
							<p><a href='<%# Eval("NavigateUrl") %>' >Continue Reading &raquo;</a></p>
						</div>
					</div>
				</ItemTemplate>
			</asp:Repeater>
			<div class="title">
				<div class="nav">
					<a href="#" class="previousTestimonial">&laquo; Previous</a>
					<span>|</span>
					<a href="#" class="nextTestimonial">Next &raquo;</a>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
	<script src="/js/lib/underscore.js"></script>
	<script src="/js/lib/jquery.pager.js"></script>
	<script>
		$('.list').page({
			innerItemTag: "div[class='wrap']",
			pageSize: 6,
			useNextPrev: true
		});
	</script>
</asp:Content>
