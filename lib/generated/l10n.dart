// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Sales`
  String get sales {
    return Intl.message(
      'Sales',
      name: 'sales',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Offer`
  String get offer {
    return Intl.message(
      'Offer',
      name: 'offer',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Choose Quantity `
  String get chooseQty {
    return Intl.message(
      'Choose Quantity ',
      name: 'chooseQty',
      desc: '',
      args: [],
    );
  }

  /// `₹`
  String get rupees {
    return Intl.message(
      '₹',
      name: 'rupees',
      desc: '',
      args: [],
    );
  }

  /// `Sales Person`
  String get sales_person {
    return Intl.message(
      'Sales Person',
      name: 'sales_person',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get myOrders {
    return Intl.message(
      'My orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `Need help?`
  String get needHelp {
    return Intl.message(
      'Need help?',
      name: 'needHelp',
      desc: '',
      args: [],
    );
  }

  /// `Share the app`
  String get shareTheApp {
    return Intl.message(
      'Share the app',
      name: 'shareTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Schemes`
  String get schemes {
    return Intl.message(
      'Schemes',
      name: 'schemes',
      desc: '',
      args: [],
    );
  }

  /// `Party Name`
  String get partyName {
    return Intl.message(
      'Party Name',
      name: 'partyName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile No.`
  String get mobileNo {
    return Intl.message(
      'Mobile No.',
      name: 'mobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Order No`
  String get orderNo {
    return Intl.message(
      'Order No',
      name: 'orderNo',
      desc: '',
      args: [],
    );
  }

  /// `Order Value`
  String get orderValue {
    return Intl.message(
      'Order Value',
      name: 'orderValue',
      desc: '',
      args: [],
    );
  }

  /// `Order History`
  String get orderHistory {
    return Intl.message(
      'Order History',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To Astral`
  String get welcomeToAstral {
    return Intl.message(
      'Welcome To Astral',
      name: 'welcomeToAstral',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Phone Number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter Your Phone Number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Rate us on the app store`
  String get rateUsOnTheAppStore {
    return Intl.message(
      'Rate us on the app store',
      name: 'rateUsOnTheAppStore',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a Phone Number`
  String get validationEnterPhoneNumber {
    return Intl.message(
      'Please Enter a Phone Number',
      name: 'validationEnterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter a Valid Phone Number`
  String get validationPhoneNumber {
    return Intl.message(
      'Please Enter a Valid Phone Number',
      name: 'validationPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter SAP Code`
  String get enterSAPCode {
    return Intl.message(
      'Enter SAP Code',
      name: 'enterSAPCode',
      desc: '',
      args: [],
    );
  }

  /// `SAP Code`
  String get SAPCode {
    return Intl.message(
      'SAP Code',
      name: 'SAPCode',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Get OTP`
  String get getOTP {
    return Intl.message(
      'Get OTP',
      name: 'getOTP',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP`
  String get enterOTP {
    return Intl.message(
      'Enter OTP',
      name: 'enterOTP',
      desc: '',
      args: [],
    );
  }

  /// `Pin`
  String get pin {
    return Intl.message(
      'Pin',
      name: 'pin',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Pin`
  String get confirmPin {
    return Intl.message(
      'Confirm Pin',
      name: 'confirmPin',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Are you  sure you want to logout?`
  String get messageAreYouSureLogout {
    return Intl.message(
      'Are you  sure you want to logout?',
      name: 'messageAreYouSureLogout',
      desc: '',
      args: [],
    );
  }

  /// `Pin and confirm pin must be same`
  String get validatePinAndConfirmPin {
    return Intl.message(
      'Pin and confirm pin must be same',
      name: 'validatePinAndConfirmPin',
      desc: '',
      args: [],
    );
  }

  /// `SP Mobile Number`
  String get sPMobileNumber {
    return Intl.message(
      'SP Mobile Number',
      name: 'sPMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Forgot pin?`
  String get forgotPin {
    return Intl.message(
      'Forgot pin?',
      name: 'forgotPin',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, Please connect with Internet to use Application.`
  String get somethingWentWrongPleaseConnectWithInternetToUseApplication {
    return Intl.message(
      'Something went wrong, Please connect with Internet to use Application.',
      name: 'somethingWentWrongPleaseConnectWithInternetToUseApplication',
      desc: '',
      args: [],
    );
  }

  /// `Internet is not connected`
  String get internetIsNotConnected {
    return Intl.message(
      'Internet is not connected',
      name: 'internetIsNotConnected',
      desc: '',
      args: [],
    );
  }

  /// `The entered OTP is invalid.`
  String get theEnteredOtpIsInvalid {
    return Intl.message(
      'The entered OTP is invalid.',
      name: 'theEnteredOtpIsInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Set Pin`
  String get setPin {
    return Intl.message(
      'Set Pin',
      name: 'setPin',
      desc: '',
      args: [],
    );
  }

  /// `We sent OTP on`
  String get weSentOtpOn {
    return Intl.message(
      'We sent OTP on',
      name: 'weSentOtpOn',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP in`
  String get resendOtpIn {
    return Intl.message(
      'Resend OTP in',
      name: 'resendOtpIn',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOtp {
    return Intl.message(
      'Resend OTP',
      name: 'resendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `We're down for maintenance \n We'll be back soon...`
  String get wereDownForMaintenanceNWillBeBackSoon {
    return Intl.message(
      'We\'re down for maintenance \n We\'ll be back soon...',
      name: 'wereDownForMaintenanceNWillBeBackSoon',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
