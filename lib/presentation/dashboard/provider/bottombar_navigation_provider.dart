import 'package:distributor_empower/core/di/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';

class BottomBarNavigationProvider with ChangeNotifier {
  static BottomBarNavigationProvider? _instance;
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  late final TabController navigationController;

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[currentIndex];

  void setCurrentBottomItem(BottomNavigationEnum bottomNavigationEnum) {
    //if (currentNavigationEnum == bottomNavigationEnum) return;
    currentIndex = bottomNavigationEnum.index;
    navigationController.index = currentIndex;
    _onTap();
    notifyListeners();
  }

  _onTap() {
    appRouter.pushAndPopUntil(currentNavigationEnum.route, predicate: (Route<dynamic> route) {
      return currentNavigationEnum.route == const HomeRoute() ? false : route.isFirst;
    });
  }

  void unSelectAllTabs() {
    /*currentIndex = -1;
    notifyListeners();*/
  }
}

enum BottomNavigationEnum {
  home(route: HomeRoute(), icon: Icons.home, label: 'Home'),
  cart(route: QuickOrderRoute(), icon: Icons.shopping_bag_sharp, label: 'Quick Order'),
  offers(route: OffersRoute(), icon: Icons.local_offer_rounded, label: 'Offers'),
  profile(route: ProfileRoute(), icon: Icons.person, label: 'Settings');

  final PageRouteInfo route;
  final IconData icon;
  final String label;

  const BottomNavigationEnum({
    required this.route,
    required this.icon,
    required this.label,
  });
}
