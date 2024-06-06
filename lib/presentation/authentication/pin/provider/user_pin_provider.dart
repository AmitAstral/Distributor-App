import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserPinProvider extends BaseProvider {

  Future<bool> setUserPin(ApiReqData req) async {
    try {
      isButtonLoading = true;
      notifyListeners();
      final response = await apiRep.setUserPin(req, onApiError: onApiError);
      return response.getIsSuccess;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isButtonLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<bool> verifyUserPin(ApiReqData req) async {
    try {
      isButtonLoading = true;
      notifyListeners();
      final response = await apiRep.setUserPin(req, onApiError: onApiError);
      return response.isSuccess ?? false;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      Future.delayed(const Duration(milliseconds: 500), () {
        isButtonLoading = false;
        notifyListeners();
      });
    }
    return false;
  }

  Future<String> sendOTP({bool isShowMessage = true}) async {
    try {
      isButtonLoading = true;
      notifyListeners();
      final response = await apiRep.sendOTP(req: ApiReqData.getUserDetails, onApiError: onApiError);
      if (isShowMessage) successToast(response.message ?? '');
      return response.dataStr ?? '';
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isButtonLoading = false;
      notifyListeners();
    }
    return '';
  }

  void generateJWTToken() async {
    try {
      final response = await apiRep.generateJWTToken(onApiError: onApiError);
      storage.authToken = response.dataStr ?? '';
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }
}
