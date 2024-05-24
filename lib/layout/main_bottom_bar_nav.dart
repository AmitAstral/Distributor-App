import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/presentation/dashboard/bottombar_navigation/provider/bottombar_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBottomBarNav extends StatelessWidget {
  MainBottomBarNav({super.key});

  final List<BottomNavigationBarItem> barItems = BottomBarNavigationProvider().navigationItems;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BottomBarNavigationProvider()),
      ],
      child: ChangeNotifierProvider.value(
        value: BottomBarNavigationProvider(),
        child: Consumer<BottomBarNavigationProvider>(
          builder: (context, bottomProvider, child) {
            return BottomNavigationBar(
              items: BottomBarNavigationProvider().navigationItems,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              backgroundColor: AppColor.primaryColor,
              currentIndex: BottomBarNavigationProvider().currentIndex,
              type: BottomNavigationBarType.fixed,
              fixedColor: AppColor.primaryColor,
              // backgroundColor: ThemeColors.primary,
              onTap: (index) {
                if (index == 3) {
                  BottomBarNavigationProvider().setCurrentIndex(context, 0);
                  Scaffold.of(context).openDrawer();
                } else {
                  BottomBarNavigationProvider().setCurrentIndex(context, index);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
