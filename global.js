
$(function () {

    // Homepage Slideshow
    $('.slideshow').cycle({
        fx: 'fade',
        pager: '#nav',
        pause: 1,
        timeout: 7000,
        speed: 2000

    });

    // Homepage Show More Events
    $('.showEvents').on('click', function () {
        $('.moreEvents').slideToggle(500, function () {
            var targetText = '∨';
            var $targetEl = $('.showEvents');
            var isVisible = $(this).is(':visible');

            if (isVisible)
                targetText = '∧';

            $targetEl.text(targetText);

        });
        return false;
    });

    // General Accordion
    $('.accordion').accordion({
        active: false,
        heightStyle: "content",
        collapsible: true,
        navigation: true
    });

    // Testimonials Page
    $(".clientList .accordion").accordion({
        active: 0,
        heightStyle: "content",
        collapsible: true,
        navigation: true
    });

    $('.slideshow').cycle({
        fx: 'fade',
        pager: '.navi',
        pause: 2,
        timeout: 7000,
        speed: 2000
    });

    // Press Archive Accordion
    $('.accordion').accordion({
        active: 0,
        heightStyle: "content",
        collapsible: true,
        navigation: true
    });

    // Promotion Flyout
    $(document).ready(function () {
        $('.promotion-flyout').show("slide", { direction: "down" }, 1000);
    });

    $(".promotion-close").click(function () {
        $(".promotion-flyout").hide();
    });

    // Mini Cart
    $(".continue-shopping").click(function () {
        $(".mini-cart-wrapper").hide();
    });


});