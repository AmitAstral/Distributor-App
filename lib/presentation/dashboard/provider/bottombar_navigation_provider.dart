import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';

class BottomBarNavigationProvider with ChangeNotifier {
  static BottomBarNavigationProvider? _instance;
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[currentIndex];

  final navigationController = CircularBottomNavigationController(0);

  void setCurrentIndex(BottomNavigationEnum bottomNavigationEnum) {
    if (currentNavigationEnum == bottomNavigationEnum) return;
    currentIndex = bottomNavigationEnum.index;
    navigationController.value = currentIndex;
    _onTap();
    notifyListeners();
  }

  _onTap() {
    appRouter.pushAndPopUntil(currentNavigationEnum.routePath, predicate: (Route<dynamic> route) {
      return route.isFirst;
    });
  }

  void unSelectAllTabs() {
    //currentIndex = -1;
    notifyListeners();
  }
}

enum BottomNavigationEnum {
  home(routePath: HomeRoute(), icon: Icons.home, label: 'Home'),
  cart(routePath: QuickOrderRoute(), icon: Icons.shopping_bag_sharp, label: 'Quick Order'),
  offers(routePath: OffersRoute(), icon: Icons.local_offer_rounded, label: 'Offers'),
  profile(routePath: ProfileRoute(), icon: Icons.person, label: 'Settings');

  final PageRouteInfo routePath;
  final IconData icon;
  final String label;

  const BottomNavigationEnum({
    required this.routePath,
    required this.icon,
    required this.label,
  });
}
