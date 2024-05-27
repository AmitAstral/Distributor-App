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
  int _currentIndex = 0;

  final GlobalKey<ScaffoldState> dashboardKey = GlobalKey();

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  BottomBarNavigationProvider._internal() {
    _instance = this;
  }

  BottomNavigationEnum get currentNavigationEnum => BottomNavigationEnum.values[_currentIndex];

  void setCurrentIndex(BottomNavigationEnum bottomNavigationEnum) {
    if (currentNavigationEnum == bottomNavigationEnum) return;
    _currentIndex = bottomNavigationEnum.index;
    _onTap();
    notifyListeners();
  }

  _onTap() {
    appRouter.navigateNamed(currentNavigationEnum.routePath);
  }
}

enum BottomNavigationEnum {
  home(routePath: HomeRoute.name, icon: Icons.home, label: 'Home'),
  cart(routePath: QuickOrderRoute.name, icon: Icons.shopping_bag_sharp, label: 'Quick Order'),
  offers(routePath: OffersRoute.name, icon: Icons.local_offer_rounded, label: 'Offers'),
  profile(routePath: ProfileRoute.name, icon: Icons.person_outline, label: 'Settings');

  final String routePath;
  final IconData icon;
  final String label;

  const BottomNavigationEnum({
    required this.routePath,
    required this.icon,
    required this.label,
  });
}
