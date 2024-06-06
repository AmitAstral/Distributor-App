import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';

class LoginProvider extends BaseProvider {
  Future<bool> callLoginAPI(String sapCode) async {
    isButtonLoading = true;
    notifyListeners();

    final response = await apiRep.loginApi(ApiReqData(sapCode: sapCode), onApiError: onApiError);

    isButtonLoading = false;
    notifyListeners();

    if (response.getData != null) {
      storage.userDetails = response.getData!;
    }
    return response.getIsSuccess;
  }
}
