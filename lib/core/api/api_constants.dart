library api;

import 'dart:io';

import 'package:distributor_empower/utils/enum_classes.dart';

import '../../utils/device_info.dart';

String baseUrl = Environment.debug.value;

class ApiConstants {
  static const String basicToken = 'AB697893-C1BA-453B-8ABC-20EBF899D453-552C411E-0474-4A1F-9A9C-7785BEA5F39B';
  static const String authentication = 'Authentication/';
  static const String common = 'Common/';
  static const String user = 'User/';
  static const String dashboard = 'Dashboard/';
  static const String report = 'Report/';
  static const String entity = 'Entity/';
  static const String order = 'Order/';

  ///USER
  static const String login = '${user}UserLoginProcess';
  static const String getUserDetail = '${user}GetUserDetail';
  static const String userSetPin = '${user}UserSetPin';
  static const String generateJWToken = '${authentication}GenerateJWTToken';
  static const String logout = '${user}Logout';
  static const String sendOTP = '${user}SendOTP';
  static const String submitUserInfo = '${user}SubmitUserInformation';

  ///COMMON
  static const String checkServerStatus = '${common}CheckServerStatus';
  static const String getAllSetting = '${common}GetAllSetting';
  static const String getDropDownList = '${common}GetDropDownList';

  ///Dashboard
  static const String getDashboard = '${dashboard}GetDashboard';
  static const String getMenuList = '${dashboard}GetMenuList';

  ///Report
  static const String getReportMenuList = '${report}GetReportMenuList';
  static const String statementOfAccountReport = '${report}StatementOfAccountReport';
  static const String ageingReport = '${report}AgeingReport';
  static const String pendingOrderReport = '${report}PendingOrderReport';
  static const String getPendingOrderDetailByOrderNo = '${report}GetPendingOrderDetailByOrderNo';
  static const String getSaleInvoiceReport = '${report}SaleInvoiceReport';
  static const String getSaleInvoiceDetailByDocID = '${report}GetSaleInvoiceDetailByDocID';

  ///Entity
  static const String getEntityRecordList = '${entity}GetEntityRecordList';

  ///Order
  static const String getOrderList = '${order}GetOrderList';
  static const String getOrderDetails = '${order}GetOrderDetails';

  static Future<String> get getAppURL async {
    final appId = await getAppPackageName();
    return Platform.isAndroid ? 'https://play.google.com/store/apps/details?id=$appId' : 'https://apps.apple.com/app/id6467756019';
  }
}
