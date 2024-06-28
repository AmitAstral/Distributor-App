import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/send_OTP_model.dart';
import 'package:distributor_empower/utils/device_info.dart';
import 'package:distributor_empower/utils/providers/common_provider.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:flutter/material.dart';

class OTPVerificationProvider extends CommonProvider {
  bool isResendOTPButtonLoading = false;
  final ValueNotifier<bool> isDisable = ValueNotifier(true);

  Future<SendOtpModel?> sendOTP({bool isShowMessage = true}) async {
    try {
      if (isShowMessage) isResendOTPButtonLoading = true;
      notifyListeners();
      final response = await apiRep.sendOTP(req: ApiReqData.getUserDetails, onApiError: onApiError);
      if (isShowMessage) successToast(response.message ?? '');
      return response.getData;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isResendOTPButtonLoading = false;
      notifyListeners();
    }
    return null;
  }

  Future<bool> callSubmitUserInfo() async {
    isButtonLoading = true;
    notifyListeners();

    try {
      final deviceInfo = DeviceInfo();

      final request = UserDeviceToken(
        fcmID: storage.fcmToken,
        deviceName: await deviceInfo.getDeviceName,
        deviceType: deviceInfo.getDeviceType,
        modelName: await deviceInfo.getDeviceModelName,
        osVersion: await deviceInfo.getOsVersion,
        uuid: await deviceInfo.getUuid,
        sapCode: storage.userDetails.distributorSapCode,
        currentAppVersion: storage.currentAppVersion,
      );

      final response = await apiRep.submitUserInfo(request, onApiError: onApiError);

      if (response.getData != null) {
        storage.userDetails = response.getData!;
        await generateJWTToken();
      }
      return response.getIsSuccess;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isButtonLoading = false;
      notifyListeners();
    }
    return false;
  }
}
