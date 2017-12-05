<%@ Page Language="c#" MasterPageFile="~/Views/MasterPages/interior.Master" Inherits="ASI.Web.Views.Pages.Search" CodeBehind="Search.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Search results for '<span id="searchtext"></span>'</h1>
    <p>Please Note: If the product or collection you are searching for is not listed, please contact <a href="mailto:sales@archsystems.com">sales@archsystems.com</a> for samples and availability.</p><br />
<div id="results" class="searchResults">Loading ...</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script src="//www.google.com/jsapi" type="text/javascript"></script>
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
        google.load('search', '1', { language: 'en', style: google.loader.themes.MINIMALIST });
        function onLoad() {
            var customSearchControl = new google.search.CustomSearchControl('<%= GoogleSiteSearchAccount  %>');
        var drawOptions = new google.search.DrawOptions();
        drawOptions.setAutoComplete(false);
        drawOptions.setDrawMode(google.search.SearchControl.DRAW_MODE_LINEAR);
        customSearchControl.draw('results', drawOptions);
        customSearchControl.setSearchStartingCallback(this, function (control, searcher, query) {
            $('.search_input').val(query);
            $('#searchtext').text(query);
        });
        customSearchControl.setLinkTarget(GSearch.LINK_TARGET_SELF);
        customSearchControl.execute(getQueryString('q'));
    }
    google.setOnLoadCallback(onLoad);
</script>
</asp:Content>