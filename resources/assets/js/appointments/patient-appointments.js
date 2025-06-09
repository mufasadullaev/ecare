document.addEventListener('DOMContentLoaded', loadPatientPanelAppointmentFilterData)

var patientPanelApptmentStart = moment().startOf("week");
var patientPanelApptmentEnd = moment().endOf("week");

function loadPatientPanelAppointmentFilterData() {
    if (!$("#patientAppointmentDate").length) {
        return;
    }

    let patientDatePicker = $("#patientAppointmentDate").daterangepicker(
        {
            startDate: patientPanelApptmentStart,
            endDate: patientPanelApptmentEnd,
            opens: "left",
            showDropdowns: true,
            locale: {
                customRangeLabel: Lang.get("js.custom"),
                applyLabel: Lang.get("js.apply"),
                cancelLabel: Lang.get("js.cancel"),
                fromLabel: Lang.get("js.from"),
                toLabel: Lang.get("js.to"),
                monthNames: [
                    Lang.get("js.jan"),
                    Lang.get("js.feb"),
                    Lang.get("js.mar"),
                    Lang.get("js.apr"),
                    Lang.get("js.may"),
                    Lang.get("js.jun"),
                    Lang.get("js.jul"),
                    Lang.get("js.aug"),
                    Lang.get("js.sep"),
                    Lang.get("js.oct"),
                    Lang.get("js.nov"),
                    Lang.get("js.dec"),
                ],
                daysOfWeek: [
                    Lang.get("js.sun"),
                    Lang.get("js.mon"),
                    Lang.get("js.tue"),
                    Lang.get("js.wed"),
                    Lang.get("js.thu"),
                    Lang.get("js.fri"),
                    Lang.get("js.sat"),
                ],
            },
            ranges: {
                "Today": [moment(), moment()],
                "Yesterday": [
                    moment().subtract(1, "days"),
                    moment().subtract(1, "days"),
                ],
                "This Week": [moment().startOf("week"), moment().endOf("week")],
                "Last 30 Days": [moment().subtract(29, "days"), moment()],
                "This Month": [moment().startOf("month"), moment().endOf("month")],
                "Last Month": [
                    moment().subtract(1, "month").startOf("month"),
                    moment().subtract(1, "month").endOf("month"),
                ],
            },
        },
        function (start, end) {
            let dateRange = start.format("YYYY-MM-DD") + " - " + end.format("YYYY-MM-DD");
            $("#patientAppointmentDate").val(dateRange);
            if (typeof Livewire !== 'undefined') {
                Livewire.dispatch('changeDateFilter', dateRange);
            }
        }
    );

    // Trigger initial date range
    let initialDateRange = patientPanelApptmentStart.format("YYYY-MM-DD") + " - " + patientPanelApptmentEnd.format("YYYY-MM-DD");
    $("#patientAppointmentDate").val(initialDateRange);
    if (typeof Livewire !== 'undefined') {
        Livewire.dispatch('changeDateFilter', initialDateRange);
    }
}

listenClick("#patientPanelApptmentResetFilter", function () {
    $("#patientPaymentStatus").val(0).trigger("change");
    $("#patientAppointmentStatus").val(1).trigger("change");
    $("#patientAppointmentDate")
        .data("daterangepicker")
        .setStartDate(moment().startOf("week").format("MM/DD/YYYY"));
    $("#patientAppointmentDate")
        .data("daterangepicker")
        .setEndDate(moment().endOf("week").format("MM/DD/YYYY"));
    hideDropdownManually($("#patientPanelApptFilterBtn"), $(".dropdown-menu"));
    
    let resetDateRange = moment().startOf("week").format("YYYY-MM-DD") + " - " + moment().endOf("week").format("YYYY-MM-DD");
    if (typeof Livewire !== 'undefined') {
        Livewire.dispatch('changeDateFilter', resetDateRange);
    }
});

listenChange("#patientPaymentStatus", function () {
    Livewire.dispatch("changeDateFilter", {
        date: $("#patientAppointmentDate").val(),
    });
    Livewire.dispatch("changePaymentTypeFilter", { type: $(this).val() });
});

listenChange("#patientAppointmentStatus", function () {
    Livewire.dispatch("changeDateFilter", {
        date: $("#patientAppointmentDate").val(),
    });
    Livewire.dispatch("changeStatusFilter", { status: $(this).val() });
});

// document.addEventListener('livewire:load', function () {
//     window.livewire.hook('message.processed', () => {
//         if ($('#patientPaymentStatus').length) {
//             $('#patientPaymentStatus').select2()
//         }
//         if ($('#patientAppointmentStatus').length) {
//             $('#patientAppointmentStatus').select2()
//         }
//     })
// })

Livewire.hook("element.init", () => {
    loadPatientPanelAppointmentFilterData();
    if ($("#patientPaymentStatus").length) {
        $("#patientPaymentStatus").select2();
    }
    if ($("#patientAppointmentStatus").length) {
        $("#patientAppointmentStatus").select2();
    }
    if (
        patientPanelApptmentStart != undefined &&
        patientPanelApptmentEnd != undefined
    ) {
        cb(patientPanelApptmentStart, patientPanelApptmentEnd);
    }
});

listenClick(".patient-panel-apptment-delete-btn", function (event) {
    let userRole = $("#userRole").val();
    let patientPanelApptmentRecordId = $(event.currentTarget).attr("data-id");
    let patientPanelApptmentRecordUrl = !isEmpty(userRole)
        ? route("patients.appointments.destroy", patientPanelApptmentRecordId)
        : route("appointments.destroy", patientPanelApptmentRecordId);
    deleteItem(patientPanelApptmentRecordUrl, "Appointment");
});

listenClick(".patient-cancel-appointment", function (event) {
    let appointmentId = $(event.currentTarget).attr("data-id");
    cancelAppointment(
        route("patients.cancel-status"),
        Lang.get("js.appointment"),
        appointmentId
    );
});

window.cancelAppointment = function (url, header, appointmentId) {
    swal({
        title: Lang.get("js.cancelled_appointment"),
        text: Lang.get("js.are_you_sure_cancel") + header + " ?",
        type: "warning",
        icon: "warning",
        showCancelButton: true,
        closeOnConfirm: false,
        confirmButtonColor: "#266CB0",
        showLoaderOnConfirm: true,
        buttons: {
            confirm: Lang.get("js.yes"),
            cancel: Lang.get("js.no"),
        },
    }).then(function (result) {
        if (result) {
            deleteItemAjax(url, header, appointmentId);
        }
    });
};

function deleteItemAjax(url, header, appointmentId) {
    $.ajax({
        url: route("patients.cancel-status"),
        type: "POST",
        data: { appointmentId: appointmentId },
        success: function (obj) {
            if (obj.success) {
                Livewire.dispatch("refresh");
            }
            swal({
                title: Lang.get("js.cancelled_appointment"),
                text: header + Lang.get("js.has_cancel"),
                icon: "success",
                confirmButtonColor: "#266CB0",
                timer: 2000,
            });
        },
        error: function (data) {
            swal({
                title: "Error",
                icon: "error",
                text: data.responseJSON.message,
                type: "error",
                confirmButtonColor: "#266CB0",
                timer: 5000,
            });
        },
    });
}

listenClick("#submitBtn", function (event) {
    event.preventDefault();
    let paymentGatewayType = $("#paymentGatewayType").val();
    if (isEmpty(paymentGatewayType)) {
        displayErrorMessage(Lang.get("js.select_payment"));
        return false;
    }
    let stripeMethod = 2;


    let appointmentId = $("#patientAppointmentId").val();
    let btnSubmitEle = $("#patientPaymentForm").find("#submitBtn");
    setAdminBtnLoader(btnSubmitEle);

    if (paymentGatewayType == stripeMethod) {
        $.ajax({
            url: route("patients.appointment-payment"),
            type: "POST",
            data: { appointmentId: appointmentId },
            success: function (result) {
                let sessionId = result.data.sessionId;
                stripe
                    .redirectToCheckout({
                        sessionId: sessionId,
                    })
                    .then(function (result) {
                        manageAjaxErrors(result);
                    });
            },
            error: function (result) {
                displayErrorMessage(result.responseJSON.message);
            },
            complete: function () {},
        });
    }

    return false;
});


listenClick(".payment-btn", function (event) {
    let appointmentId = $(this).attr("data-id");
    $("#paymentGatewayModal").modal("show").appendTo("body");
    $("#patientAppointmentId").val(appointmentId);
});

listen("hidden.bs.modal", "#paymentGatewayModal", function (e) {
    $("#patientPaymentForm")[0].reset();
    $("#paymentGatewayType").val(null).trigger("change");
});
