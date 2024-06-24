import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:flutter/material.dart';

class BottomBarNavigationProvider with ChangeNotifier {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  TabController? navigationController;

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  static BottomBarNavigationProvider? _instance;

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[currentIndex];

  void setCurrentBottomItem(BottomNavigationEnum bottomNavigationEnum) {
    if (appRouter.childControllers.firstOrNull?.topPage?.name == bottomNavigationEnum.route.routeName) return;
    currentIndex = bottomNavigationEnum.index;
    navigationController?.index = currentIndex;
    _onTap();
    notifyListeners();
  }

  void _onTap() {
    appRouter.pushAndPopUntil(currentNavigationEnum.route, predicate: (Route<dynamic> route) {
      return currentNavigationEnum.route == const HomeRoute() ? false : route.isFirst;
    // ignore: require_trailing_commas
    });
  }

  void selectHomePage() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (appRouter.childControllers.firstOrNull?.topPage?.name == BottomNavigationEnum.home.route.routeName &&
          currentIndex != BottomNavigationEnum.home.index) {
        currentIndex = BottomNavigationEnum.home.index;
        navigationController?.index = currentIndex;
        notifyListeners();
      }
    });
  }

  void closeDrawer() {
    BottomBarNavigationProvider().dashboardKey.currentState?.closeDrawer();
  }
}
