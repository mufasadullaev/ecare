'use strict';

$(document).ready(function (){
    $('.admin-login').click();
});

    window.changeCredentials = function (email, password) {
        $('#email').val(email);
        $('#password').val(password);
    };

    $(document).on('click', '.admin-login', function () {
            changeCredentials('admin@ecare.com', '123456');
        },
    );

    $(document).on('click', '.doctor-login', function () {
            changeCredentials('doctor@ecare.com', '123456');
        },
    );

$(document).on('click', '.patient-login', function () {
        changeCredentials('patient@ecare.com', '123456');
    },
);

