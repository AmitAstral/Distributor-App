import 'package:distributor_empower/core/api/api_caller.dart';
import 'package:distributor_empower/core/api/api_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/user_response.dart';

class ApiRepository extends ApiCaller {
  Future<UserResponse?> loginApi(
    ApiReqData req, {
    Function(String)? onApiError,
  }) async {
    var data = await executeApiCall<UserResponse>(
      apiCall: apiService.post(url: ApiConstants.login, data: req.toJson()),
      baseModel: UserResponse(),
      onApiError: onApiError,
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
