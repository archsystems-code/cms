using ASI.Abstractions.Interfaces.Objects.Quiz.Questions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASI.Web.Views.Controls.Quiz
{
    public partial class QuizQuestion : System.Web.UI.UserControl
    {
        #region Constants
        private const string INCORRECT_ANSWER_CSS_COLOR = "red";
        private const string CORRECT_ANSWER_CSS_COLOR = "black";
        #endregion

        #region Public Properties

        /// <summary>
        /// The question which will be loaded into the UI for this control
        /// </summary>
        public IQuizQuestion Question { get; set; }
        
        public string SubmittedAnswer
        {
            get
            {
                return rblOptions.SelectedValue;
            }
        }

        #endregion 

        private string CorrectAnswer
        {
            get
            {
                return ViewState["CorrectAnswer"] as string;
            }
            set
            {
                ViewState["CorrectAnswer"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Question != null && !Page.IsPostBack)
            {
                CorrectAnswer = Question.CorrectAnswer;
                BindUI();
            }
            else
            {
                SetErrorState();
            }
        }

        private void BindUI()
        {
            spnQuestion.InnerText = Question.Question;

            // If client ever utilizes multiple question types, may want to swap this to be seperate controls
            if(Question is IMultipleChoiceQuizQuestion)
            {
                BindAnswerOptions(Question as IMultipleChoiceQuizQuestion);
            }
        }

        private void BindAnswerOptions(IMultipleChoiceQuizQuestion mcQuestion)
        {
            rblOptions.Visible = true;
            List<ListItem> items = new List<ListItem>();

            // Implementation paradigm:  Answer values will be alphabetical, starting with 'A'.
            char answerValue = 'A';
            foreach(string option in mcQuestion.AnswerOptions)
            {
                rblOptions.Items.Add(new ListItem { Text = option, Value = answerValue.ToString() });
                answerValue++;
            }
        }

        private void SetErrorState()
        {
            if(CorrectAnswer != rblOptions.SelectedValue)
            {
                spnQuestion.Attributes.CssStyle["color"] = INCORRECT_ANSWER_CSS_COLOR;
            }
            else
            {
                spnQuestion.Attributes.CssStyle["color"] = CORRECT_ANSWER_CSS_COLOR;
            }
        }
    }
}