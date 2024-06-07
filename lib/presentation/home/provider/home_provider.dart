import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider extends BaseProvider {
  bool isLoading = false;
  DashboardResponse? dashboardData;

  Future<void> callGetDashboardAPI() async {
    isLoading = true;
    notifyListeners();
    try {
      dashboardData = null;
      final response = await apiRep.getDashboard(ApiReqData.getUserDetails, onApiError);
      if (response.getIsSuccess && response.getData != null) {
        dashboardData = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
