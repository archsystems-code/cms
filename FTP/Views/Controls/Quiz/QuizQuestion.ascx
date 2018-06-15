<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuizQuestion.ascx.cs" Inherits="ASI.Web.Views.Controls.Quiz.QuizQuestion" %>

<div class="quizQuestion">
    <p>
        <span runat="server" id="spnQuestion" class="spnQuestion"></span>  
    </p>

    <asp:RadioButtonList runat="server" ID="rblOptions" CssClass="rblAnswers" Visible="false" />
</div>