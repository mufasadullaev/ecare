import "flatpickr/dist/l10n";
document.addEventListener('DOMContentLoaded', loadAppointmentCreateEditData)

let appointmentDate = $('#appointmentDate')
let selectedDate
let selectedSlotTime

let timezoneOffsetMinutes = new Date().getTimezoneOffset()
timezoneOffsetMinutes = timezoneOffsetMinutes === 0
    ? 0
    : -timezoneOffsetMinutes

function loadAppointmentCreateEditData() {
    if (!$('#appointmentDate').length) {
        return
    }


    let lang = $('.currentLanguage').val()
    $('#appointmentDate').flatpickr({
        "locale": lang,
        minDate: new Date(),
        disableMobile: true,
    });
    $('.no-time-slot').removeClass('d-none');
}

listenChange('#appointmentDate', function () {


    selectedDate = $(this).val();
    let userRole = $('#userRole').val();
    let doctorRole = $('#doctorRole').val();
    let appointmentIsEdit = $('#appointmentIsEdit').val();
    $('.appointment-slot-data').html('');
    let url = '';

    if (!isEmpty(userRole) || !isEmpty(doctorRole)) {

        if (!isEmpty(userRole)) {
            url = route('patients.doctor-session-time');
        }
        if (!isEmpty(doctorRole)) {
            url = route('doctors.doctor-session-time');
        }
    } else {
        url = route('doctor-session-time');
    }
    // let url = !isEmpty(userRole)
    //     ? route('patients.doctor-session-time')
    //     : route('doctor-session-time');
    $.ajax({
        url: url,
        type: 'GET',
        data: {
            'adminAppointmentDoctorId': $('#adminAppointmentDoctorId').val(),
            'date': selectedDate,
            'timezone_offset_minutes': timezoneOffsetMinutes,
        },
        success: function (result) {
            if (result.success) {
                if (result.data['bookedSlot'] != null && result.data['bookedSlot'].length > 0) {
                    if (result.data['slots'].length == 0) {
                        $('.no-time-slot').addClass('d-none');
                        $('.doctor-time-over').removeClass('d-none');
                    }
                }
                $.each(result.data['slots'], function (index, value) {
                    if (appointmentIsEdit && fromTime == value) {
                        $('.no-time-slot').addClass('d-none');
                        $('.doctor-time-over').addClass('d-none');
                        $('.appointment-slot-data').append(
                            '<span class="time-slot col-lg-2  activeSlot" data-id="' +
                            value + '">' + value + '</span>');
                    } else {
                        $('.no-time-slot').addClass('d-none');
                        $('.doctor-time-over').addClass('d-none');
                        if (result.data['bookedSlot'] == null) {
                            $('.appointment-slot-data').append(
                                '<span class="time-slot col-lg-2" data-id="' +
                                value + '">' + value + '</span>');
                        } else {
                            if ($.inArray(value,
                                result.data['bookedSlot']) !== -1) {
                                $('.appointment-slot-data').
                                    append(
                                        '<span class="time-slot col-lg-2 bookedSlot " data-id="' +
                                        value + '">' + value + '</span>');
                            } else {
                                $('.appointment-slot-data').
                                    append(
                                        '<span class="time-slot col-lg-2" data-id="' +
                                        value + '">' + value + '</span>');
                            }

                        }
                    }
                });
            }
        },
        error: function (result) {
            $('.no-time-slot').removeClass('d-none');
            $('.doctor-time-over').addClass('d-none');
            displayErrorMessage(result.responseJSON.message);
        },
    });
});

listenClick('.time-slot', function () {
    if ($('.time-slot').hasClass('activeSlot')) {
        $('.time-slot').removeClass('activeSlot');
        selectedSlotTime = $(this).addClass('activeSlot');
    } else {
        selectedSlotTime = $(this).addClass('activeSlot');
    }
    let fromToTime = $(this).attr('data-id').split('-');
    let fromTime = fromToTime[0];
    let toTime = fromToTime[1];
    $('#timeSlot').val('');
    $('#toTime').val('');
    $('#timeSlot').val(fromTime);
    $('#toTime').val(toTime);
});

let charge;
let addFees = parseInt($('#addFees').val());
let totalFees;
listenChange('#adminAppointmentDoctorId', function () {
    $('#chargeId').val('');
    $('#payableAmount').val('');
    appointmentDate.val('');
    $('#addFees').val('');
    $('.appointment-slot-data').html('');
    $('.no-time-slot').removeClass('d-none');
    let url = !isEmpty(userRole) ? route('patients.get-service') : route(
        'get-service');

    $.ajax({
        url: url,
        type: 'GET',
        data: {
            'appointmentDoctorId': $(this).val(),
        },
        success: function (result) {
            if (result.success) {
                $('#appointmentDate').removeAttr('disabled');
                $('#appointmentServiceId').empty();
                $('#appointmentServiceId').append($('<option value=""></option>').text(Lang.get('js.select_service')));
                $.each(result.data, function (i, v) {
                    $('#appointmentServiceId').append($('<option></option>').attr('value', v.id).text(v.name));
                });
            }
        },
    });
});

listenChange('#appointmentServiceId', function () {
    let url = !isEmpty(userRole) ? route('patients.get-charge') : route(
        'get-charge');

    $.ajax({
        url: url,
        type: 'GET',
        data: {
            'chargeId': $(this).val(),
        },
        success: function (result) {
            if (result.success) {
                $('#chargeId').val('');
                $('#addFees').val('');
                $('#payableAmount').val('');
                if (result.data) {
                    $('#chargeId').val(result.data.charges);
                    $('#payableAmount').val(result.data.charges);
                    charge = result.data.charges;
                }
            }
        },
    });
});

listenKeyup('#addFees', function (e) {
    if (e.which != 8 && isNaN(String.fromCharCode(e.which))) {
        e.preventDefault();
    }
    totalFees = '';
    totalFees = parseFloat(charge) +
        parseFloat($(this).val() ? $(this).val() : 0);
    $('#payableAmount').val(totalFees.toFixed(2));
});

listenSubmit('#addAppointmentForm', function (e) {

    e.preventDefault();

    let data = new FormData($(this)[0]);
    $('.submitAppointmentBtn').prop(Lang.get('js.discard'), true);
    $('.submitAppointmentBtn').text(Lang.get('js.please_wait'));
    $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: data,
        processData: false,
        contentType: false,
        success: function (mainResult) {
            if (mainResult.success) {

                let appID = mainResult.data.appointmentId;

                //displaySuccessMessage(mainResult.message);

                $('#addAppointmentForm')[0].reset();
                $('#addAppointmentForm').val('').trigger('change');

                if (mainResult.data.payment_type == $('#manuallyMethod').val()) {
                    window.location.replace(route('manually-payment', { 'appointmentId': appID }));
                }

                if (mainResult.data.payment_type == $('#stripeMethod').val()) {
                    let sessionId = mainResult.data[0].sessionId;
                    stripe.redirectToCheckout({
                        sessionId: sessionId,
                    }).then(function (mainResult) {
                        manageAjaxErrors(mainResult);
                    });
                }
            }
        },
        error: function (result) {
            displayErrorMessage(result.responseJSON.message);
            $('.submitAppointmentBtn').prop(Lang.get('js.discard'), false);
            $('.submitAppointmentBtn').text(Lang.get('js.save'));
        },
        complete: function () {

        },
    });
});

