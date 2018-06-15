<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="CEURegistration.aspx.cs" Inherits="ASI.Web.Views.Pages.CEU.CEURegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContent borderless">
        <EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h2" CssClass="grayTitleBar" />
        <EPiServer:Property runat="server" PropertyName="MainBody" />
        <asp:Panel runat="server" ID="pnlNotRegistered">
            <asp:Panel runat="server" ID="pnlNotRegisteredInfo" class="validation">
                <strong>This is what the user will see when they are not registered.</strong>
            </asp:Panel>
            <EPiServer:Property runat="server" PropertyName="RegisterTitleText" CustomTagName="h3" />
            <asp:ValidationSummary ID="ValidationSummary1" CssClass="validation" runat="server"
                ValidationGroup="AIA" DisplayMode="BulletList" EnableClientScript="true" ShowMessageBox="false"
                Visible="true" ShowSummary="true" />

            <div class="unregisteredBox">
                <div class="leftContainer">
                    * AIA Member Number:<br />
                    (Required for AIA Members)
                </div>
                <div class="middleContainer">
                    <asp:TextBox runat="server" ID="tbAIANumber" />
                </div>
                <div class="rightContainer">
                    Click Here to Request a Certificate of Completion
                    <asp:CheckBox ID="cbRequestCert" runat="server" />
                </div>
            </div>
            <div class="unregisteredBoxFooter">
                <asp:LinkButton ID="lbSubmit" runat="server" CssClass="btn">
                        <EPiServer:Property runat="server" PropertyName="SubmitButtonText" />
                </asp:LinkButton>
                <EPiServer:Property runat="server" PropertyName="PaypalRedirectText" />
            </div>
            <br />
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlAlreadyRegistered">
            <asp:Panel runat="server" ID="pnlAlreadyRegisteredInfo" class="validation">
                <strong>This is what the user will see when they are already registered.</strong>
            </asp:Panel>
            <br />
            <EPiServer:Property runat="server" PropertyName="AlreadyRegisteredText" />
            <EPiServer:Property runat="server" PropertyName="ViewCourseButton" CssClass="btn" />
        </asp:Panel>

        <div align="center">
            <EPiServer:Property runat="server" PropertyName="FooterContent" />
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script>
        ValidatorCommonOnSubmit = function () {
            $('.error').removeClass('error');
            var i;
            var pageValid = true;
            for (i = 0; i < Page_Validators.length; i++) {
                if (!Page_Validators[i].isvalid) {
                    $('#' + Page_Validators[i].controltovalidate).addClass('error');
                    pageValid = false;
                }
            }
            return pageValid;
        }
    </script>
</asp:Content>
