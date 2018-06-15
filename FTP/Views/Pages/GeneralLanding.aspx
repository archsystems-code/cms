<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/interior.Master" AutoEventWireup="true" CodeBehind="GeneralLanding.aspx.cs" Inherits="ASI.Web.Views.Pages.GeneralLanding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<div class="generalTemplate">

		<AdageEpiLibrary:HeadingH1Property ID="HeadingH1Property1" runat="server" CustomTagName="h1" PropertyName="Heading" />
		<div class="topCallout">
			<EPiServer:Property ID="Property2" runat="server" CustomTagName="h2" PropertyName="MainHeader" />
			<EPiServer:Property ID="Property1" runat="server" PropertyName="MainBody" />
		</div>
		<EPiServer:Property ID="Property3" runat="server" CustomTagName="h2" CssClass="headerBar" PropertyName="MainHeader" />
		<div class="materialGrid">
			<ul>
				<li>
					<div class="imgWrapper">
						<img src="http://www.archsystems.com/uploadedImages/Products/ASI_Decorative_Surfaces/Designer_Laminates/DSKEX027_250.jpg" />
					</div>
					<div class="contentWrapper">
						<a href="#">Designer Laminate Collection</a>
						<p>
							Designer inspired, eco-friendly laminates
						</p>
						<p>
							Starting at:<br />
							$2.46/sq.ft.
						</p>
					</div>
				</li>

				<li>
					<div class="imgWrapper">
						<img src="http://www.archsystems.com/uploadedImages/Products/ASI_Decorative_Surfaces/Designer_Laminates/DSKEX027_250.jpg" />
					</div>
					<div class="contentWrapper">
						<a href="#">Designer Laminate Collection</a>
						<p>
							Designer inspired, eco-friendly laminates
						</p>
						<p>
							Starting at:<br />
							$2.46/sq.ft.
						</p>
					</div>
				</li>
				<li>
					<div class="imgWrapper">
						<img src="http://www.archsystems.com/uploadedImages/Products/ASI_Decorative_Surfaces/Designer_Laminates/DSKEX027_250.jpg" />
					</div>
					<div class="contentWrapper">
						<a href="#">Designer Laminate Collection</a>
						<p>
							Designer inspired, eco-friendly laminates
						</p>
						<p>
							Starting at:<br />
							$2.46/sq.ft.
						</p>
					</div>
				</li>
				<li>
					<div class="imgWrapper">
						<img src="http://www.archsystems.com/uploadedImages/Products/ASI_Decorative_Surfaces/Designer_Laminates/DSKEX027_250.jpg" />
					</div>
					<div class="contentWrapper">
						<a href="#">Designer Laminate Collection</a>
						<p>
							Designer inspired, eco-friendly laminates
						</p>
						<p>
							Starting at:<br />
							$2.46/sq.ft.
						</p>
					</div>
				</li>
			</ul>
		</div>
		<EPiServer:Property ID="Property4" runat="server" CssClass="headerBar" CustomTagName="h2" PropertyName="AdditionalInfoHeader" />
		<EPiServer:Property ID="Property5" runat="server" CssClass="productGrid" PropertyName="AdditionalInfo" />
	</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
