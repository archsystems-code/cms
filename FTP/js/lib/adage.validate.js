(function ($) {

    $.fn.extend({

        adageValidate: function (options) {

            var defaults = {
                rootTag: "li",
                async: true,
                tooltips: true,
                customTests: undefined,
                success: function () { },
                fail: function () { }
            }

            // Default Tests
            var tests = new Object;
            tests['required'] = {
                name: 'required',
                regex: "null",
                message: "Required"
            };
            tests['email'] = {
                name: 'email',
                regex: "(\@+\)(\.+)",
                message: "Invalid Email"
            };
            tests['integer'] = {
                name: 'integer',
                regex: "^[0-9]*$",
                message: "Must be a whole number"
            };

            var options = $.extend(defaults, options);

            return this.each(function () {
                var o = options;

                // Set Target
                var target = $(this);

                tests = $.extend(tests, o.customTests);

                $(target).find("input[type='submit']").click(function (event) {
                    fullCheck(event);
                });

                if (o.async) {
                    $(target).find("*[data-validate-tests] input").focusout(function () {
                        asyncCheck($(this));
                    });

                    $(target).find("*[data-validate-tests] input, *[data-validate-tests]  textarea, *[data-validate-tests]  select").change(function () {
                        asyncCheck($(this));
                    });
                }

                function runTests(fieldContainer) {
                    var passed = true;

                    var inputFound = $(fieldContainer).find('input:not(input[type="radio"])');
                    var selectFound = $(fieldContainer).find('select');
                    var textareaFound = $(fieldContainer).find('textarea');
                    var radioFound = $(fieldContainer).find('input[type="radio"]');

                    var targetField;

                    if (inputFound.length != 0)
                        targetField = inputFound.first();
                    else if (selectFound.length != 0)
                        targetField = selectFound.first();
                    else if (textareaFound.length != 0)
                        targetField = textareaFound.first();
                    else if (radioFound.length != 0)
                        targetField = radioFound.first();

                    var checks = $(fieldContainer).attr('data-validate-tests').split(' ');
                    console.log('checks: ' + checks);

                    for (var i = 0; i < checks.length; i++) {
                        var testKey = checks[i];
                        var testObject = tests[testKey];

                        var string = $(targetField).val();

                        if (testKey === "required") {
                            if (!checkRequired(fieldContainer)) {
                                passed = false;
                            }
                        }
                        else {
                            if (!performTest(string, testObject)) {
                                passed = false;
                                appendError(fieldContainer, testObject.name);
                                console.log('failed ' + testObject.name);
                            }
                            else {
                                console.log('passed ' + testObject.name);
                            }
                        }
                    }

                    return passed;
                }

                function performTest(string, testObject) {
                    var passed = true;
                    var pattern = new RegExp(testObject.regex);
                    if (!pattern.test(string)) {
                        passed = false;
                    }
                    return passed;
                }

                function checkRequired(fieldContainer) {
                    var passed = true;

                    var inputFound = $(fieldContainer).find('input:not(input[type="radio"])');
                    var selectFound = $(fieldContainer).find('select');
                    var textareaFound = $(fieldContainer).find('textarea');
                    var radioFound = $(fieldContainer).find('input[type="radio"]');

                    // For input types
                    if (inputFound.length != 0) {
                        var string = $.trim($(fieldContainer).find('input').val());
                        if (string.length == 0)
                            passed = false;
                    }
                    // For select types
                    else if (selectFound.length != 0) {
                        var defaultValue = $(fieldContainer).find('option[selected]').val();
                        var selectedValue = $(fieldContainer).find('select').val();
                        if (defaultValue == selectedValue)
                            passed = false;
                    }
                    // For textarea
                    else if (textareaFound.length != 0) {
                        var string = $.trim($(fieldContainer).find('textarea').val());
                        if (string.length == 0)
                            passed = false;
                    }
                    // For input-radio
                    else if (radioFound.length != 0) {
                        var checked = false;
                        for (var i = 0; i < radioFound.length; i++) {
                            if ($(fieldContainer).find('input[type="radio"]:checked').length)
                                checked = true;
                        }
                        if (!checked)
                            passed = false;
                    }
                    if (!passed) {
                        appendError($(fieldContainer), 'required');
                    }

                    if (passed) {
                        return true;
                    }
                    else {
                        return false;
                    }
                }

                function asyncCheck(field) {
                    var fieldValue = $(field).val();
                    if (fieldValue != "") {
                        var fieldContainer = $(field).parent(o.rootTag);

                        $(fieldContainer).removeAttr('data-validate-error');
                        $(fieldContainer).removeClass('validateError');

                        runTests(fieldContainer);

                        if (o.tooltips) {
                            clearTooltips();
                            displayTooltips();
                        }
                    }
                }

                function fullCheck(event) {
                    event.preventDefault();

                    var shouldSubmit = true;

                    $(target).filter('*[data-validate-error]').removeAttr('data-validate-error');
                    $(target).filter('*[data-validate-error]').removeClass('validateError');

                    $(target).find('*[data-validate-tests]').each(function () {
                        console.log('Testing field ' + $(this).index());
                        if (!runTests($(this)))
                            shouldSubmit = false;
                    });

                    if (o.tooltips) {
                        clearTooltips();
                        displayTooltips();
                    }

                    if (shouldSubmit)
                        o.success();
                    else
                        o.fail();
                }

                function clearTooltips() {
                    $(target).find('.validate-tooltip').remove();
                }

                function displayTooltips() {
                    $(target).find(o.rootTag + '[data-validate-error]').each(function () {
                        var errorString = getErrorString($(this));
                        $(this).append('<div class="validate-tooltip">' + errorString + '</div>');
                    });
                }

                // Manipulation functions //

                function appendError(fnTarget, string) {
                    var oldString = $(fnTarget).attr('data-validate-error');
                    var rawString = '';

                    if (oldString == 'undefined')
                        rawString = string;
                    else
                        rawString = $(fnTarget).attr('data-validate-error') + ' ' + string;

                    var newString = $.trim(rawString).replace('undefined', '');
                    $(fnTarget).attr('data-validate-error', newString);
                    $(fnTarget).addClass('validateError');
                }

                function getErrorString(fnTarget) {
                    var errors = $(fnTarget).attr('data-validate-error').trim().split(' ');
                    var errorString = tests[errors[0]].message;
                    return errorString;
                }

                // Custom Tests //

                f
            });
        }
    });

})(jQuery);