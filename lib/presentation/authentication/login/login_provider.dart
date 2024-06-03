import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';

class LoginProvider extends BaseProvider {
  bool isLoading = false;

  Future<bool> callLoginAPI(String sapCode) async {
    isLoading = true;
    notifyListeners();

    final response = await apiRep.loginApi(ApiReqData(sapCode: sapCode), onApiError: onApiError);

    isLoading = false;
    notifyListeners();

    if (response != null) {
      storage.userDetails = response;
      return true;
    }
    return false;
  }
}
