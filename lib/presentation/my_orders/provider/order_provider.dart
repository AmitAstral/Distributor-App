import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/drop_down_response.dart';
import 'package:distributor_empower/model/order_details_response.dart';
import 'package:distributor_empower/model/order_response.dart';
import 'package:distributor_empower/model/product_group_model.dart';
import 'package:distributor_empower/model/product_sub_group_model.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:flutter/foundation.dart';

class OrderProvider extends BaseProvider {
  List<DropDownResponse?> dropDownList = [];
  List<OrderResponse?> orderListResponse = [];
  OrderDetailsResponse? orderDetailsResponse;
  DropDownResponse? selectedMenu;

  final searchValue = ValueNotifier('');

  List<ProductGroupModel?> productGroupList = [];
  List<ProductSubGroupModel?> productSubGroupList = [];
  var productList = [];

  bool isCategoryLoading = true;

  Future<void> callGetOrderListAPI(bool loading) async {
    isPaginationLoading = pageNo > 1;
    isLoading.value = loading;
    notifyListeners();
    try {
      final request = ApiReqData(
        timePeriod: selectedMenu?.value,
        pageNumber: pageNo.toString(),
      );
      final response = await apiRep.callGetOrderListAPI(request, onApiError);
      final list = response.dataList ?? [];
      if (pageNo == 1) {
        orderListResponse = list;
      } else {
        orderListResponse.addAll(list);
      }
      hasMore = list.isNotEmpty;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isPaginationLoading = false;
      isLoading.value = false;
      notifyListeners();
    }
  }

  Future<void> getDropDownList() async {
    try {
      isLoading.value = true;
      final request = ApiReqData(
        timePeriod: DropdownTypeEnum.MyOrderList.name,
      );
      final response = await apiRep.getDropDownList(request, onApiError);
      if (response.getIsSuccess) {
        pageNo = 1;
        dropDownList = response.dataList ?? [];
        selectedMenu = response.getData;
        callGetOrderListAPI(true);
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      isLoading.value = false;
    }
  }

  void updateSelectedMenu(DropDownResponse? menu) {
    selectedMenu = menu;
    callGetOrderListAPI(true);
  }

  Future<void> getOrderDetailsAPI({required String? orderId, bool loading = true}) async {
    try {
      isLoading.value = loading;
      final request = ApiReqData(
        orderId: orderId,
      );
      final response = await apiRep.getOrderDetailsAPI(request, onApiError);
      if (response.getIsSuccess) {
        orderDetailsResponse = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addToCartAPI({required String? productId, required String? qty}) async {
    try {
      final request = ApiReqData(
        orderId: productId,
      );
      final response = await apiRep.AddToCartAPI(request, onApiError);
      if (response.getIsSuccess) {
        //orderDetailsResponse = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      notifyListeners();
    }
  }

  Future<void> getCartProductList({bool loading = true}) async {
    isLoading.value = loading;
    try {
      final response = await apiRep.getCartProductList(onApiError);
      if (response.getIsSuccess) {
        //orderDetailsResponse = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }

  Future<void> removeProductFromCart({required String? productId}) async {
    try {
      final request = ApiReqData(
        orderId: productId,
      );
      final response = await apiRep.removeProductFromCart(request, onApiError);
      if (response.getIsSuccess) {
        //orderDetailsResponse = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      notifyListeners();
    }
  }

  Future<void> orderSaveAPI({required String? remarks}) async {
    try {
      final request = ApiReqData(
        orderId: remarks,
      );
      final response = await apiRep.orderSaveAPI(request, onApiError);
      if (response.getIsSuccess) {
        //orderDetailsResponse = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      notifyListeners();
    }
  }

  Future<void> getProductGroupsByCategories({required String? categoryId}) async {
    isLoading.value = true;
    try {
      final request = ApiReqData(
        categoryId: categoryId,
      );
      final response = await apiRep.getProductGroupsByCategories(request, onApiError);
      if (response.getIsSuccess) {
        productGroupList = response.dataList ?? [];
        getProductSubGroupList(
          productGroupId: response.getData?.id,
        );
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isCategoryLoading = false;
      notifyListeners();
    }
  }

  Future<void> getProductSubGroupList({
    required String? productGroupId,
    String? searchText,
    bool loading = true,
  }) async {
    isLoading.value = loading;
    try {
      final request = ApiReqData(
        productGroupId: productGroupId,
        search: searchText,
      );
      final response = await apiRep.getProductSubGroupList(request, onApiError);
      if (response.getIsSuccess) {
        productSubGroupList = response.dataList ?? [];
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }
}
