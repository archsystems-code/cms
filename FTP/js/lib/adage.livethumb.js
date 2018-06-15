//
// Adage liveThumb
//

function onYouTubePlayerReady(playerId) {
    jQuery.noData = {};
    
    console.log(playerId);

    var playerSelector = '#yt-' + playerId;
    var liveThumbSelector = '#lt-' + playerId;

    var player = $(playerSelector)[0];                                            // Set player
    var seekTime = $(liveThumbSelector).attr('data-seek-seconds');
    console.log(seekTime);

    player.setVolume(50);                                                  // Default Volume
    player.mute();                                                         // Don't blow up ears
    player.pauseVideo();                                                   // Just incase
    player.seekTo(seekTime);                                               // Move to key frame
    player.pauseVideo();                                                   // Make sure its still stopped
}

(function ($) {

    $.fn.extend({

        liveThumb: function () {

            return this.each(function () {
                jQuery.noData = {};

                // Random Number plz
                var randy = Math.floor(Math.random() * 1000000);
                $(this).attr('data-livethumb-id', randy);

                var liveThumbID = 'lt-' + randy;
                $(this).attr('id',liveThumbID);

                // Get Video ID
                var rootURL = "http://www.youtube.com/watch?v=";

                // Video ID                
                var rawURL = $(this).html();
                var videoID = rawURL.replace(rootURL, '');
                $(this).html('');

                // Calculate Seek Time
                var timeString = $(this).attr('data-seek');
                var timeArray = timeString.split(':');
                var minutes = parseInt(timeArray[0]);
                var seconds = parseInt(timeArray[1]);
                var seekTime = (60 * minutes) + seconds;
                $(this).attr('data-seek-seconds',seekTime);

                // Put together the target's id 
                var playerDivID = 'yt-' + randy;
                $(this).prepend('<div id="' + playerDivID + '"></div>');

                // Load Player via Google SWFObject
                var params = { allowScriptAccess: "always", wmode: "opaque" };
                var atts = { id: playerDivID };

                swfobject.switchOffAutoHideShow();

                swfobject.embedSWF(
                    "http://www.youtube.com/v/" + videoID + "?enablejsapi=1&playerapiid=" + randy + "&version=3&rel=0&showsearch=0&showinfo=0&controls=0",
                    playerDivID,                                 // target div
                    $(this).width(),                            // width
                    Math.floor($(this).width() * (9 / 16)),     // height (proportional to 16:9)
                    "9",                                        // swf version #
                    null,                                       // unused flash var
                    null,                                       // unused flash var
                    params,                                     // allow js and ie 7 fix for positioning
                    atts                                        // identifier
                );

            });
        }
    });

})(jQuery);