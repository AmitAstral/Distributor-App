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
  home(HomeRoute.name),
  cart(QuickOrderRoute.name),
  profile(HomeRoute.name),
  settings(HomeRoute.name);

  final String routePath;

  const BottomNavigationEnum(this.routePath);
}
