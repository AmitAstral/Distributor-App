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

  /// `My orders`
  String get myOrders {
    return Intl.message(
      'My orders',
      name: 'myOrders',
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

  /// `Distributor Name`
  String get distributorName {
    return Intl.message(
      'Distributor Name',
      name: 'distributorName',
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

  /// `Continue`
  String get continueLabel {
    return Intl.message(
      'Continue',
      name: 'continueLabel',
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

  /// `Astral code`
  String get astralCode {
    return Intl.message(
      'Astral code',
      name: 'astralCode',
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

  /// `The entered Astral code is invalid.`
  String get theEnteredOtpIsInvalid {
    return Intl.message(
      'The entered Astral code is invalid.',
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

  /// `Resend Astral code`
  String get resendOtp {
    return Intl.message(
      'Resend Astral code',
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

  /// `Verify Pin`
  String get verifyPin {
    return Intl.message(
      'Verify Pin',
      name: 'verifyPin',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Hello,`
  String get hello {
    return Intl.message(
      'Hello,',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {name}`
  String hiWithName(Object name) {
    return Intl.message(
      'Hi, $name',
      name: 'hiWithName',
      desc: '',
      args: [name],
    );
  }

  /// `Edit your profile`
  String get editYourProfile {
    return Intl.message(
      'Edit your profile',
      name: 'editYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `New update is available`
  String get newUpdateIsAvailable {
    return Intl.message(
      'New update is available',
      name: 'newUpdateIsAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Update Now`
  String get updateNow {
    return Intl.message(
      'Update Now',
      name: 'updateNow',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Credit Limit`
  String get creditLimit {
    return Intl.message(
      'Credit Limit',
      name: 'creditLimit',
      desc: '',
      args: [],
    );
  }

  /// `Used Credit`
  String get usedCredit {
    return Intl.message(
      'Used Credit',
      name: 'usedCredit',
      desc: '',
      args: [],
    );
  }

  /// `Remaining Credit`
  String get remainingCredit {
    return Intl.message(
      'Remaining Credit',
      name: 'remainingCredit',
      desc: '',
      args: [],
    );
  }

  /// `({name} Left)`
  String creditLeftWithAmount(Object name) {
    return Intl.message(
      '($name Left)',
      name: 'creditLeftWithAmount',
      desc: '',
      args: [name],
    );
  }

  /// `{name} %`
  String amountWithPercentage(Object name) {
    return Intl.message(
      '$name %',
      name: 'amountWithPercentage',
      desc: '',
      args: [name],
    );
  }

  /// `Total Order`
  String get totalOrder {
    return Intl.message(
      'Total Order',
      name: 'totalOrder',
      desc: '',
      args: [],
    );
  }

  /// `Dispatched Order`
  String get dispatchedOrder {
    return Intl.message(
      'Dispatched Order',
      name: 'dispatchedOrder',
      desc: '',
      args: [],
    );
  }

  /// `Authorized pending Order`
  String get authorizedPendingOrder {
    return Intl.message(
      'Authorized pending Order',
      name: 'authorizedPendingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized Pending Order`
  String get unauthorizedPendingOrder {
    return Intl.message(
      'Unauthorized Pending Order',
      name: 'unauthorizedPendingOrder',
      desc: '',
      args: [],
    );
  }

  /// `* amount in lacs`
  String get amountInLacs {
    return Intl.message(
      '* amount in lacs',
      name: 'amountInLacs',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message(
      'Reports',
      name: 'reports',
      desc: '',
      args: [],
    );
  }

  /// `No data found`
  String get noDataFound {
    return Intl.message(
      'No data found',
      name: 'noDataFound',
      desc: '',
      args: [],
    );
  }

  /// `SapCode : {name}`
  String sapcodeTitle(Object name) {
    return Intl.message(
      'SapCode : $name',
      name: 'sapcodeTitle',
      desc: '',
      args: [name],
    );
  }

  /// `Pending Order`
  String get pendingOrder {
    return Intl.message(
      'Pending Order',
      name: 'pendingOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order Date`
  String get orderDate {
    return Intl.message(
      'Order Date',
      name: 'orderDate',
      desc: '',
      args: [],
    );
  }

  /// `Order Amt.`
  String get orderAmount {
    return Intl.message(
      'Order Amt.',
      name: 'orderAmount',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Pending Order Details`
  String get pendingOrderDetails {
    return Intl.message(
      'Pending Order Details',
      name: 'pendingOrderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Item Name`
  String get itemName {
    return Intl.message(
      'Item Name',
      name: 'itemName',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `Order Qty.`
  String get orderQty {
    return Intl.message(
      'Order Qty.',
      name: 'orderQty',
      desc: '',
      args: [],
    );
  }

  /// `Pending Qty.`
  String get pendingQty {
    return Intl.message(
      'Pending Qty.',
      name: 'pendingQty',
      desc: '',
      args: [],
    );
  }

  /// `Pending Amt.`
  String get pendingAmt {
    return Intl.message(
      'Pending Amt.',
      name: 'pendingAmt',
      desc: '',
      args: [],
    );
  }

  /// `Ageing`
  String get ageing {
    return Intl.message(
      'Ageing',
      name: 'ageing',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance`
  String get currentBalance {
    return Intl.message(
      'Current Balance',
      name: 'currentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Available Credit`
  String get availableCredit {
    return Intl.message(
      'Available Credit',
      name: 'availableCredit',
      desc: '',
      args: [],
    );
  }

  /// `Statement of Accounts`
  String get statementOfAccounts {
    return Intl.message(
      'Statement of Accounts',
      name: 'statementOfAccounts',
      desc: '',
      args: [],
    );
  }

  /// `Party`
  String get partyWithName {
    return Intl.message(
      'Party',
      name: 'partyWithName',
      desc: '',
      args: [],
    );
  }

  /// `Narration`
  String get narration {
    return Intl.message(
      'Narration',
      name: 'narration',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Please select from date`
  String get pleaseSelectFromDate {
    return Intl.message(
      'Please select from date',
      name: 'pleaseSelectFromDate',
      desc: '',
      args: [],
    );
  }

  /// `Please select to date`
  String get pleaseSelectToDate {
    return Intl.message(
      'Please select to date',
      name: 'pleaseSelectToDate',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Sales Report`
  String get salesReport {
    return Intl.message(
      'Sales Report',
      name: 'salesReport',
      desc: '',
      args: [],
    );
  }

  /// `Invoice No.`
  String get invoiceNo {
    return Intl.message(
      'Invoice No.',
      name: 'invoiceNo',
      desc: '',
      args: [],
    );
  }

  /// `Sales Details`
  String get salesDetails {
    return Intl.message(
      'Sales Details',
      name: 'salesDetails',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get productName {
    return Intl.message(
      'Product Name',
      name: 'productName',
      desc: '',
      args: [],
    );
  }

  /// `Qty.`
  String get qty {
    return Intl.message(
      'Qty.',
      name: 'qty',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Debit`
  String get debit {
    return Intl.message(
      'Debit',
      name: 'debit',
      desc: '',
      args: [],
    );
  }

  /// `Credit`
  String get credit {
    return Intl.message(
      'Credit',
      name: 'credit',
      desc: '',
      args: [],
    );
  }

  /// `Division`
  String get division {
    return Intl.message(
      'Division',
      name: 'division',
      desc: '',
      args: [],
    );
  }

  /// `SAPCode`
  String get sapCode {
    return Intl.message(
      'SAPCode',
      name: 'sapCode',
      desc: '',
      args: [],
    );
  }

  /// `GSTNo`
  String get gstNo {
    return Intl.message(
      'GSTNo',
      name: 'gstNo',
      desc: '',
      args: [],
    );
  }

  /// `My Invoices`
  String get myInvoices {
    return Intl.message(
      'My Invoices',
      name: 'myInvoices',
      desc: '',
      args: [],
    );
  }

  /// `Total SKU`
  String get totalSku {
    return Intl.message(
      'Total SKU',
      name: 'totalSku',
      desc: '',
      args: [],
    );
  }

  /// `My Order`
  String get myOrder {
    return Intl.message(
      'My Order',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `Quick Order`
  String get quickOrder {
    return Intl.message(
      'Quick Order',
      name: 'quickOrder',
      desc: '',
      args: [],
    );
  }

  /// `Choose quantity`
  String get chooseQuantity {
    return Intl.message(
      'Choose quantity',
      name: 'chooseQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Version : v{name}`
  String versionWithversion(Object name) {
    return Intl.message(
      'Version : v$name',
      name: 'versionWithversion',
      desc: '',
      args: [name],
    );
  }

  /// `per piece`
  String get perPiece {
    return Intl.message(
      'per piece',
      name: 'perPiece',
      desc: '',
      args: [],
    );
  }

  /// `Knowledge Gallery`
  String get knowledgeGallery {
    return Intl.message(
      'Knowledge Gallery',
      name: 'knowledgeGallery',
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
