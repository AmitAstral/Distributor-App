import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  List<TabItem> get _tabItems => BottomNavigationEnum.values
      .map((e) =>
          TabItem(e.icon, e.label, AppColor.primaryColor, labelStyle: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold)))
      .toList();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BottomBarNavigationProvider(),
      child: Consumer<BottomBarNavigationProvider>(
        builder: (context, bottomNavigationBarProvider, child) {
          return Scaffold(
            drawer: const DrawerScreen(),
            key: bottomNavigationBarProvider.dashboardKey,
            body: Stack(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 60), child: AutoRouter()),
                Positioned(
                  bottom: 0,
                  child: CircularBottomNavigation(
                    _tabItems,
                    selectedCallback: (int? index) {
                      bottomNavigationBarProvider.setCurrentIndex(BottomNavigationEnum.values[index ?? 0]);
                    },
                    selectedPos: 0,
                    allowSelectedIconCallback: true,
                    controller: bottomNavigationBarProvider.navigationController,
                    barBackgroundColor: Colors.white,
                    backgroundBoxShadow: const <BoxShadow>[
                      BoxShadow(color: Colors.black45, blurRadius: 10.0),
                    ],
                    barHeight: 60,
                    iconsSize: 25,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
