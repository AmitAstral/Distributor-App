import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/core/api/api_repositry.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BottomBarNavigationProvider with ChangeNotifier {
  int currentIndex = 0;
  ValueNotifier<int> drawerSelectedIndex = ValueNotifier(0);

  BuildContext currentContext = appContext;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  StackRouter get appRouter => AutoRouter.of(currentContext);

  TabController? navigationController;

  final getRouteNames = BottomNavigationEnum.values
      .map(
        (e) => e.route.routeName,
      )
      .toList();

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  static BottomBarNavigationProvider? _instance;

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[currentIndex];

  Future<void> setCurrentBottomItem(BottomNavigationEnum bottomNavigationEnum) async {
    if (appRouter.childControllers.firstOrNull?.topPage?.name == bottomNavigationEnum.route.routeName) return;
    if (appRouter.current.route.name == bottomNavigationEnum.route.routeName) return;

    if (bottomNavigationEnum == BottomNavigationEnum.home) {
      appRouter.popUntil(
        (route) => route.data?.route.name == bottomNavigationEnum.route.routeName,
      );
      return;
    } else if (currentIndex == bottomNavigationEnum.index) {
      appRouter.popUntil(
        (route) => route.data?.route.name == bottomNavigationEnum.route.routeName,
      );
      return;
    }

    currentIndex = bottomNavigationEnum.index;
    navigationController?.index = currentIndex;
    _setDrawerIndex();

    _onTap();
  }

  void _onTap() {
    appRouter.pushAndPopUntil(
      currentNavigationEnum.route,
      predicate: (Route<dynamic> route) {
        return currentNavigationEnum.route == BottomNavigationEnum.home ? false : route.isFirst /*getRouteNames.contains(route.data?.route.name)*/;
      },
    );
  }

  void updateCurrentTab(BottomNavigationEnum bottomNavigationEnum) {
    currentIndex = bottomNavigationEnum.index;
    navigationController?.index = currentIndex;
    _setDrawerIndex();
  }

  void closeDrawer() {
    dashboardKey.currentState?.closeDrawer();
  }

  void openDrawer() {
    dashboardKey.currentState?.openDrawer();
  }

  Future<void> callGetUserDetails() async {
    try {
      final response = await GetIt.I<ApiRepository>().getUserDetails();
      if (response.getIsSuccess && response.getData != null) {
        storage.userDetails = response.getData;
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
    } finally {
      notifyListeners();
    }
  }

  void _setDrawerIndex() {
    switch (currentNavigationEnum) {
      case BottomNavigationEnum.profile:
        drawerSelectedIndex.value = 1;
        break;
      default:
        drawerSelectedIndex.value = 0;
        break;
    }
  }
}
