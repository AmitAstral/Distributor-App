import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/drop_down_response.dart';
import 'package:distributor_empower/model/order_details_response.dart';
import 'package:distributor_empower/model/order_response.dart';
import 'package:distributor_empower/model/product_group_model.dart';
import 'package:distributor_empower/model/product_model.dart';
import 'package:distributor_empower/model/product_sub_group_model.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
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
  List<ProductModel?> productList = [];
  List<ProductModel?> filteredProductList = [];

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

  Future<void> addToCartAPI() async {
    isButtonLoading = true;
    notifyListeners();
    try {
      final tempOrderList = productList
          .where(
        (element) => element?.qty.value != 0,
      )
          .map(
        (e) {
          return TempOrderItem(e?.id, (e?.qty.value ?? 0).toString()).toJson();
        },
      ).toList();

      final request = ApiReqData(
        tempOrderLists: tempOrderList,
      );
      final response = await apiRep.AddToCartAPI(request, onApiError);
      if (response.getIsSuccess) {
        //orderDetailsResponse = response.getData;
        BottomBarNavigationProvider().callGetUserDetails();
        AutoRouter.of(appContext).maybePop();
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isButtonLoading = false;
      notifyListeners();
    }
  }

  Future<void> removeProductFromCart({required String? productId}) async {
    try {
      final request = ApiReqData(
        tempOrderID: productId,
      );
      final response = await apiRep.removeProductFromCart(request, onApiError);
      if (response.getIsSuccess) {
        productList.removeWhere(
          (element) => element?.id == productId,
        );
        filteredProductList = productList;
        BottomBarNavigationProvider().callGetUserDetails();
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
        BottomBarNavigationProvider().callGetUserDetails();
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

  Future<void> getProductList(String? id) async {
    try {
      isLoading.value = true;
      final request = ApiReqData(
        productSubGroupId: id,
      );

      final response = await apiRep.getProductList(request, onApiError);
      if (response.getIsSuccess) {
        productList = response.dataList ?? [];
        filteredProductList = productList;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCartProductList({bool loading = true}) async {
    isLoading.value = loading;
    try {
      final response = await apiRep.getCartProductList(onApiError);
      if (response.getIsSuccess) {
        productList = response.dataList ?? [];
        filteredProductList = productList;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }

  void searchProducts(String? search) {
    filteredProductList = productList
        .where(
          (element) => (element?.description?.toLowerCase().contains(search?.toLowerCase() ?? '') ?? true),
        )
        .toList();
    notifyListeners();
  }

  Future<void> addRemoveFromFav(String? id, String? action) async {
    try {
      final request = ApiReqData(itemId: id, action: action);
      await apiRep.addRemoveFromFav(request, onApiError);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }
}
