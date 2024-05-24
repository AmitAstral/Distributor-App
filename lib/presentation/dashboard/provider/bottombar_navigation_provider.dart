import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/presentation/home/screen/home_screen.dart';
import 'package:distributor_empower/presentation/offers/offers_screen.dart';
import 'package:distributor_empower/presentation/quick_order/quick_order_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum BottomBarNavigationItemName {
  home,
  offers,
  quickOrder,
  drawer,
}

double iconSize = 23.438.sp;

class _NavigationItem {
  _NavigationItem(String iconName, this.defaultRoutePath) {
    selectedIcon = _createIconFromAsset(iconName, true);
    unSelectedIcon = _createIconFromAsset(iconName, false);
  }

  Widget? selectedIcon;
  Widget? unSelectedIcon;
  final String defaultRoutePath;

  onTap(BuildContext context) {
    switch (defaultRoutePath) {
      case HomeRoute.name:
        BottomBarNavigationProvider().currentPage = const HomeScreen();
      case OffersRoute.name:
        BottomBarNavigationProvider().currentPage = const OffersScreen();
      case QuickOrderRoute.name:
        BottomBarNavigationProvider().currentPage = const QuickOrderScreen();
    }
  }

  Widget _createIconFromAsset(String iconName, bool selected) => Center(
        child: SvgPicture.asset(
          'assets/bottom_bar_icons/$iconName${selected ? '_selected' : ''}.svg',
          width: iconSize,
          height: iconSize,
        ),
      );
}

class BottomBarNavigationProvider with ChangeNotifier {
  static BottomBarNavigationProvider? _instance;
  late Map<BottomBarNavigationItemName, _NavigationItem> _mapNavigationIndex;
  int _currentIndex = 0;
  Widget currentPage = const HomeScreen();

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  BottomBarNavigationProvider._internal() {
    _instance = this;
    _mapNavigationIndex = {
      BottomBarNavigationItemName.home: _NavigationItem('home', HomeRoute.name),
      BottomBarNavigationItemName.offers: _NavigationItem('offers', OffersRoute.name),
      BottomBarNavigationItemName.quickOrder: _NavigationItem('wecare', QuickOrderRoute.name),
      BottomBarNavigationItemName.drawer: _NavigationItem('darwer', QuickOrderRoute.name),
    };
  }

  List<BottomNavigationBarItem> get navigationItems => _mapNavigationIndex.values
      .map(
        (item) => BottomNavigationBarItem(icon: item.unSelectedIcon!, label: '', activeIcon: item.selectedIcon, backgroundColor: AppColor.white),
      )
      .toList();

  int get currentIndex => _currentIndex;

  void setCurrentIndex(BuildContext context, int currentIndex) {
    if (_currentIndex == currentIndex) return;
    _currentIndex = currentIndex;
    _mapNavigationIndex.values.toList()[currentIndex].onTap(context);
    notifyListeners();
  }

  highLightItem(BottomBarNavigationItemName item) {
    Future.delayed(
      const Duration(milliseconds: 250),
      () {
        final int index = _mapNavigationIndex.keys.toList().indexOf(item);
        if (index == -1) {
          return;
        }
        if (index == currentIndex) {
          return;
        }
        _currentIndex = index;
        notifyListeners();
      },
    );
  }
}
