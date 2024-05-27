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

enum BottomBarNavigationItemName {
  home,
  offers,
  quickOrder,
  drawer,
}

double iconSize = 23.438.sp;

class NavigationItem {
  NavigationItem(String iconName, String name, this.defaultRoutePath) {
    selectedIcon = _createIconFromAsset(iconName, true);
    unSelectedIcon = _createIconFromAsset(iconName, false);
  }

  Widget? selectedIcon;
  Widget? unSelectedIcon;
  String? name;
  final String defaultRoutePath;

  onTap(BuildContext context) {
    appRouter.navigateNamed(defaultRoutePath);
  }

  Widget _createIconFromAsset(String iconName, bool selected) => Center(
        child: selected
            ? Container(
                decoration: BoxDecoration(color: AppColor.primaryColor, borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(
                  'assets/bottom_bar_icons/$iconName${selected ? '_selected' : ''}.svg',
                  width: iconSize,
                  height: iconSize,
                  color: AppColor.white,
                ),
              )
            : SvgPicture.asset(
                'assets/bottom_bar_icons/$iconName${selected ? '_selected' : ''}.svg',
                width: iconSize,
                height: iconSize,
                color: selected ? Colors.red : AppColor.lightGrey,
              ),
      );
}

class BottomBarNavigationProvider with ChangeNotifier {
  static BottomBarNavigationProvider? _instance;
  late List<NavigationItem> navigationItem;
  int _currentIndex = 0;
  Widget currentPage = const HomeScreen();

  factory BottomBarNavigationProvider() => _instance ?? BottomBarNavigationProvider._internal();

  BottomBarNavigationProvider._internal() {
    _instance = this;
    navigationItem = [
      NavigationItem('home', AppLocalizations.current.home, HomeRoute.name),
      NavigationItem('offers', AppLocalizations.current.offer, OffersRoute.name),
      NavigationItem('wecare', AppLocalizations.current.favourite, QuickOrderRoute.name),
      NavigationItem('darwer', '', QuickOrderRoute.name),
    ];
  }

  int get currentIndex => _currentIndex;

  void setCurrentIndex(BuildContext context, int currentIndex) {
    if (_currentIndex == currentIndex) return;
    _currentIndex = currentIndex;
    navigationItem.toList()[currentIndex].onTap(context);
    notifyListeners();
  }

/*highLightItem(BottomBarNavigationItemName item) {
    Future.delayed(
      const Duration(milliseconds: 250),
      () {
        final int index = _mapNavigationIndex.toList().indexOf(item);
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
  }*/
}
