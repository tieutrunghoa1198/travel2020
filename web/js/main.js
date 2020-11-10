
(function ($) {
    "use strict";


    /*==================================================================
     [ Validate ]*/
    var input = $('.validate-input .input100');
    var myInput = $('.validate-name').val();
    $('.validate-form').on('submit', function () {
        var check = true;
        console.log(myInput);
        for (var i = 0; i < input.length; i++) {
            if (validate(input[i]) === false) {
                showValidate(input[i]);
                check = false;
            }
        }
        return check;
    });


    $("#repass").on('input', function (e) {
        console.log('123 :  ' + $("#pass").val());
        if ($(e.target).val() === $('#pass').val()) {
            $('#message').css("color", "green");
            $('#message').html("Password is matched.");
            $('#mybtn').css('opacity', '1');
            $('#mybtn').prop("disabled", false);
        } else {
            $('#message').css("color", "red");
            $('#message').html("Password not match.");
            $('#mybtn').css('opacity', '0.6');
            $('#mybtn').prop("disabled", true);
        }

        if ($(e.target).val() === '') {
            $('#message').html("");
            $('#mybtn').prop("disabled", true);
            $('#mybtn').css('opacity', '0.6');
        }
    });
    $("#pass").on('input', function (e) {
        if ($(e.target).val() === $('#repass').val()) {
            $('#message').css("color", "green");
            $('#message').html("Password is matched.");
            $('#mybtn').css('opacity', '1');
            $('#mybtn').prop("disabled", false);
        } else {
            $('#message').css("color", "red");
            $('#mybtn').css('opacity', '0.6');
            $('#message').html("Password not match.");
            $('#mybtn').prop("disabled", true);
        }

        if ($(e.target).val() === '') {
            $('#message').html("");
            $('#mybtn').prop("disabled", true);
            $('#mybtn').css('opacity', '0.6');
        }
    });

    $('.validate-form .input100').each(function () {
        $(this).focus(function () {
            hideValidate(this);
        });
    });

    function validate(input) {
        if ($(input).attr('type') === 'email' || $(input).attr('name') === 'email') {
            if ($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) === null) {
                return false;
            }
        } else {
            if ($(input).val().trim() === '') {
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }



})(jQuery);