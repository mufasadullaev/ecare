<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>@yield('title') | {{ getAppName() }}</title>
    <!-- Favicon -->
    <link rel="icon" href="{{ asset(getAppFavicon()) }}" type="image/png">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- General CSS Files -->

    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/third-party.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ mix('assets/css/pages.css') }}">

    @if (!Auth::user()->dark_mode)
        <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/style.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/skeleton.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/plugins.css') }}">
    @else
        <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/style-dark.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/skeleton-dark.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ asset('css/plugins.dark.css') }}">
        <link rel="stylesheet" type="text/css" href="{{ mix('assets/css/custom-pages-dark.css') }}">
    @endif

    <!-- Fonts -->
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />

    {{-- @livewireStyles --}}
    @routes
    @livewireStyles
    <link rel="stylesheet" type="text/css"
        href="{{ asset('vendor/rappasoft/livewire-tables/css/laravel-livewire-tables.min.css') }}">
    <link rel="stylesheet" type="text/css"
        href="{{ asset('vendor/rappasoft/livewire-tables/css/laravel-livewire-tables-thirdparty.min.css') }}">
    @livewireScripts
    <script src="https://js.stripe.com/v3/"></script>
    <script src="{{ mix('js/third-party.js') }}"></script>
    <script src="{{ mix('js/pages.js') }}"></script>
    <script src="{{ asset('vendor/rappasoft/livewire-tables/js/laravel-livewire-tables.min.js') }}"></script>
    <script src="{{ asset('vendor/rappasoft/livewire-tables/js/laravel-livewire-tables-thirdparty.min.js') }}"></script>
    @php
        $bloodGroupArr = json_encode(App\Models\Doctor::BLOOD_GROUP_ARRAY);
        $bloodGroupArr = html_entity_decode($bloodGroupArr);
    @endphp
    <script data-turbo-eval="false">
        let stripe = '';
        @if (config('services.stripe.key'))
            stripe = Stripe('{{ config('services.stripe.key') }}');
        @endif
        let usersRole = '{{ !empty(getLogInUser()->roles->first()) ? getLogInUser()->roles->first()->name : '' }}';
        let currencyIcon = '{{ getCurrencyIcon() }}';
        let isSetFirstFocus = true;
        let womanAvatar = '{{ url(asset('web/media/avatars/female.png')) }}';
        let manAvatar = '{{ url(asset('web/media/avatars/male.png')) }}';
        let changePasswordUrl = "{{ route('user.changePassword') }}";
        let updateLanguageURL = "{{ route('change-language') }}";
        let phoneNo = '';
        let dashboardChartBGColor = "{{ Auth::user()->dark_mode ? '#13151f' : '#FFFFFF' }}";
        let dashboardChartFontColor = "{{ Auth::user()->dark_mode ? '#FFFFFF' : '#000000' }}";
        let userRole = '{{ getLogInUser()->hasRole('patient') }}';
        let appointmentStripePaymentUrl = '{{ url('appointment-stripe-charge') }}';
        let checkLanguageSession = '{{ checkLanguageSession() }}'
        let noData = "{{ __('messages.common.no_data_available') }}"
        let defaultCountryCodeValue = "{{ getSettingValue('default_country_code') }}";
        let currentLoginUserId = "{{ getLogInUserId() }}";
        let prescriptionStatusRoute =
            "{{ isRole('doctor') ? 'doctors.prescription.status' : (isRole('patient') ? 'patients.prescription.status' : 'prescription.status') }}";
        let startcardStatusRoute =
            "{{ isRole('doctor') ? 'doctors.card.status' : (isRole('clinic_admin') ? 'card.status' : 'card.status') }}";
        let samartCardDelete =
            "{{ isRole('doctor') ? 'doctors.smart-patient-cards.destroy' : (isRole('clinic_admin') ? 'smart-patient-cards.destroy' : 'smart-patient-cards.destroy') }}";
        let GeneratePatientCardDelete =
            "{{ isRole('doctor') ? 'doctors.generate-patient-smart-cards.destroy' : (isRole('clinic_admin') ? 'generate-patient-smart-cards.destroy' : 'generate-patient-smart-cards.destroy') }}";
        let showPatientSmartCard =
            "{{ isRole('doctor') ? 'doctors.card.detail' : (isRole('patient') ? 'patients.card.detail' : (isRole('clinic_admin') ? 'card.detail' : 'card.detail')) }}";
        let smartCardQrCode =
            "{{ isRole('doctor') ? 'doctors.card.qr' : (isRole('patient') ? 'patients.card.qr' : (isRole('clinic_admin') ? 'card.qr' : 'card.qr')) }}";
        let bloodGroupArray = @json($bloodGroupArr);
        Lang.setLocale(checkLanguageSession);
    </script>
</head>
@php $styleCss = 'style'; @endphp

<body>
    <div class="d-flex flex-column flex-root">
        <div class="d-flex flex-row flex-column-fluid">
            @include('layouts.sidebar')
            <div class="wrapper d-flex flex-column flex-row-fluid">
                <div class='container-fluid d-flex align-items-stretch justify-content-between px-0'>
                    @include('layouts.header')
                </div>
                <div class='content d-flex flex-column flex-column-fluid pt-7'>
                    @yield('header_toolbar')
                    {{-- <div class='d-flex flex-column-fluid'> --}}
                    <div class="">
                        @yield('content')
                    </div>
                </div>
                <div class='container-fluid'>
                    @include('layouts.footer')
                </div>
            </div>
        </div>
        {{ Form::hidden('currentLanguage', getLoginUser()->language != null ? getLoginUser()->language : checkLanguageSession(), ['class' => 'currentLanguage']) }}
    </div>

    @include('profile.changePassword')
    @include('profile.email_notification')
    @include('profile.changelanguage')
</body>

</html>
