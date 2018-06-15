$(function () {

    //$(".selectPhoto:first-child").addClass("active");

    $(".selectPhoto").each(function (index) {
        if (index == 0)
            $(this).addClass("active");

        if ($(this).data('is-image') == "False") {
            $(this).siblings(".VideoIconThumbnail").show();
        }

    });

    $('.VideoIconThumbnail').on('click', function (evt) {
        $(this).siblings(".selectPhoto").click();
    });

    $('.selectPhoto').on('click', function (evt) {
        newPhoto = evt.currentTarget;

        isImage = newPhoto.getAttribute('data-is-image');

        $currentPhoto = $('.projectDetailImage .projectPhoto');
        $currentVideo = $('.projectDetailVideo .projectVideo');

        if (isImage == "True") {
            $('.projectDetailImage').show();
            $currentVideo.html('');
            $photoCredit = $('.photoCredit span');
            $ImageFeaturingProductsText = $('#ImageFeaturingProductsText');
            $currentPhoto.prop('src', newPhoto.getAttribute('data-url'));

            if (newPhoto.getAttribute('data-photoCredit') != '')
                $photoCredit.html('Photo by ' + newPhoto.getAttribute('data-photoCredit'));

            $ImageFeaturingProductsText.html(newPhoto.getAttribute('data-featuring-text'));


            // Update breadcrumb
            $('.lastBreadcrumb').text(newPhoto.getAttribute('data-brand')).attr("href", newPhoto.getAttribute('data-brand-url'));

            $(".selectPhoto").removeClass("active");
            $(this).addClass("active");
        }
        else {
            $('.projectDetailImage').hide();
            $currentVideo.html(newPhoto.getAttribute('data-video-url'));
            $currentPhoto.prop('src', '');
            $(".selectPhoto").removeClass("active");
            $(this).addClass("active");
        }

    });


    var index = parseInt(getParameterByName('idx'));

    if (!isNaN(index)) {
        var trueIndex = index - 1;
        $('.selectPhoto:eq(' + trueIndex + ')').click();
    }

    if ($('#hidShowVideoFirst').val() == "True")
        $('.selectPhoto:eq(0)').click();

});

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}