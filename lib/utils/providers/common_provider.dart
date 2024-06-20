import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/web_view_menu_response.dart';
import 'package:flutter/material.dart';

class CommonProvider extends BaseProvider {
  Future<bool> checkServerStatus() async {
    try {
      final response = await apiRep.checkServerStatus(onApiError);
      return response.isSuccess ?? false;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return false;
    }
  }

  Future<bool> getAllSetting() async {
    try {
      final response = await apiRep.getAllSetting();
      return response.isSuccess ?? false;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return false;
    }
  }

  Future<void> generateJWTToken() async {
    try {
      final response = await apiRep.generateJWTToken(onApiError: onApiError);
      storage.authToken = response.dataStr ?? '';
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<WebViewMenuResponse?> getWebViewMenuDetails({required String? type}) async {
    try {
      final request = ApiReqData(withUserInfo: true, entityType: type);
      final response = await apiRep.getWebViewMenuDetails(request, onApiError: onApiError);
      if (response.getIsSuccess) {
        return response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
    return null;
  }
}
