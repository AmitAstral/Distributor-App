import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<BottomNavigationBarItem> barItems = BottomBarNavigationProvider().navigationItems;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BottomBarNavigationProvider(),
      child: Consumer<BottomBarNavigationProvider>(
        builder: (context, bottomProvider, child) {
          return Scaffold(
              body: const AutoRouter(),
              bottomNavigationBar: MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(value: BottomBarNavigationProvider()),
                ],
                child: BottomNavigationBar(
                  items: BottomBarNavigationProvider().navigationItems,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: AppColor.white,
                  elevation: 1.3,
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
                ),
              ));
        },
      ),
    );
  }
}
