import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/order_details_response.dart';
import 'package:distributor_empower/model/pending_order_response.dart';
import 'package:flutter/material.dart';

class PendingOrderProvider extends BaseProvider {
  List<PendingOrderResponse?> pendingOrderListResponse = [];
  List<OrderDetailsResponse?> orderDetailsListResponse = [];

  Future<void> callPendingOrderListAPI({required bool isProgress}) async {
    isPaginationLoading = pageNo > 1;
    isLoading.value = isProgress;
    notifyListeners();
    try {
      final request = ApiReqData(pageNumber: pageNo.toString(), withUserInfo: true);
      final response = await apiRep.callPendingOrderListAPI(request, onApiError);
      final list = response.dataList ?? [];
      if (pageNo == 1) {
        pendingOrderListResponse = list;
      } else {
        pendingOrderListResponse.addAll(list);
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

  Future<void> callGetPendingOrderDetailByOrderNo(String? orderNo, {bool isProgress = true}) async {
    isLoading.value = isProgress;
    try {
      final request = ApiReqData(orderNo: orderNo, withUserInfo: true);
      final response = await apiRep.callGetPendingOrderDetailByOrderNo(request, onApiError);
      orderDetailsListResponse = response.dataList ?? [];
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }
}
