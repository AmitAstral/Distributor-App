import 'package:distributor_empower/core/api/api_caller.dart';
import 'package:distributor_empower/core/api/api_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/ageing_response.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/base/base_response.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/model/drop_down_response.dart';
import 'package:distributor_empower/model/entity_response.dart';
import 'package:distributor_empower/model/menu_response.dart';
import 'package:distributor_empower/model/order_details_response.dart';
import 'package:distributor_empower/model/order_response.dart';
import 'package:distributor_empower/model/pending_order_response.dart';
import 'package:distributor_empower/model/product_details_response.dart';
import 'package:distributor_empower/model/report_menu_response.dart';
import 'package:distributor_empower/model/sales_report_details.dart';
import 'package:distributor_empower/model/sales_report_response.dart';
import 'package:distributor_empower/model/setting_response.dart';
import 'package:distributor_empower/model/statement_response.dart';
import 'package:distributor_empower/model/user_response.dart';

class ApiRepository extends ApiCaller {
  Future<BaseResponse<UserResponse?>> loginApi(
    ApiReqData req, {
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall<UserResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.login, data: req.toJson()),
      baseModel: UserResponse(),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse<UserResponse?>> getUserDetails({
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall<UserResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getUserDetail, data: ApiReqData.getUserDetails.toJson()),
      baseModel: UserResponse(),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse> setUserPin(
    ApiReqData req, {
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.userSetPin, data: req.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse> generateJWTToken({
    String? pageName,
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.generateJWToken, data: ApiReqData.getUserDetails.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse> logoutUser({
    required ApiReqData req,
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.logout, data: req.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse> sendOTP({required UserInfo req, Function(String)? onApiError}) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.sendOTP, data: req.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse> checkServerStatus(Function(String) onApiError) async {
    var data = await executeApiCall(
      apiCall: apiService.get(endPoint: ApiConstants.checkServerStatus),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse> getAllSetting() async {
    var data = await executeApiCall<SettingResponse>(
        apiCall: apiService.post(endPoint: ApiConstants.getAllSetting, data: ApiReqData.getUserDetails.toJson()), baseModel: SettingResponse());

    if (data.getData != null) {
      storage.settingsData = data.getData;
    }
    return data;
  }

  Future<BaseResponse<UserResponse?>> submitUserInfo(UserDeviceToken request, {required Function(String errorRes) onApiError}) async {
    var data = await executeApiCall<UserResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.submitUserInfo, data: request.toJson()),
      onApiError: onApiError,
      baseModel: UserResponse(),
    );
    return data;
  }

  Future<BaseResponse<DashboardResponse?>> getDashboard(UserInfo request, Function(String) onApiError) async {
    var data = await executeApiCall<DashboardResponse>(
        apiCall: apiService.post(endPoint: ApiConstants.getDashboard, data: request.toJson()),
        onApiError: onApiError,
        baseModel: DashboardResponse());
    return data;
  }

  Future<BaseResponse<MenuResponse?>> getMenuList(UserInfo request, Function(String) onApiError) async {
    var data = await executeApiCall<MenuResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getMenuList, data: request.toJson()),
      onApiError: onApiError,
      baseModel: MenuResponse(),
    );
    return data;
  }

  Future<BaseResponse<ReportMenuResponse?>> getReportMenuList(UserInfo request, Function(String) onApiError) async {
    var data = await executeApiCall<ReportMenuResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getReportMenuList, data: request.toJson()),
      onApiError: onApiError,
      baseModel: ReportMenuResponse(),
    );
    return data;
  }

  Future<BaseResponse<StatementResponse?>> callStatementOfAccountAPI(ApiReqData request, Function(String) onApiError) async {
    var data = await executeApiCall<StatementResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.statementOfAccountReport, data: request.toJson()),
      onApiError: onApiError,
      baseModel: StatementResponse(),
    );
    return data;
  }

  Future<BaseResponse<AgeingResponse?>> callAgeingReport(Function(String) onApiError) async {
    var data = await executeApiCall<AgeingResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.ageingReport, data: ApiReqData.getUserDetails.toJson()),
      onApiError: onApiError,
      baseModel: AgeingResponse(),
    );
    return data;
  }

  Future<BaseResponse<PendingOrderResponse?>> callPendingOrderListAPI(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<PendingOrderResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.pendingOrderReport, data: request.toJson()),
      onApiError: onApiError,
      baseModel: PendingOrderResponse(),
    );
    return data;
  }

  Future<BaseResponse<ProductDetailsResponse?>> callGetPendingOrderDetailByOrderNo(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<ProductDetailsResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getPendingOrderDetailByOrderNo, data: request.toJson()),
      onApiError: onApiError,
      baseModel: ProductDetailsResponse(),
    );
    return data;
  }

  Future<BaseResponse<SalesReportResponse?>> callSaleInvoiceReportAPI(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<SalesReportResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getSaleInvoiceReport, data: request.toJson()),
      onApiError: onApiError,
      baseModel: SalesReportResponse(),
    );
    return data;
  }

  Future<BaseResponse<SalesReportDetailsResponse?>> callSalesReportDetails(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<SalesReportDetailsResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getSaleInvoiceDetailByDocID, data: request.toJson()),
      onApiError: onApiError,
      baseModel: SalesReportDetailsResponse(),
    );
    return data;
  }

  Future<BaseResponse<EntityResponse?>> callGetEntityListAPI(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<EntityResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getEntityRecordList, data: request.toJson()),
      onApiError: onApiError,
      baseModel: EntityResponse(),
    );
    return data;
  }

  Future<BaseResponse<OrderResponse?>> callGetOrderListAPI(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<OrderResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getOrderList, data: request.toJson()),
      onApiError: onApiError,
      baseModel: OrderResponse(),
    );
    return data;
  }

  Future<BaseResponse<DropDownResponse?>> getDropDownList(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<DropDownResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getDropDownList, data: request.toJson()),
      onApiError: onApiError,
      baseModel: DropDownResponse(),
    );
    return data;
  }

  Future<BaseResponse<OrderDetailsResponse?>> getOrderDetailsAPI(ApiReqData request, Function(String errorRes) onApiError) async {
    var data = await executeApiCall<OrderDetailsResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getOrderDetails, data: request.toJson()),
      onApiError: onApiError,
      baseModel: OrderDetailsResponse(),
    );
    return data;
  }
}
