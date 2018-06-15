/**

adageMegamenu 8.17.2012

Parameters
    + container : element in which the mouse must be in for the menu (default: element's parent)
    + effect: slide or fade effect (default: slide)
    + duration: the duration of the slide/fade animation (default: 400 millseconds)
    + easing: any of the easing functions included with the jquery ui library (default: linear)
    + hoverIntent: whether or not to use the hoverIntent plugin (default: true)
    + hoverIntentDelay: delay in ms before hoverIntent 'over' event fires (default: 50) - hoverIntent must be true.

HTML/CSS Structure
    + This is the structure expected by the plugin. 
    + The script ignores anything further than .mm-nav-item or .mm-column, so customization should start there
    + <***> means that the tag name doesn't matter, otherwise the tag name is required

    Tag Tree                    Script Assigned Class Tree

    <nav>                       .mm-root
        <ul>                        .mm-nav
            <li></li>                   .mm-nav-item (hover adds .mm-state-active)
            <li></li>                   .mm-nav-item (hover adds .mm-state-active)
        </ul>                   
        <***>                       .mm-panel
            <***>                       .mm-submenu
                <***></***>                 .mm-column
                <***></***>                 .mm-column
            </***>
            <***>                       .mm-submenu
                <***></***>                 .mm-column
                <***></***>                 .mm-column
            </***> 
        </***>
    </nav>

No submenu Navigation items
    + In order to make a no submenu navigation item, include an empty tag as a placeholder (where the item's .mm-submenu element would normally be)
    + The element will then fail the is.(:empty) check and therefore not display

Included Libraries
    hoverIntent plugin (http://cherne.net/brian/resources/jquery.hoverIntent.html)

Requirements
    jQuery 1.2+

Recommended
    Modernizr Touch Detection (for touch fallback)
    jQuery 1.5.1+ (for hoverIntent)
    jQuery UI (for easing)


**/
(function ($) {

    $.fn.extend({

        adageMegamenu: function (options) {

            var defaults = {
                container: $(this).parent(),
                effect: 'slide',
                duration: '400',
                easing: 'linear',
                hoverIntent: true,
                hoverIntentDelay: 50
            }

            var touch = (typeof Modernizr.touch != 'undefined') ? Modernizr.touch : false;
            var options = $.extend(defaults, options);

            return this.each(function () {
                var o = options;

                // Init + Class Structure
                var megamenu = $(this);
                $(megamenu).addClass('mm-root');
                var megamenuNav = $(megamenu).children('ul:nth-child(1)');
                $(megamenuNav).addClass('mm-nav');
                $(megamenuNav).children().addClass('mm-nav-item');
                var megamenuPanel = $(megamenu).children('*:nth-child(2)');
                var mainNavLinks = $(megamenuNav).children('.mm-nav-item');
                $(megamenuPanel).addClass('mm-panel');
                $(megamenuPanel).children().addClass('mm-submenu');
                $('.mm-submenu').children().addClass('mm-column');
                $('.mm-submenu').hide();
                $('.mm-panel').hide();

                // Updating
                function updateMenu() {
                    if ($('.mm-state-active').length) {
                        $(megamenuNav).children('.mm-nav-item').each(function () {
                            var menuIndex = $(this).index() + 1;
                            if ($(this).hasClass('mm-state-active'))
                                showSubmenu($(megamenuPanel).children('.mm-submenu:nth-child(' + menuIndex + ')'));
                            else
                                hideSubmenu($(megamenuPanel).children('.mm-submenu:nth-child(' + menuIndex + ')'));
                        });
                    }
                    else {
                        hidePanel();
                    }
                }

                // Animation
                function showPanel() {
                    if (o.effect == 'slide')
                        $('.mm-panel').slideDown(o.duration, o.easing);
                    else if (o.effect == 'fade')
                        $('.mm-panel').fadeIn(o.duration, o.easing);
                    else
                        $('.mm-panel').show();
                }

                function hidePanel() {
                    if (o.effect == 'slide')
                        $('.mm-panel').slideUp(o.duration, o.easing);
                    else if (o.effect == 'fade')
                        $('.mm-panel').fadeOut(o.duration, o.easing);
                    else
                        $('.mm-panel').hide();
                }

                function showSubmenu(submenu) {
                    if ($(submenu).is(':not(:empty)')) {
                        $(submenu).show();
                        if (!$('.mm-panel:visible').length)
                            showPanel();
                    }
                    else {
                        hidePanel();
                    }
                }

                function hideSubmenu(submenu) {
                    $(submenu).hide();
                    if ($('.mm-panel:visible').length == 0)
                        hidePanel();
                }

                function hoverIn(el) {
                    $('.mm-state-active').removeClass('mm-state-active');
                    el.addClass('mm-state-active');
                    updateMenu();
                }

                function flagTouches() {
                    var clickNum = $(this).data('clickNum');
                    if (!clickNum) {
                        $(this).data('clickNum', clickNum + 1);
                        hoverIn($(this));
                        return false;
                    }
                }

                function hoverOut() {
                    return;
                }

                // Events
                if (touch) {
                    mainNavLinks.data('clickNum', 0).click(flagTouches);
                } else {
                    if (o.hoverIntent) {
                        mainNavLinks.hoverIntent({ over: function () { hoverIn($(this)); }, out: hoverOut, interval: o.hoverIntentDelay });
                    }
                    else {
                        mainNavLinks.hover(function () { hoverIn($(this)); }, hoverOut);
                    }
                    $(o.container).mouseleave(function () {
                        hidePanel();
                        $('.mm-state-active').removeClass('mm-state-active');
                    });
                }

            });
        }
    });
})(jQuery);



/**
* hoverIntent r6 // 2011.02.26 // jQuery 1.5.1+
*/
(function ($) { $.fn.hoverIntent = function (f, g) { var cfg = { sensitivity: 7, interval: 100, timeout: 0 }; cfg = $.extend(cfg, g ? { over: f, out: g} : f); var cX, cY, pX, pY; var track = function (ev) { cX = ev.pageX; cY = ev.pageY }; var compare = function (ev, ob) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); if ((Math.abs(pX - cX) + Math.abs(pY - cY)) < cfg.sensitivity) { $(ob).unbind("mousemove", track); ob.hoverIntent_s = 1; return cfg.over.apply(ob, [ev]) } else { pX = cX; pY = cY; ob.hoverIntent_t = setTimeout(function () { compare(ev, ob) }, cfg.interval) } }; var delay = function (ev, ob) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); ob.hoverIntent_s = 0; return cfg.out.apply(ob, [ev]) }; var handleHover = function (e) { var ev = jQuery.extend({}, e); var ob = this; if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t) } if (e.type == "mouseenter") { pX = ev.pageX; pY = ev.pageY; $(ob).bind("mousemove", track); if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout(function () { compare(ev, ob) }, cfg.interval) } } else { $(ob).unbind("mousemove", track); if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout(function () { delay(ev, ob) }, cfg.timeout) } } }; return this.bind('mouseenter', handleHover).bind('mouseleave', handleHover) } })(jQuery);