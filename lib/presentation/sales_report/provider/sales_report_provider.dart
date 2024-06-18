import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/sales_report_details.dart';
import 'package:distributor_empower/model/sales_report_response.dart';
import 'package:flutter/material.dart';

class SalesReportProvider extends BaseProvider {
  List<SalesReportResponse?> salesListResponse = [];
  SalesReportDetailsResponse? salesReportDetails;

  Future<void> callSalesReportListAPI(String? fromDate, String? toDate, bool loading) async {
    isPaginationLoading = pageNo > 1;
    isLoading.value = loading;
    notifyListeners();
    try {
      final request = ApiReqData(fromDate: fromDate, toDate: toDate, pageNumber: pageNo.toString(), withUserInfo: true);
      final response = await apiRep.callSaleInvoiceReportAPI(request, onApiError);
      final list = response.dataList ?? [];
      if (pageNo == 1) {
        salesListResponse = list;
      } else {
        salesListResponse.addAll(list);
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

  Future<void> callSalesReportDetails(String? invoiceNo) async {
    isLoading.value = true;
    try {
      final request = ApiReqData(docID: invoiceNo, withUserInfo: true);
      final response = await apiRep.callSalesReportDetails(request, onApiError);
      salesReportDetails = response.getData;
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }
}
