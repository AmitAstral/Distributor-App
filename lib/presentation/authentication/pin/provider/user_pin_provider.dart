import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/utils/device_info.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class UserPinProvider extends BaseProvider {
  bool resendOTPLoader = false;

  Future<bool> setUserPin(ApiReqData req) async {
    try {
      isButtonLoading = true;
      notifyListeners();
      final response = await apiRep.setUserPin(req, onApiError: onApiError);
      return response;
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
      return response;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isButtonLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<String> sendOTP({bool isShowMessage = true}) async {
    try {
      resendOTPLoader = true;
      notifyListeners();
      final response = await apiRep.sendOTP(req: getUserInfo, onApiError: onApiError);
      if (isShowMessage) successToast(response['responseMessage']);
      return response['data'].toString();
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      resendOTPLoader = false;
      notifyListeners();
    }
    return '';
  }

  void generateJWTToken() async {
    try {
      apiRep.generateJWTToken(onApiError: onApiError);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }
}
