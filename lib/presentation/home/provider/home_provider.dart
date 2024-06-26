import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/provider/base_provider.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/model/menu_response.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:flutter/cupertino.dart';

List<MenuResponse?>? mainMenuListData;
List<MenuResponse?>? profileMenuListData;

class HomeProvider extends BaseProvider {
  static HomeProvider? _instance;

  factory HomeProvider() => _instance ?? HomeProvider._internal();

  HomeProvider._internal() {
    _instance = this;
  }

  List<DashboardResponse?>? dashboardData;

  Future<void> callGetDashboardAPI() async {
    isLoading.value = dashboardData == null;
    try {
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

  Future<void> callGetUserDetails() async {
    try {
      final response = await apiRep.getUserDetails(onApiError: onApiError);
      if (response.getIsSuccess && response.getData != null) {
        storage.userDetails = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      notifyListeners();
    }
  }

  Future<void> callGetMenuList() async {
    try {
      if (mainMenuListData?.isNotEmpty ?? false) return;

      final mainMenuResponse = await apiRep.getMenuList(ApiReqData(menuType: MenuType.mainMenu.index), onApiError);
      if (mainMenuResponse.getIsSuccess && mainMenuResponse.getData != null) {
        mainMenuListData = mainMenuResponse.dataList;
      }

      final profileMenuResponse = await apiRep.getMenuList(ApiReqData(menuType: MenuType.profileMenu.index), onApiError);
      if (profileMenuResponse.getIsSuccess && profileMenuResponse.getData != null) {
        profileMenuListData = profileMenuResponse.dataList;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }

  void updateFavItem(FocusProduct? item) {
    try {
      dashboardData
          ?.firstWhere(
            (element) => element?.getViewType == DashboardViewType.focusProduct,
      )
          ?.focusProduct
          .firstWhere((element) => element?.id == item?.id)
          ?.isFavorite = item?.isFavorite ?? false;

      notifyListeners();
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    }
  }
}
