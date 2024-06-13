import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/model/menu_response.dart';
import 'package:flutter/cupertino.dart';

List<MenuResponse?>? menuListData;

class HomeProvider extends BaseProvider {
  List<DashboardResponse?>? dashboardData;

  Future<void> callGetDashboardAPI() async {
    isLoading.value = true;
    try {
      dashboardData = null;
      final response = await apiRep.getDashboard(ApiReqData.getUserDetails, onApiError);
      if (response.getIsSuccess && response.getData != null) {
        dashboardData = response.dataList;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading.value = false;
      notifyListeners();
    }
  }

  Future<void> callGetMenuList() async {
    try {
      if (menuListData?.isNotEmpty ?? false) return;

      final response = await apiRep.getMenuList(ApiReqData.getUserDetails, onApiError);
      if (response.getIsSuccess && response.getData != null) {
        menuListData = response.dataList;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }
}
