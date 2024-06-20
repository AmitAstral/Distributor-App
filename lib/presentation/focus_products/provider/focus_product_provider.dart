import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:flutter/material.dart';

class FocusProductProvider extends BaseProvider {
  List<FocusProduct?> focusProductList = [];

  Future<void> getFocusProductsList({loading = true}) async {
    isLoading.value = loading;
    try {
      final request = ApiReqData.getUserDetails;
      final response = await apiRep.getFocusProductsList(request, onApiError);
      if (response.getIsSuccess) {
        focusProductList = response.dataList ?? [];
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }
}
