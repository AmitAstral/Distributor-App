import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/model/product_response.dart';
import 'package:flutter/material.dart';

class ProductProvider extends BaseProvider {
  List<FocusProduct?> focusProductList = [];
  List<ProductResponse?> favProductList = [];

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

  Future<void> addRemoveFromFav(String? id, String? action) async {
    try {
      final request = ApiReqData(itemId: id, action: action);
      await apiRep.addRemoveFromFav(request, onApiError);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<void> getFavProductList({loading = true}) async {
    isLoading.value = loading || favProductList.isEmpty;
    try {
      final request = ApiReqData.getUserDetails;
      final response = await apiRep.getFavProductList(request, onApiError);
      if (response.getIsSuccess) {
        favProductList = response.dataList ?? [];
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
