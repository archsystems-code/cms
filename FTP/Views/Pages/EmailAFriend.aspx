<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmailAFriend.aspx.cs" Inherits="ASI.Web.Views.Pages.EmailAFriend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table tr td
        {
            padding: 10px;
        }
        .fieldlabel
        {
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div class="mainContent interior">
        <h3>
            Email a friend</h3>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" />
        <div runat="server" id="formtable" style="width: auto">
            <table>
                <tr>
                    <td class="fieldlabel">
                        &nbsp;&nbsp;Page:
                    </td>
                    <td>
                        <asp:HyperLink ID="PageLink" runat="server" Text="Label" Target="_blank"></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td class="fieldlabel">
                        <span style="color: Red">*</span>
                        Your Name:
                    </td>
                    <td>
                        <asp:TextBox ID="NameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Your Name is required"
                            ControlToValidate="NameTextBox" Display="None"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="fieldlabel">
                        <span style="color: Red">*</span>
                        Your Email:
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Your Email is required"
                            ControlToValidate="EmailTextBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ErrorMessage="A valid Email is required for Your Email "
                            ControlToValidate="EmailTextBox" ValidationExpression="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,6}$"
                            Display="None">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="fieldlabel">
                        <span style="color: Red">*</span>
                        Your Friend's Name:
                    </td>
                    <td>
                        <asp:TextBox ID="FriendsNameTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Your Friend's Name is required"
                            Display="None" ControlToValidate="FriendsNameTextBox"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="fieldlabel">
                        <span style="color: Red">*</span>
                        Your Friend's Email:
                    </td>
                    <td>
                        <asp:TextBox ID="FriendsEmailTextBox" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Your Friend's Email is required"
                            ControlToValidate="FriendsEmailTextBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="A valid Email is required Your Friend's Email"
                            ControlToValidate="FriendsEmailTextBox" ValidationExpression="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,6}$"
                            Display="None">
                        </asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top" class="fieldlabel">
                        &nbsp;&nbsp;Your message:
                    </td>
                    <td>
                        <asp:TextBox ID="MessageTextBox" CssClass="emailTextarea" runat="server" TextMode="MultiLine" Width="300px"
                            Columns="3"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top" class="fieldlabel">
                        &nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:Button ID="Send" runat="server" Text="Send Email" OnClick="Send_Click" CssClass="btn" />
                    </td>
                </tr>
            </table>
        </div>
        <div runat="server" id="postbackdiv" visible="false">
            <asp:Label ID="PostBackMessage" runat="server">Thank you for your interest in ASI. Your message has been sent.</asp:Label><br />
            <br />
            <asp:HyperLink ID="BackLink" runat="server">Back to previous page</asp:HyperLink>
        </div>
	</div>
</asp:Content>
