(function ($) {

    $.fn.extend({

        ytVideoGrid: function (options) {

            var defaults = {
                user: 'LyricOperaofChicago',
                width: '670',
                height: '377',
                count: '6'
            }

            var options = $.extend(defaults, options);

            return this.each(function () {
                var o = options;

                var target = $(this);
                var videoPage = 0;
                var totalVideos = 0;
                var totalPages = 0;
                var initialized = false;

                $(target).find('.videoGrid ul').attr('data-video-page', '0');

                initControls();
                initPagebar();
                loadCurrentVideoPage();


                // Functions

                function loadCurrentVideoPage() {
                    $(target).find('.videoGrid ul li').hide().html('');
                    var startIndex = videoPage * o.count + 1;
                    console.log(startIndex + '  ' + o.count);
                    var jsonURL = 'http://gdata.youtube.com/feeds/api/videos?&alt=json&callback=?&author=' + o.user + '&orderby=published' + '&max-results=' + o.count + '&start-index=' + startIndex;
                    $.getJSON(jsonURL, function (json) {
                        var videos = json.feed.entry;
                        showVideos(videos);
                        $(target).find('.videoGrid ul li:odd').addClass('rightCol');
                        setClickEvents();
                        updatePagebar();
                        $(target).find('.videoGrid ul li').fadeIn();
                    });
                }

                function changePage(modifier) {
                    var newVideoPage = videoPage + modifier;
                    if (newVideoPage != -1 && newVideoPage < totalPages) {
                        videoPage = newVideoPage;
                        loadCurrentVideoPage();
                    }
                }

                function jumpToPage(page) {
                    videoPage = page;
                    loadCurrentVideoPage();
                }

                function initPagebar() {
                    var userJSON = 'http://gdata.youtube.com/feeds/api/users/' + o.user + '?alt=json&callback=?';
                    $.getJSON(userJSON, function (json) {
                        console.log('user json');
                        totalVideos = json.entry.gd$feedLink[4].countHint;
                        totalPages = Math.ceil(totalVideos / o.count);

                        $(target).find('.videoPagebar').each(function () {
                            for (var i = 0; i < totalPages; i++) {
                                $(this).find('ul').append('<li>' + (i + 1) + '</li>');
                            }

                            $(this).find('ul li:first-child').addClass('active');

                            $(this).find('ul li').click(function () {
                                targetPage = $(this).html();
                                jumpToPage(targetPage - 1);
                            });

                            var linkWidth = Math.floor($(this).find('ul').width() / totalPages);
                            $(this).find('ul li').each(function () {
                                $(this).css('width', linkWidth + 'px');
                            });
                        });
                    });
                }

                function updatePagebar() {
                    $(target).find('.videoPagebar').each(function () {
                        $(this).find('ul li').removeClass('active');
                        $(this).find('ul li').eq(videoPage).addClass('active');
                    });
                }

                function showVideos(videos) {
                    if (initialized === false) {
                        setVideo(getYoutubeID(videos[0].media$group.media$player[0].url));
                        initialized = true;
                    };
                    for (var i = 0; i < videos.length; i++) {
                        var videoID = getYoutubeID(videos[i].media$group.media$player[0].url);
                        $(target).find('.videoGrid ul li:nth-child(' + (i + 1) + ')').append('<img src="' + videos[i].media$group.media$thumbnail[0].url + '" /><span>' + videos[i].title.$t + '</span>');
                        $(target).find('.videoGrid ul li:nth-child(' + (i + 1) + ')').attr('data-video-id', videoID);
                        //$(target).find('.videoGrid ul').append('<li data-video-id="' + videoID + '"><img src="' + videos[i].media$group.media$thumbnail[0].url + '" /><span>' + videos[i].title.$t + '</span></li>');
                    }
                }

                function setClickEvents() {
                    $(target).find('.videoGrid ul').children().each(function () {
                        $(this).click(function () {
                            var videoID = $(this).attr('data-video-id');
                            setVideo(videoID);
                        })
                    })
                }

                function initControls() {
                    $(target).find('a.videoListPrev').click(function () {
                        changePage(-1);
                        return false;
                    });
                    $(target).find('a.videoListNext').click(function () {
                        changePage(1);
                        return false;
                    });
                }

                function setVideo(videoID) {
                    var embedString = '<iframe width="' + o.width + '" height="' + o.height + '" src="http://www.youtube.com/embed/' + videoID + '" frameborder="0" allowfullscreen></iframe>'
                    $(target).find('.player').html(embedString);
                }

                function getYoutubeID(url) {
                    var start = url.indexOf("?") + 1;
                    var end = url.length;
                    var qString = url.substring(start, end);
                    var youtubeID = getQueryVariable('v', qString);

                    return youtubeID;
                }

                function getQueryVariable(variable, queryString) {
                    var vars = queryString.split('&');
                    for (var i = 0; i < vars.length; i++) {
                        var pair = vars[i].split('=');
                        if (decodeURIComponent(pair[0]) == variable) {
                            return decodeURIComponent(pair[1]);
                        }
                    }
                }

            });
        }
    });

})(jQuery);