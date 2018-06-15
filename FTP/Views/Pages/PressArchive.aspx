<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/InteriorLeftNav.master" AutoEventWireup="true" CodeBehind="PressArchive.aspx.cs" Inherits="ASI.Web.Views.Pages.PressArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="press">
        <AdageEpiLibrary:HeadingH1Property runat="server" PropertyName="Heading"  />
        <div class="accordion">
            <asp:Repeater runat="server" ID="rptYears">
                <ItemTemplate>
                    <p><a href="#"><EPiServer:Property ID="Property1" runat="server" PropertyName="PageName" /></a></p>
                    <div>
                        <asp:Repeater runat="server" ID="rptEntries">
                            <HeaderTemplate>
                                <ul>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li>
						            <a href='<%# Eval("PressItemFile") %>' target="_blank">
                                        <EPiServer:Property runat="server" PropertyName="PageName" />
                                    </a>
						            <EPiServer:Property ID="Property2" runat="server" PropertyName="PressItemDescription" />
									<small>
										<a href='<%# Eval("TearsheetFile") %>'>
											&raquo; View Tearsheet
										</a>
									</small>
					            </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
