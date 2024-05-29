import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/drawer/drawer_screen.dart';
import 'package:distributor_empower/widgets/bottom_tab_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    BottomBarNavigationProvider().navigationController = TabController(length: BottomNavigationEnum.values.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BottomBarNavigationProvider(),
      child: Consumer<BottomBarNavigationProvider>(
        builder: (context, currentProvider, child) {
          return Scaffold(
            drawer: const DrawerScreen(),
            key: currentProvider.dashboardKey,
            bottomNavigationBar: ConvexAppBar.builder(
              count: 4,
              backgroundColor: AppColor.white,
              itemBuilder: BottomTabBuilder(),
              top: currentProvider.currentIndex == -1 ? 0 : -15,
              curveSize: currentProvider.currentIndex == -1 ? 0 : 50,
              controller: currentProvider.navigationController,
              onTap: (index) {
                currentProvider.setCurrentBottomItem(BottomNavigationEnum.values[index]);
              },
            ),
            body: WillPopScope(
                onWillPop: () {
                  debugPrint('HERE WILL POP SCOPE');
                  return Future.value(true);
                },
                child: const AutoRouter()),
          );
        },
      ),
    );
  }
}
