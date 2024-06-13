import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/report_menu_response.dart';
import 'package:flutter/cupertino.dart';

List<ReportMenuResponse?> reportMenuList = [];

class ReportProvider extends BaseProvider {
  Future<void> getReportMenuList() async {
    try {
      if (reportMenuList.isNotEmpty) return;
      isLoading.value = true;
      final response = await apiRep.getReportMenuList(ApiReqData.getUserDetails, onApiError);
      if (response.dataList?.isNotEmpty ?? false) {
        reportMenuList = response.dataList ?? [];
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
    }
  }
}
