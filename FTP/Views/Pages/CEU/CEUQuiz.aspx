<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="CEUQuiz.aspx.cs" Inherits="ASI.Web.Views.Pages.CEU.CEUQuiz" %>
<%@ Register TagPrefix="quiz" TagName="Question" Src="~/Views/Controls/Quiz/QuizQuestion.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContent borderless">
        <EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h1" CssClass="grayTitleBar"  />
        <EPiServer:Property runat="server" PropertyName="Instructions" />
        <asp:CustomValidator runat="server" ID="valScore" OnServerValidate="ScoreQuiz" CssClass="validation" Display="Dynamic" />
        <hr />
        <div class="quizHeader">
            <EPiServer:Property runat="server" PropertyName="ExamHeading" />
        </div>
        <div>
            <asp:Repeater runat="server" ID="rptQuestions" ItemType="ASI.Abstractions.Interfaces.Objects.Quiz.Questions.IQuizQuestion">
                <HeaderTemplate>
                    <ol>
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <quiz:Question runat="server" Question="<%# Item %>" ID="ctrlQuestion" />
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ol>
                </FooterTemplate>
            </asp:Repeater>
        </div>


        <EPiServer:Property runat="server" PropertyName="BackButton" CssClass="btn quizBack" />

        <EPiServer:Property runat="server" PropertyName="SubmitAnswersButton" CssClass="quizSubmit"/>


        <EPiServer:Property runat="server" PropertyName="FooterContent" CssClass="quizFooter" />

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
</asp:Content>
