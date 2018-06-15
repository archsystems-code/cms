<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SampleOutOfStockModal.ascx.cs" Inherits="ASI.Web.Views.Controls.SampleOutOfStockModal" %>
<asp:Button ID="ButtonDummy2" runat="server" Text="Button" Style="display: none" />


    <asp:Panel ID="PanelModalOOS" runat="server" CssClass="modalRecommend outOfStock">
        <div class="modal modalWrap sampleCheckout">
                    <h2><asp:Literal ID="outOfStockTitle" runat="server" /></h2>
            <asp:Literal ID="outOfStockMessage" runat="server" />

            <a href="#" class="close">x</a> 
            <asp:LinkButton ID="Button2" runat="server" Text="Continue" CssClass="submit noThanks"
                Style="display: none" />
            
        </div>
        <div class="modalOverlay">
            </div>


        
    </asp:Panel>
