<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlipbookAccessPage.aspx.cs" Inherits="ASI.Web.Flipbook.FlipbookAccessPage" %>


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title></title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="shortcut icon" href="favicon.ico" />
        <link rel="icon" href="favicon.ico" />
        <link href="//vjs.zencdn.net/4.11/video-js.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />

        <link rel="stylesheet" href="/stylesheets/liteAccordion.css" />
        <link href="/stylesheets/main.css" rel="stylesheet" />
        <link href="/stylesheets/sales-portal.css" rel="stylesheet" />

        <%-- jQuery / UI: Served from CDN with local fallback. Be sure to update jquery.local if you update CDN versions. --%>
            <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/base/jquery-ui.css" type="text/css" media="all"
            />
            <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
            <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
            <script>
                window.jQuery || document.write('<script src="js/lib/jquery.js"><\/script>')
            </script>
            <script src="/js/liteaccordion.jquery.js"></script>
            <script src="/js/lib/modernizr.js"></script>
            <script src="/js/jquery.cycle.all.js"></script>
            <script src="/js/custom.js"></script>

            <%-- Library for Full Selectivizir Support --%>
                <script src="//s3.amazonaws.com/nwapi/nwmatcher/nwmatcher-1.2.5-min.js"></script>
                <!--[if (gte IE 6)&(lte IE 8)]><script src="/js/lib/selectivizr-min.js"></script></script><![endif]-->


                <script type="text/javascript">
                    var _gaq = _gaq || [];
                    _gaq.push(['_setAccount', 'UA-16987124-1']);
                    (function () {
                        var ga = document.createElement('script');
                        ga.type = 'text/javascript';
                        ga.async = true;
                        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                        var s = document.getElementsByTagName('script')[0];
                        s.parentNode.insertBefore(ga, s);
                    })();
                    _gaq.push(['_trackPageview']);
                </script>
                <script type="text/javascript">
                    piAId = '68312';
                    piCId = '1768';

                    (function () {
                        function async_load() {
                            var s = document.createElement('script'); s.type = 'text/javascript';
                            s.src = ('https:' == document.location.protocol ? 'https://pi' : 'http://cdn') + '.pardot.com/pd.js';
                            var c = document.getElementsByTagName('script')[0]; c.parentNode.insertBefore(s, c);
                        }
                        if (window.attachEvent) { window.attachEvent('onload', async_load); }
                        else { window.addEventListener('load', async_load, false); }
                    })();
                </script>
    </head>

    <body>
        <form id="form1" runat="server">
            <div>
                <asp:Panel runat="server" ID="pnlMainWrapper" CssClass="mainWrapper flipbook-wrapper">
                    <header class="flipbook-header">
                        <a href="/">
                        <EPiServer:Property ID="masterLogo" runat="server" PropertyName="Logo" PageLink='<%# EPiServer.Core.PageReference.StartPage %>' />
                    </a>
                    </header>

                    <div class="mainContent">

                        <div class="formsWrapper">
                            <div class="flipbook-img">
                                <img src="/imgs/Flip.jpg" style="margin-top: 15px;" />
                            </div>

                            <asp:Panel ID="ModalAll" runat="server" CssClass="modalRecommend" Visible="true">
                                <div class="modal modalWrap flipbook-modal">
                                    <asp:Panel runat="server" ID="pnlReturnCustomer" CssClass="" Visible="true">

                                        <h4 class="flipbook-modal-header">Step 1: Login to archsystems.com</h4>
                                        <div class="form-field">
                                            <label>Email Address:</label>
                                            <asp:TextBox runat="server" ID="loginEmail" />
                                        </div>
                                        <div class="form-field">
                                            <label>Password:</label>
                                            <asp:TextBox runat="server" ID="loginPassword" TextMode="Password" />
                                        </div>

                                        <p class="loginerrormessage">
                                            <label style="color: red; font-size: 12px;">Please fill out all required fields.</label>
                                        </p>
                                        <asp:Literal runat="server" ID="FailureText" />
                                        <div class="form-field form-field-submit flipbook-modal-submit">
                                            <div class="flipbook-modal-newaccount">
                                                <p>
                                                    New to ASI?
                                                    <asp:LinkButton ID="LinkButtonNew" runat="server">Create an Account</asp:LinkButton>
                                                </p>
                                            </div>
                                            <asp:Button runat="server" ID="btnLogin" CssClass="btn" Text="Submit" OnClientClick="return logInValidation();" OnClick="btnLogin_Click"></asp:Button>
                                            <%--<a href="/Forgot-Password" class="forgot">Forgot your password?</a>--%>
                                        </div>

                                    </asp:Panel>
                                    <asp:Panel runat="server" ID="pnlNewCustomer" CssClass="" Visible="false">
                                        <%--     <h2>For new customers</h2>--%>
                                            <%--                                    <EPiServer:Property ID="Property3" runat="server" PropertyName="NewCustomerIntroText" />--%>
                                                <h4 class="flipbook-modal-header">For new customers</h4>
                                                <div class="form-field">
                                                    <label>First Name:</label>
                                                    <asp:TextBox runat="server" ID="FirstName" ClientIDMode="Static"></asp:TextBox>
                                                </div>
                                                <div class="form-field">
                                                    <label>Last Name:</label>
                                                    <asp:TextBox runat="server" ID="LastName" ClientIDMode="Static"></asp:TextBox>
                                                </div>
                                                <div class="form-field">
                                                    <label>Company:</label>
                                                    <asp:TextBox runat="server" ID="CompanyName" ClientIDMode="Static"></asp:TextBox>
                                                </div>

                                                <div class="form-field">
                                                    <label>Title:</label>
                                                    <asp:TextBox runat="server" ID="Title" ClientIDMode="Static"></asp:TextBox>
                                                </div>
                                                <div class="form-field">
                                                    <label>Phone:</label>
                                                    <asp:TextBox runat="server" ID="Phone" ClientIDMode="Static"></asp:TextBox>
                                                </div>
                                                <div class="form-field">
                                                    <label>Email:</label>
                                                    <asp:TextBox runat="server" ID="Email" ClientIDMode="Static"></asp:TextBox>
                                                </div>
                                                <div class="form-field">
                                                    <label>Password:</label>
                                                    <asp:TextBox ID="tbxPassword" runat="server" TextMode="Password" />
                                                </div>
                                                <div class="form-field">
                                                    <label>Confirm Password:</label>
                                                    <asp:TextBox ID="tbxConfirmPassword" runat="server" TextMode="Password" />
                                                </div>
                                                <p class="registererrormessage">
                                                    <label style="color: red; font-size: 12px;">Please fill out all required fields.</label>
                                                </p>
                                                <div class="form-field">
                                                    <p class="registerpassworderrormessage">
                                                        <label style="color: red; font-size: 12px;">Password is not matching.</label>
                                                    </p>
                                                </div>
                                                <div class="form-field form-field-submit">
                                                    <asp:Button runat="server" ID="btnRegister" CssClass="btn" Text="Register" OnClientClick="return registerValidation();" OnClick="btnRegister_Click"></asp:Button>
                                                </div>
                                    </asp:Panel>
                                    <asp:Panel ID="ModalRedirectWarning" runat="server" Visible="false">
                                        <h4 class="flipbook-modal-header">Step 2: Access Code Required</h4>
                                        <div>
                                            <%= CurrentPage.RedirectWarningText %>
                                        </div>
                                        <a href="<%= CurrentPage.CatalogURL %>" class="btn">
                                            <%= CurrentPage.RedirectButtonText %>
                                        </a>
                                        <%--    <a href="#" class="close">x</a>--%>
                                    </asp:Panel>
                                </div>
                                <div class="modalOverlay"></div>
                            </asp:Panel>


                        </div>

                    </div>

                </asp:Panel>
                <script>
                    $(document).ready(function () {
                        $('.loginerrormessage').hide();
                        $('.registererrormessage').hide();
                        $('.registerpassworderrormessage').hide();

                    });

                    function isValidEmailAddress(emailAddress) {
                        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
                        return pattern.test(emailAddress);
                    };

                    function logInValidation() {
                        $('.loginerrormessage').hide();

                        var loginEmail = $('#loginEmail').val();
                        var loginPassword = $('#loginPassword').val();
                        if (loginEmail == '' || loginPassword == '' || !isValidEmailAddress(loginEmail)) {
                            $('.loginerrormessage').show();
                            return false;
                        }
                        return true;
                    }

                    function registerValidation() {
                        $('.registererrormessage').hide();
                        $('.registerpassworderrormessage').hide();

                        var firstName = $('#FirstName').val();
                        var lastName = $('#LastName').val();
                        var company = $('#CompanyName').val();
                        var title = $('#Title').val();
                        var phone = $('#Phone').val();
                        var email = $('#Email').val();
                        var password = $('#tbxPassword').val();
                        var tbxConfirmPassword = $('#tbxConfirmPassword').val();

                        if (firstName == '' || lastName == '' || company == '' || title == '' || email == '' || phone == '' || password == '' || tbxConfirmPassword == '' || !isValidEmailAddress(email)) {
                            $('.registererrormessage').show();
                            return false;
                        }
                        if (password != tbxConfirmPassword) {
                            $('.registerpassworderrormessage').show();
                            return false;
                        }
                        return true;
                    }
                </script>
                <!-- begin olark code -->
                <script type="text/javascript" async> ;(function(o,l,a,r,k,y){if(o.olark)return; r="script";y=l.createElement(r);r=l.getElementsByTagName(r)[0]; y.async=1;y.src="//"+a;r.parentNode.insertBefore(y,r); y=o.olark=function(){k.s.push(arguments);k.t.push(+new Date)}; y.extend=function(i,j){y("extend",i,j)}; y.identify=function(i){y("identify",k.i=i)}; y.configure=function(i,j){y("configure",i,j);k.c[i]=j}; k=y._={s:[],t:[+new Date],c:{},l:a}; })(window,document,"static.olark.com/jsclient/loader.js");
                /* custom configuration goes here (www.olark.com/documentation) */
                olark.identify('7635-468-10-3405');</script>
                <!-- end olark code -->

                <iframe id="ifrmPardotFormHandler" height="1" width="1" runat="server" visible="false" />
                <div style="display: none">
                    <asp:Panel runat="server" ID="pnlAccessCode" CssClass="requestThirds" Visible="false">
                        <h2>Access Code</h2>
                        <ul>
                            <li>
                                <asp:Literal runat="server" ID="ltAccessCodeError" Text="Access code is invalid. Please try again." Visible="false" />
                            </li>
                            <li>
                                <label>Access Code:</label>
                                <asp:TextBox runat="server" ID="tbxAccessCode" />
                            </li>
                            <li class="submit">
                                <asp:Button runat="server" ID="btnSubmitAccessCode" CssClass="btn" Text="Submit" OnClick="btnSubmitAccessCode_Click"></asp:Button>
                            </li>
                        </ul>
                    </asp:Panel>
                </div>
            </div>
        </form>
    </body>

    </html>