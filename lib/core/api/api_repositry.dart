import 'package:distributor_empower/core/api/api_caller.dart';
import 'package:distributor_empower/core/api/api_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/base/base_response.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
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
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.getAllSetting, data: ApiReqData.getUserDetails.toJson()),
    );
    return data;
  }

  Future<BaseResponse> submitUserInfo(UserDeviceToken request, {required Function(String errorRes) onApiError}) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.submitUserInfo, data: request.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<BaseResponse<DashboardResponse?>> getDashboard(UserInfo request, Function(String) onApiError) async {
    var data = await executeApiCall<DashboardResponse>(
      apiCall: apiService.post(endPoint: ApiConstants.getDashboard, data: request.toJson()),
      onApiError: onApiError,
      baseModel: DashboardResponse()
    );
    return data;
  }
}
