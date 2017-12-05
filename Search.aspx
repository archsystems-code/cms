<%@ Page Language="c#" MasterPageFile="~/Views/MasterPages/interior.Master" Inherits="ASI.Web.Views.Pages.Search" CodeBehind="Search.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search results for '<span id="searchtext"></span>'</h1>
    <p>Please Note: If the product or collection you are searching for is not listed, please contact <a href="mailto:sales@archsystems.com">sales@archsystems.com</a> for samples and availability.</p><br />
<div id="results" class="searchResults"></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
        function getQueryString(name) {
            name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
            var regexS = "[\\?&]" + name + "=([^&#]*)";
            var regex = new RegExp(regexS);
            var results = regex.exec(window.location.href);
            if (results == null)
                return "";
            else
                return decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        var myCallback = function () {
            google.search.cse.element.render({
                div: 'results',
                tag: 'searchresults-only',
                gname: 'google-results-gname'
            });
            var element = google.search.cse.element.getElement('google-results-gname');
            var query = getQueryString('q');
            element.execute(query);
            $('#searchtext').text(query);
        };
        (function() {
            var cx = '017140040529022041878:pryauxgzy1g';
            var gcse = document.createElement('script');
            gcse.type = 'text/javascript';
            gcse.async = true;
            gcse.src = 'https://cse.google.com/cse.js?cx=' + cx;
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(gcse, s);
        })();
        window.__gcse = {
            parsetags: 'explicit',
            callback: myCallback
        };
</script>
</asp:Content>