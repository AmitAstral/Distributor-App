import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/model/product_model.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:flutter/material.dart';

class ProductProvider extends BaseProvider {
  List<FocusProduct?> focusProductList = [];
  List<ProductModel?> favProductList = [];

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

  Future<void> addRemoveFromFav(String? itemId, String? action) async {
    try {
      final request = ApiReqData(itemId: itemId, action: action);
      apiRep.addRemoveFromFav(request, onApiError);
      favProductList.removeWhere(
        (element) => element?.itemId == itemId,
      );
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      notifyListeners();
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

  Future<bool> addToCartAPI() async {
    isButtonLoading = true;
    notifyListeners();
    try {
      final tempOrderList = favProductList
          .where(
        (element) => element?.qty.value != 0,
      )
          .map(
        (e) {
          return TempOrderItem(e?.itemId, (e?.qty.value ?? 0).toString()).toJson();
        },
      ).toList();

      final request = ApiReqData(
        tempOrderLists: tempOrderList,
      );
      final response = await apiRep.AddToCartAPI(request, onApiError);
      if (response.getIsSuccess) {
        BottomBarNavigationProvider().callGetUserDetails();
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
