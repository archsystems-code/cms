<%@ Page Title="" Language="C#" MasterPageFile="~/Views/MasterPages/MasterPage.Master" AutoEventWireup="true" CodeBehind="CEUVideo.aspx.cs" Inherits="ASI.Web.Views.Pages.CEU.CEUVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mainContent borderless">
        <EPiServer:Property runat="server" PropertyName="Heading" CustomTagName="h1" CssClass="grayTitleBar" />
        <div class="ceuVideo">
            <video width="640" height="498" controls preload="auto" id="ceuVideo" class="video-js vjs-default-skin vjs-big-play-centered" src="<%= VideoUrl %>" data-setup='{}'>
                <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
            </video>
            <div class="ceuVideoRightCol">
                <EPiServer:Property runat="server" PropertyName="MainBody" />
                <EPiServer:Property runat="server" PropertyName="TakeTestButton" CssClass="takeTestButton" />
            </div>
        </div>
        <div class="videoFooter">
            <EPiServer:Property runat="server" PropertyName="FooterContent" />
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="scripts" runat="server">
    <script>
        var isEditMode = <%= IsEditMode %>;
        var timeOut = <%= ShowButtonTimeout %>;
        var hasViewed = <%= HasViewedVideo %>;

            
        if(!isEditMode){
            if(hasViewed){
                showLink();
            }
            else{
                $('.takeTestLink').hide();

                $('#ceuVideo').bind('play', function (e){
                    setTimeout('showLink()', timeOut);
                });
            }
        }


        function showLink() {
            $('.takeTestInstructionMsg').hide();
            $('.takeTestLink').show();
        }
    </script>
</asp:Content>
