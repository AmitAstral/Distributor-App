import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:flutter/material.dart';

class ProductProvider extends BaseProvider {
  List<FocusProduct?> focusProductList = [];

  Future<void> getFocusProductsList({loading = true}) async {
    isLoading.value = loading || focusProductList.isEmpty;
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
      notifyListeners();
    }
  }

  Future<void> addRemoveFromFav(FocusProduct? item) async {
    try {
      final request = ApiReqData(itemId: item?.id, action: item?.getRequireAction);
      await apiRep.addRemoveFromFav(request, onApiError);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }
}
