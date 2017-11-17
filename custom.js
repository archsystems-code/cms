

$(document).ready(function () {

    // Requested Samples Area opened when contains anything but the "No samples" message.
    //var $samplesArea = $(".samples");
    //if ($samplesArea.has(".noneMessage").length) {
    //    $samplesArea.css({ display: "none" });
    //} else {
    //    $samplesArea.css({ display: "block" });
    //}

    //$(".viewClick").click(function () {
    //    $(".samples").slideToggle("slow");
    //});


    // Collection Nav Accordion
    $('.interior nav ul li:has("ul") > .icons').append('<span class="plus">+</span>');
    $('.interior nav ul li .plus').on('click', function () {
        $(this).parents('.icons').siblings('ul').slideToggle();
    });

    checkActiveCollection();
    function checkActiveCollection() {
        var pagePath = window.location.pathname;

        if (!$('#hidProductCollectionName'))
            if (!$('#hidProductCollectionName'))
                pagePath = $('#hidProductCollectionName').val();
        $('.collectionNavigation').find('a[href="' + pagePath + '"]').each(function () {
            $(this).addClass('color');
            $(this).parents('.collectionNavigation ul').slideToggle();
            $(this).siblings('.collectionNavigation ul').slideToggle();
        });
    }


    // Remove margin on homepage
    $('.grayBg').parents('.mainWrapper').css('padding', '0');

    // Remove empty tearsheet links
    $(".press small a").each(function (i) {
        if ($(this).attr('href') === '') {
            $(this).parent().hide();
        }
    });

    // Project Pager Scroll to Top
    $('.mainFixed .pager a').on('click', function () {
        $("html, body").animate({ scrollTop: 0 }, "fast");
        return false;
    });

    // Nice blocks of testimonials
    $('.testimonials .wrap:nth-child(even)').css('clear', 'both');

    // Remove empty crumbs
    $('.breadcrumbs a:empty').remove();

    // Remove Empty Validation
    $('.validation:empty').remove();

    // Remove empty links on project main page
    var image = $('.highlights div:first-child .box img');
    $('.highlights div:first-child .box a').remove();
    $(image).appendTo('.highlights div:first-child .box');

    // Landing Page Top
    if ($('.topCallout aside').length) {
        $('.topCallout > div').addClass('mainText');
    } else {
        $('.topCallout aside').addClass('none');
    }

    // Show & hide featured item text on the press page
    $('.press .featured').on({
        mouseenter: function () {
            $(this).find('p').stop().slideDown();
        },
        mouseleave: function () {
            $(this).find('p').stop().slideUp();
        }
    });

    //Modal on Product Details page to request samples
    //$(function () {
    //    $(".requestModal").dialog({
    //        autoOpen: false,
    //        width: 430,
    //        minheight: 150,
    //        modal: true
    //    });
    //    $(".openModal").click(function () {
    //        if (!IsLoggedIn()) {
    //            $(".requestModal").dialog("open");
    //            return false;
    //        }
    //        else {
    //            if (ShouldShowMaxSampleMessage()) {
    //                $("#dialogThreeSamples").dialog({ closeText: '', modal: true, buttons: { "Close": function () { $(this).dialog("close"); } } });
    //                return false;
    //            }
    //            else {
    //                return true;
    //            }
    //        }
    //    });
    //});

    // Product Details Modal Cart
    $('.viewClick a').on('click', function () {
        $('.modal , .modalOverlay').show();
    });

    // Close Modal
    $('.modal .close').on('click', function () {
        $('.modalRecommend').hide();
        $('#Modal_backgroundElement').hide();
        return false;
    });

    //Reveal "more links" on collection landing pages
    $('.moreProjectsLink').click(function (event) {
        event.preventDefault();
        $('.moreProjectsReveal').slideToggle(function () {
            $('.moreProjectsLink').text(
              $(this).is(':visible') ? "Other Projects ▲" : "Other Projects ▼");
        });
    });

    function isEmpty(el) {
        return !$.trim(el.html())
    }
    if (isEmpty($('.moreProjectsReveal ul'))) {
        $('.moreProjectsLink').hide();
    }

    if ($('.collectionPress ul li').length > 2)
    {
        $('<a href="#" class="morePressLink">Other Press ▼</a>').appendTo('.collectionPress ul');
        $('.collectionPress ul li').slice(2).wrapAll('<li><ul>');
    }
    
    $('.morePressLink').click(function (event) {
        event.preventDefault();
        $('.collectionPress ul ul').slideToggle(function () {
            $('.morePressLink').text(
              $(this).is(':visible') ? "Other Press ▲" : "Other Press ▼");
        });
    });

    //Javascript for ornamental collection display
    $('.viewAssort a').on('click', function () {
        $('.chainTextModal').show();
        return false;
    });
    $('.availSamples .close').on('click', function () {
        $('.chainTextModal').hide();
        return false;
    });
    //Sample Checkout Toggle Areas
    $('.shipping .editInfo').on('click', function () {
        $(this).hide();
        $('.shipping .read').hide();
        $('.edit').slideDown();
        return false;
    });

    // Mouseover Large Image on Products in Cart
    $('.popupsample').on({
        mouseenter: function () {
            var clonedImg = $(this).clone();
            clonedImg.addClass('popupsample-active');
            $('.mainWrapper').append(clonedImg);
        },
        mouseleave: function () {
            $('.mainWrapper').children('img.popupsample').remove();
        }
    });

    //    $('.shipping .save').on('click', function () {
    //        $('.shipping .editInfo').show();
    //        $('.shipping .read').show();
    //        $('.edit').hide();
    //        return false;
    //    });

    $('.concern input[type=radio]').on('change', function () {
        if ($('.concern li:first-child input[type=radio]').is(':checked')) {
            $('.concern ul').slideDown();
        } else {
            $('.concern ul').slideUp();
        }

    });

    // My Account Page
    $('.accountInfo a.edit').on('click', function () {
        $(this).parents('ul.view').hide().siblings('ul.edit').show();
    });
    $('.accountInfo a.cancel').on('click', function () {
        $(this).parents('ul.edit').hide().siblings('ul.view').show();
    });

    // Checkout Billing Page Modals

    $('.modalTrigger').on('click', function () {

        if ($(this).hasClass('editInfo')) {
            var $wrap = $('.checkoutModal.editInfo .modalWrap'),
                $modal = $('.checkoutModal.editInfo'),
                halfHeight;

            $modal.show();
            halfHeight = $wrap.height() / 2;
            $wrap.css('margin-top', halfHeight * -1);

            return false;

        } else if ($(this).hasClass('newAddress')) {
            var $wrap = $('.checkoutModal.newAddress .modalWrap'),
                $modal = $('.checkoutModal.newAddress'),
                halfHeight;

            $modal.show();
            halfHeight = $wrap.height() / 2;
            $wrap.css('margin-top', halfHeight * -1);

            return false;

        } else {
            var $wrap = $('.checkoutModal .modalWrap'),
                $modal = $('.checkoutModal'),
                halfHeight;

            $modal.show();
            halfHeight = $wrap.height() / 2;
            $wrap.css('margin-top', halfHeight * -1);

            return false;
        }

    });

    $('.modalWrap .close').on('click', function () {
        $('.checkoutModal').hide();
        $('#AuxModal_backgroundElement').hide();
        return false;
    });

});

function ToggleStates(pageload) {
    $('.statedropdown').toggle($('.countrydropdown').val() == 'US');
    if (!pageload) {
        if ($('.countrydropdown').val() != 'US') {
            $('.statedropdown').val('None');
        }
        else {
            $('.statedropdown').val('');
        }
    }
}
