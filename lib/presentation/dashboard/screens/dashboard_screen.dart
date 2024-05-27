import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
import 'package:motion_tab_bar_v2/motion-tab-controller.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  late MotionTabBarController _motionTabBarController;

  @override
  void initState() {
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BottomBarNavigationProvider(),
      child: Consumer<BottomBarNavigationProvider>(
        builder: (context, bottomProvider, child) {
          return Scaffold(
            body: const AutoRouter(),
            bottomNavigationBar: MotionTabBar(
              controller: _motionTabBarController,
              icons: const [
                Icons.home,
                Icons.card_travel,
                Icons.person,
                Icons.settings,
              ],
              initialSelectedTab: AppLocalizations.current.home,
              useSafeArea: true,
              labels: [
                AppLocalizations.current.home,
                AppLocalizations.current.offer,
                AppLocalizations.current.favourite,
                '',
              ],
              tabIconColor: AppColor.grey,
              tabSelectedColor: AppColor.primaryColor,
              tabIconSelectedColor: AppColor.white,
              tabBarColor: AppColor.white,
              tabIconSize: 28.0,
              tabIconSelectedSize: 26.0,
              onTabItemSelected: (int index) {
                if (index == 3) {
                  BottomBarNavigationProvider().setCurrentIndex(context, 0);
                  //Scaffold.of(context).openDrawer();
                } else {
                  BottomBarNavigationProvider().setCurrentIndex(context, index);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
