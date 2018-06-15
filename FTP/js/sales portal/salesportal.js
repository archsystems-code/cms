$('.accordion').accordion({
    heightStyle: "content",
    collapsible: true,
    navigation: true,
    active: false
});

$('.sales-portal-collateral-assets .accordion').first().accordion({
    active: 0
});

//Hide other tabas when page is loaded first time.
$('.sales-portal-digital-library, .sales-portal-form, .sales-portal-quote').hide();

$('#homeTabAnchor').click(function () {

    $('.sales-portal-tab').hide();
    $('.sales-portal-home').show();

});

$('#digitalTabAnchor').click(function () {

    $('.sales-portal-tab').hide();
    $('.sales-portal-digital-library').show();

});

$('#portalTabAnchor').click(function () {

    $('.sales-portal-tab').hide();
    $('.sales-portal-form').show();

});

$('#quoteTabAnchor').click(function () {

    $('.sales-portal-tab').hide();
    $('.sales-portal-quote').show();

});

$('#shippingOptionPanel').hide();

$("#ddlTypeOfShipping").change(function () {

    $("#hidShippingOption").val("");

    if ($("#ddlTypeOfShipping").val() == '')
        $('#shippingOptionPanel').hide();
    else {
        $("#shippingOption").empty();
        $('#shippingOption').append($("<option></option>").attr("value", "").text("--select--"));
        if ($("#ddlTypeOfShipping").val() == 'UPS') {
            $('#shippingOption').append($("<option></option>").attr("value", "Ground").text("Ground"))
            .append($("<option></option>").attr("value", "Next Day").text("Next Day"))
            .append($("<option></option>").attr("value", "2-Day").text("2-Day"))
            .append($("<option></option>").attr("value", "3-Day").text("3-Day"));
        }
        else if ($("#ddlTypeOfShipping").val() == 'FedEx') {
            $('#shippingOption').append($("<option></option>").attr("value", "Ground").text("Ground"))
            .append($("<option></option>").attr("value", "Priority (by 10 AM)").text("Priority (by 10 AM)"))
            .append($("<option></option>").attr("value", "Standard (by 3 PM)").text("Standard (by 3 PM)"))
            .append($("<option></option>").attr("value", "2-Day").text("2-Day"));
        }
        $('#shippingOptionPanel').show();
    }
});

$("#shippingOption").change(function () {
    $("#hidShippingOption").val($("#shippingOption").val());
});

function GeneralInformationValidation() {
    if ($('#tbxDateOfVisit').val() == '' ||
        $('#tbxContact').val() == '' ||
        $('#tbxAccountName').val() == '' ||
        $('#tbxAccountExecutive').val() == '' ||
        $('#tbxProjectName').val() == '' ||
        $('#tbxEmail').val() == '' ||
        $('#tbxPhone').val() == '' ||
        $('#ddlProjectType').val() == '' ||
        $('#tbxProjectLocation').val() == '' ||
        $('#ddlTypeOfShipping').val() == '' ||
        $('#hidShippingOption').val() == '' ||
        $('#ddlThankYouLetter').val() == '' ||
        $('#tbxAddress').val() == '') {
        $('.errormessage').show();
        return false;
    }


    return true;
}

function QuoteFormGeneralInformationValidation() {
    if ($('#tbxQuoteAccountName').val() == '' ||
        $('#tbxQuoteContact').val() == '' ||
        $('#tbxQuoteEmail').val() == '' ||
        $('#tbxQuotePhone').val() == '' ||
        $('#tbxQuoteAccountExecutive').val() == '' ||
        $('#tbxQuoteBillingAddress').val() == '' ||
        $('#tbxQuoteProjectName').val() == '' ||
        $('#tbxQuoteMaterialSpecifier').val() == '' ||
        $('#tbxQuoteProjectType').val() == '' ||
        $('#tbxQuoteLocation').val() == '' ||
        $('#tbxQuoteProductSKU').val() == '' ||
        $('#tbxQuoteNoOfPieces').val() == '' ||
        $('#tbxQuoteShippingAddress').val() == '') {
        $('.errormessage').show();
        return false;
    }


    return true;
}