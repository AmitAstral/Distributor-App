// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "${name} %";

  static String m1(name) => "Carton Qty. ${name}";

  static String m2(name) => "(${name} Left)";

  static String m3(name) => "Hi, ${name}";

  static String m4(name) => "Items : ${name}";

  static String m5(name) => "SapCode : ${name}";

  static String m6(name) => " (Total Items ${name})";

  static String m7(name) => "(Total SKU - ${name})";

  static String m8(name) => "(Total SKU - ${name})";

  static String m9(name) => "Version : v${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "SAPCode": MessageLookupByLibrary.simpleMessage("SAP Code"),
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to cart"),
        "address": MessageLookupByLibrary.simpleMessage("Address"),
        "ageing": MessageLookupByLibrary.simpleMessage("Ageing"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "amountInLacs": MessageLookupByLibrary.simpleMessage("* amount in lacs"),
        "amountWithPercentage": m0,
        "areYouSureYouWantToConfirmOnceConfirmedIt":
            MessageLookupByLibrary.simpleMessage("Are you sure, you want to confirm ? Once confirmed, it cannot be canceled."),
        "areYouSureYouWantToDeleteThisProductFrom": MessageLookupByLibrary.simpleMessage("Are you sure you want to delete this product from cart?"),
        "astralCode": MessageLookupByLibrary.simpleMessage("Astral code"),
        "authorizedPendingOrder": MessageLookupByLibrary.simpleMessage("Authorized pending Order"),
        "availableCredit": MessageLookupByLibrary.simpleMessage("Available Credit"),
        "balance": MessageLookupByLibrary.simpleMessage("Balance"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartonQtyWIthNo": m1,
        "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
        "chooseQty": MessageLookupByLibrary.simpleMessage("Choose Quantity "),
        "chooseQuantity": MessageLookupByLibrary.simpleMessage("Choose quantity"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirmPin": MessageLookupByLibrary.simpleMessage("Confirm Pin"),
        "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
        "credit": MessageLookupByLibrary.simpleMessage("Credit"),
        "creditLeftWithAmount": m2,
        "creditLimit": MessageLookupByLibrary.simpleMessage("Credit Limit"),
        "currentBalance": MessageLookupByLibrary.simpleMessage("Current Balance"),
        "date": MessageLookupByLibrary.simpleMessage("Date"),
        "debit": MessageLookupByLibrary.simpleMessage("Debit"),
        "dispatchedOrder": MessageLookupByLibrary.simpleMessage("Dispatched Order"),
        "distributorName": MessageLookupByLibrary.simpleMessage("Distributor Name"),
        "division": MessageLookupByLibrary.simpleMessage("Division"),
        "editYourProfile": MessageLookupByLibrary.simpleMessage("Edit your profile"),
        "enterPhoneNumber": MessageLookupByLibrary.simpleMessage("Enter Phone Number"),
        "enterSAPCode": MessageLookupByLibrary.simpleMessage("Enter SAP Code"),
        "enterYourPhoneNumber": MessageLookupByLibrary.simpleMessage("Enter Your Phone Number"),
        "favourite": MessageLookupByLibrary.simpleMessage("Favourite"),
        "forgotPin": MessageLookupByLibrary.simpleMessage("Forgot pin?"),
        "gstNo": MessageLookupByLibrary.simpleMessage("GSTNo"),
        "hello": MessageLookupByLibrary.simpleMessage("Hello,"),
        "hiWithName": m3,
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "internetIsNotConnected": MessageLookupByLibrary.simpleMessage("Internet is not connected"),
        "invoiceNo": MessageLookupByLibrary.simpleMessage("Invoice No."),
        "itemName": MessageLookupByLibrary.simpleMessage("Item Name"),
        "itemNotFound": MessageLookupByLibrary.simpleMessage("Item not found"),
        "itemsWithNo": m4,
        "knowledgeGallery": MessageLookupByLibrary.simpleMessage("Knowledge Gallery"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "logout": MessageLookupByLibrary.simpleMessage("Log Out"),
        "messageAreYouSureLogout": MessageLookupByLibrary.simpleMessage("Are you  sure you want to logout?"),
        "mobileNo": MessageLookupByLibrary.simpleMessage("Mobile No."),
        "myCart": MessageLookupByLibrary.simpleMessage("My Cart"),
        "myInvoices": MessageLookupByLibrary.simpleMessage("My Invoices"),
        "myOrder": MessageLookupByLibrary.simpleMessage("My Order"),
        "myOrders": MessageLookupByLibrary.simpleMessage("My orders"),
        "narration": MessageLookupByLibrary.simpleMessage("Narration"),
        "newUpdateIsAvailable": MessageLookupByLibrary.simpleMessage("New update is available"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "noDataFound": MessageLookupByLibrary.simpleMessage("No data found"),
        "noInternetConnection": MessageLookupByLibrary.simpleMessage("No internet connection"),
        "offer": MessageLookupByLibrary.simpleMessage("Offer"),
        "orderAmount": MessageLookupByLibrary.simpleMessage("Order Amt."),
        "orderDate": MessageLookupByLibrary.simpleMessage("Order Date"),
        "orderDetails": MessageLookupByLibrary.simpleMessage("Order Details"),
        "orderNo": MessageLookupByLibrary.simpleMessage("Order No"),
        "orderQty": MessageLookupByLibrary.simpleMessage("Order Qty."),
        "orderValue": MessageLookupByLibrary.simpleMessage("Order Value"),
        "partyWithName": MessageLookupByLibrary.simpleMessage("Party"),
        "pendingAmt": MessageLookupByLibrary.simpleMessage("Pending Amt."),
        "pendingOrder": MessageLookupByLibrary.simpleMessage("Pending Order"),
        "pendingOrderDetails": MessageLookupByLibrary.simpleMessage("Pending Order Details"),
        "pendingQty": MessageLookupByLibrary.simpleMessage("Pending Qty."),
        "perPiece": MessageLookupByLibrary.simpleMessage("per piece"),
        "pin": MessageLookupByLibrary.simpleMessage("Pin"),
        "placeOrder": MessageLookupByLibrary.simpleMessage("Place Order"),
        "pleaseSelectFromDate": MessageLookupByLibrary.simpleMessage("Please select from date"),
        "pleaseSelectToDate": MessageLookupByLibrary.simpleMessage("Please select to date"),
        "price": MessageLookupByLibrary.simpleMessage("Price"),
        "productName": MessageLookupByLibrary.simpleMessage("Product Name"),
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "qty": MessageLookupByLibrary.simpleMessage("Qty."),
        "quickOrder": MessageLookupByLibrary.simpleMessage("Quick Order"),
        "rateUsOnTheAppStore": MessageLookupByLibrary.simpleMessage("Rate us on the app store"),
        "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
        "remainingCredit": MessageLookupByLibrary.simpleMessage("Remaining Credit"),
        "reports": MessageLookupByLibrary.simpleMessage("Reports"),
        "resendOtp": MessageLookupByLibrary.simpleMessage("Resend Astral code"),
        "rupees": MessageLookupByLibrary.simpleMessage("₹"),
        "sales": MessageLookupByLibrary.simpleMessage("Sales"),
        "salesDetails": MessageLookupByLibrary.simpleMessage("Sales Details"),
        "salesReport": MessageLookupByLibrary.simpleMessage("Sales Report"),
        "sapCode": MessageLookupByLibrary.simpleMessage("SAPCode"),
        "sapcodeTitle": m5,
        "schemes": MessageLookupByLibrary.simpleMessage("Schemes"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "seeAll": MessageLookupByLibrary.simpleMessage("See all"),
        "select": MessageLookupByLibrary.simpleMessage("Select"),
        "setPin": MessageLookupByLibrary.simpleMessage("Set Pin"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "somethingWentWrongPleaseConnectWithInternetToUseApplication":
            MessageLookupByLibrary.simpleMessage("Something went wrong, Please connect with Internet to use Application."),
        "statementOfAccounts": MessageLookupByLibrary.simpleMessage("Statement of Accounts"),
        "status": MessageLookupByLibrary.simpleMessage("Status"),
        "theEnteredOtpIsInvalid": MessageLookupByLibrary.simpleMessage("The entered Astral code is invalid."),
        "thisProductIsAlreadyAddedInTheCart": MessageLookupByLibrary.simpleMessage("This Product is Already added in The Cart"),
        "total": MessageLookupByLibrary.simpleMessage("Total"),
        "totalItemsName": m6,
        "totalOrder": MessageLookupByLibrary.simpleMessage("Total Order"),
        "totalSku": MessageLookupByLibrary.simpleMessage("Total SKU"),
        "totalSkuOrderproviderproductlistlength": m7,
        "totalSkuWithNo": m8,
        "unauthorizedPendingOrder": MessageLookupByLibrary.simpleMessage("Unauthorized Pending Order"),
        "unit": MessageLookupByLibrary.simpleMessage("Unit"),
        "updateNow": MessageLookupByLibrary.simpleMessage("Update Now"),
        "usedCredit": MessageLookupByLibrary.simpleMessage("Used Credit"),
        "validatePinAndConfirmPin": MessageLookupByLibrary.simpleMessage("Pin and confirm pin must be same"),
        "validationEnterPhoneNumber": MessageLookupByLibrary.simpleMessage("Please Enter a Phone Number"),
        "validationPhoneNumber": MessageLookupByLibrary.simpleMessage("Please Enter a Valid Phone Number"),
        "verify": MessageLookupByLibrary.simpleMessage("Verify"),
        "verifyPin": MessageLookupByLibrary.simpleMessage("Verify Pin"),
        "versionWithversion": m9,
        "welcomeToAstral": MessageLookupByLibrary.simpleMessage("Welcome To Astral"),
        "wereDownForMaintenanceNWillBeBackSoon": MessageLookupByLibrary.simpleMessage("We\'re down for maintenance \n We\'ll be back soon..."),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
