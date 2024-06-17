import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/order_details_response.dart';
import 'package:distributor_empower/model/pending_order_response.dart';
import 'package:flutter/material.dart';

class PendingOrderProvider extends BaseProvider {
  List<PendingOrderResponse?> pendingOrderListResponse = [];
  List<OrderDetailsResponse?> orderDetailsListResponse = [];

  Future<void> callPendingOrderListAPI({required bool isProgress}) async {
    isLoading.value = isProgress;
    try {
      final response = await apiRep.callPendingOrderListAPI(onApiError);
      pendingOrderListResponse = response.dataList ?? [];
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
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
