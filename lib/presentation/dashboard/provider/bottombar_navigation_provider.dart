import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/home/screen/home_screen.dart';
import 'package:distributor_empower/presentation/offers/offers_screen.dart';
import 'package:distributor_empower/presentation/quick_order/quick_order_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarNavigationProvider with ChangeNotifier {
  static BottomBarNavigationProvider? _instance;
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[currentIndex];

  void setCurrentIndex(BottomNavigationEnum bottomNavigationEnum) {
    if (currentNavigationEnum == bottomNavigationEnum) return;
    currentIndex = bottomNavigationEnum.index;
    _onTap();
    notifyListeners();
  }

  _onTap() {
    appRouter.navigateNamed(currentNavigationEnum.routePath.routeName);
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
  profile(routePath: ProfileRoute(), icon: Icons.person_outline, label: 'Settings');

  final PageRouteInfo routePath;
  final IconData icon;
  final String label;

  const BottomNavigationEnum({
    required this.routePath,
    required this.icon,
    required this.label,
  });
}
