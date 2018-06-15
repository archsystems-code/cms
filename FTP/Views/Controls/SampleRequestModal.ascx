<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SampleRequestModal.ascx.cs" Inherits="ASI.Web.Views.Controls.SampleRequestModal" %>
<%@ Register Src="~/Views/Controls/SampleRequests.ascx" TagName="SampleRequests" TagPrefix="uc" %>



<asp:Button ID="ButtonDummy" runat="server" Text="Button" Style="display: none" />


<ajax:ModalPopupExtender ID="ModalExtender" TargetControlID="ButtonDummy" PopupControlID="PanelModal"
        runat="server" OkControlID="Button2" BehaviorID="Modal">
    </ajax:ModalPopupExtender>
    <asp:Panel ID="PanelModal" runat="server" CssClass="modalRecommend">
        <div class="modal modalWrap sampleCheckout">
            <asp:MultiView runat="server" ID="mvSampleRequest" ActiveViewIndex="0">
                <asp:View runat="server">
                    <uc:SampleRequests ID="sampleRequests" runat="server" /> 
                </asp:View>
                <asp:View runat="server">
                    <h2>
                        Your Requested Samples</h2>
                    <div id="dialogThreeSamples" title="Maximum Samples">
                        <p>
                            You can only request a maximum of 3 samples
                        </p>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text="Continue Shopping" CssClass="continueShop btn"
                            OnClientClick="$('.modalRecommend, .modalSamples, #Modal_backgroundElement').hide(); return false;" />
                        <asp:HyperLink ID="hlCheckout" runat="server" 
                            CssClass="btn">Check Out Samples</asp:HyperLink>
                    </div>
                </asp:View>
                <asp:View runat="server">
                    <h2>
                        Log In Required</h2>
                     <div>
                        <p>You must log in to request samples.
                        <br />
                        <asp:Hyperlink runat="server" ID="hlSampleLogin" EnableViewState="false">
                            Click Here to Register or Log In
                        </asp:Hyperlink>
                        </p>
                        <asp:LinkButton ID="LinkButton2" runat="server" Text="Continue Shopping" CssClass="continueShop btn"
                            OnClientClick="$('.modalRecommend, .modalSamples, #Modal_backgroundElement').hide(); return false;" />
                    </div>
                </asp:View>
            </asp:MultiView>

            <a href="#" class="close">x</a> 
            <asp:LinkButton ID="Button2" runat="server" Text="Continue" CssClass="submit noThanks"
                Style="display: none" />
            
        </div>
        <div class="modalOverlay">
            </div>


        
    </asp:Panel>
