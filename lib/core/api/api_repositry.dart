import 'package:distributor_empower/core/api/api_caller.dart';
import 'package:distributor_empower/core/api/api_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/user_response.dart';
import 'package:distributor_empower/utils/device_info.dart';

class ApiRepository extends ApiCaller {
  Future<UserResponse?> loginApi(
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

  Future<bool> setUserPin(
    ApiReqData req, {
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.userSetPin, data: req.toJson()),
      onApiError: onApiError,
    );
    return data['result'];
  }

  Future<dynamic> generateJWTToken({
    String? pageName,
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.generateJWToken, data: ApiReqData.getUserDetails.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<dynamic> logoutUser({
    required ApiReqData req,
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.logout, data: req.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<dynamic> sendOTP({required UserInfo req, Function(String)? onApiError}) async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.sendOTP, data: req.toJson()),
      onApiError: onApiError,
    );
    return data;
  }

  Future<dynamic> checkServerStatus(Function(String) onApiError) async {
    var data = await executeApiCall(
      apiCall: apiService.get(endPoint: ApiConstants.checkServerStatus),
      onApiError: onApiError,
    );
    return data;
  }

  Future<dynamic> getAllSetting() async {
    var data = await executeApiCall(
      apiCall: apiService.post(endPoint: ApiConstants.getAllSetting, data: ApiReqData.getUserDetails.toJson()),
    );
    return data;
  }

/*Future<List<UserResponse?>?> getUserListing({
    required Function(String errorRes) onApiError,
  }) async {
    var data = await executeApiCallForList<UserResponse>(
      apiCall: apiCaller.get(
        url: getUserListingAPI,
        queryParams: APIReqData(page: 1).toJson(),
      ),
      onApiError: onApiError,
      baseModel: UserResponse(),
    );
    return data;
  }*/
}
