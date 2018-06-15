(function ($) {
    $.fn.extend({
        adageShowcase: function (options) {

            var defaults = {
                panelWidth: 712,        // size of each panel
                panelDuration: 1200     // milliseconds for each panel to animate
            }

            var options = $.extend(defaults, options);

            return this.each(function () {
                var o = options;
                var root = $(this);

                // HTML Structure - General
                $(root).children('h1').css('opacity', '0');
                $(root).children('a').wrap('<div class="callout" />');
                $(root).children('.callout').hide();

                // HTML Structure - Primary Scroller
                var scroller = $(root).find('ul.scroller');
                var panelCount = $(scroller).children().length;

                for (var i = 0; i < panelCount; i++) {
                    console.log(i * o.panelWidth + 'px');
                    $(scroller).children('li').eq(i).css('left', i * o.panelWidth + 'px');
                }

                $(scroller).find('img').wrap('<div class="panel" />').wrap('<div class="imageWrap" />');

                // HTML Structure - Underscroll Scroller
                $(root).append('<ul class="underscroll" />');
                var underscroll = $(root).find('ul.underscroll');

                for (var i = 0; i < 3; i++)
                    $(underscroll).append('<li />');

                $(root).append('<div class="topOverlay" />');

                var currentIndex = 0;
                var underscrollIndex = 0;
                var maxIndex = panelCount - 1;

                // CSS Width Assignment
                var widthString = o.panelWidth + 'px';

                root.width(widthString);
                root.find('.topOverlay').width(widthString);
                scroller.width(widthString);
                scroller.find('.panel').width(widthString);
                scroller.find('.imageWrap').width(widthString);
                underscroll.width(widthString);
                underscroll.find('li').width(widthString);

                // Animation variables
                scrollDuration = o.panelDuration * panelCount;
                backgroundDuration = scrollDuration / 0.39;             // ratio of Geosynchronous orbit :)

                // Animation
                beginBackgroundScroll(backgroundDuration);

                var startInterval = setInterval(function () {
                    badgeScroll();
                    clearInterval(startInterval);
                }, 1000);

                function badgeScroll() {
                    if (currentIndex === 1)
                        currentIndex = 0;
                    else
                        currentIndex = 1;

                    $(scroller).scrollTo('li:eq(' + maxIndex + ')', scrollDuration, {
                        easing: 'easeInOutSine',
                        onAfter: function () {
                            slowBackgroundScroll();
                            $(scroller).find('img').fadeOut();
                            calloutAnimation();
                        }
                    });
                }

                function calloutAnimation() {
                    var tagline = setInterval(function () {
                        showTagline();
                        clearInterval(tagline);
                    }, 200);
                    var callout = setInterval(function () {
                        showCallout();
                        clearInterval(callout);
                    }, 1200);
                }

                function beginBackgroundScroll(speed) {
                    if (underscrollIndex === 1)
                        underscrollIndex = 0;
                    else
                        underscrollIndex = 1;

                    $(underscroll).scrollTo('li:eq(' + underscrollIndex + ')', speed, {
                        easing: 'easeInOutSine',
                        onAfter: function () { beginBackgroundScroll(speed); }
                    });
                }

                function slowBackgroundScroll() {
                    beginBackgroundScroll(60000);
                }

                function showTagline() {
                    $(root).find('h1').animate({
                        top: '10px',
                        opacity: '1'
                    });
                }

                function showCallout() {
                    $(root).find('.callout').fadeIn('fast');
                }

            });
        }
    });
})(jQuery);