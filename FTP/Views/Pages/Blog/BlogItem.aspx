<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/MasterPages/Blog.Master" AutoEventWireup="true" CodeBehind="BlogItem.aspx.cs" Inherits="ASI.Web.Views.Pages.Blog.BlogItem" %>

<%@ Register TagPrefix="uc" TagName="BlogSidebar" Src="~/Views/Controls/BlogSidebar.ascx" %>
<%@ Register TagPrefix="uc" TagName="BlogItem" Src="~/Views/Controls/BlogItem.ascx" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Sidebar" runat="server">
    <uc:BlogSidebar ID="Sidebar" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <uc:BlogItem ID="Item" runat="server" HideCommentsLink="true" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Comments" runat="server">

    <div class="comments">
        <asp:Repeater runat="server" ID="rptComments">
            <HeaderTemplate>
                <h3 id="Comments">Comments</h3>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="comment">
                    <span class="commentAuthor">
                        <asp:MultiView runat="server" ID="mvCommenterName">
                            <asp:View runat="server" ID="vwUnwrapped">
                                <EPiServer:Property runat="server" PropertyName="CommenterName" />
                            </asp:View>
                            <asp:View runat="server" ID="vwWrapped">
                                <asp:HyperLink runat="server" ID="hlCommenterName">
                                    <EPiServer:Property runat="server" PropertyName="CommenterName" />
                                </asp:HyperLink>
                            </asp:View>
                        </asp:MultiView>
                    </span>
                    <span class="commentTime">
                        <asp:Literal runat="server" ID="litPostDate" /></span>
                    <EPiServer:Property runat="server" PropertyName="Comment" />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <h3>Leave a comment</h3>
        <ul>
            <li>
                <asp:Label ID="NameLbl" AssociatedControlID="tbxName" runat="server">Name*</asp:Label>
                <asp:TextBox ID="tbxName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbxName" ErrorMessage="Enter your name." ForeColor="Red" ValidationGroup="comment" Display="Dynamic" />
            </li>
            <li>
                <asp:Label ID="EmailLbl" AssociatedControlID="tbxEmail" runat="server">Email*</asp:Label>
                <asp:TextBox ID="tbxEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbxEmail" ErrorMessage="Enter your email." ForeColor="Red" ValidationGroup="comment" Display="Dynamic" />
            </li>
            <li>
                <asp:Label ID="HomepageLbl" AssociatedControlID="tbxHomepage" runat="server">Homepage</asp:Label>
                <asp:TextBox ID="tbxHomepage" runat="server">http://</asp:TextBox>
            </li>
            <li>
                <asp:Label ID="CommentLbl" AssociatedControlID="tbxComment" runat="server">Comment</asp:Label>
                <asp:TextBox ID="tbxComment" TextMode="MultiLine" runat="server" Width="537px"></asp:TextBox>
            </li>
            <li>
                <br />
                <asp:Label runat="server" ID="lblCommentErroMessage" ForeColor="Red" Visible="false" CssClass="recaptcha-error-msg">Please enter your comment above.</asp:Label></li>
            <li class="recaptcha-container">
                <recaptcha:RecaptchaControl
                    ID="recaptcha"
                    runat="server"
                    Theme="clean"
                    PublicKey="6LeZJvsSAAAAAEiDoNufp2brCEVwK04TPZPKp6MW"
                    PrivateKey="6LeZJvsSAAAAADpO-RmanhlBOLbBnYJNkkA0lfWU"
                    ValidationGroup="comment" />
            </li>
            <li>
                <asp:Label runat="server" ID="lblRecaptchaErroMessage" ForeColor="Red" Visible="false" CssClass="recaptcha-error-msg">Please enter a valid code.</asp:Label></li>
            <li>
                <asp:Label runat="server" ID="lblSuccessMessage" ForeColor="Green" Visible="false" CssClass="recaptcha-error-msg">Comment posted. Please wait your comment get approved.</asp:Label></li>
            <li>
                <asp:LinkButton ID="lbSubmitComment" CssClass="btn" ValidationGroup="comment" runat="server">Post Comment</asp:LinkButton>
            </li>
        </ul>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
