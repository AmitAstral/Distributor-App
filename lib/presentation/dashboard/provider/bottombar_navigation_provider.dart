import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:flutter/material.dart';

class BottomBarNavigationProvider with ChangeNotifier {
  int currentIndex = 0;

  BuildContext currentContext = appContext;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  StackRouter get appRouter => AutoRouter.of(currentContext);

  TabController? navigationController;

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  static BottomBarNavigationProvider? _instance;

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[currentIndex];

  Future<void> setCurrentBottomItem(BottomNavigationEnum bottomNavigationEnum) async {
    if (appRouter.childControllers.firstOrNull?.topPage?.name == bottomNavigationEnum.route.routeName) return;

    /*if (bottomNavigationEnum == BottomNavigationEnum.home) {
      if (currentIndex != bottomNavigationEnum.index) {
        selectHomePage();
      }
      appRouter.popUntil(
        (route) => route.isFirst,
      );
      return;
    }*/

    currentIndex = bottomNavigationEnum.index;
    navigationController?.index = currentIndex;
    _onTap();
    notifyListeners();
  }

  void _onTap() {
    AutoRouter.of(currentContext).pushAndPopUntil(
      currentNavigationEnum.route,
      predicate: (Route<dynamic> route) {
        return currentNavigationEnum.route == const HomeRoute() ? false : route.isFirst;
      },
    );
  }

  void selectHomePage() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (AutoRouter.of(appContext).childControllers.firstOrNull?.topPage?.name == BottomNavigationEnum.home.route.routeName &&
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

  void openDrawer() {
    BottomBarNavigationProvider().dashboardKey.currentState?.openDrawer();
  }
}
