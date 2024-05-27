import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
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
  final CircularBottomNavigationController _navigationController = CircularBottomNavigationController(0);

  List<TabItem> tabItems = List.of([
    TabItem(Icons.home, AppLocalizations.current.home, AppColor.primaryColor,
        labelStyle: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.normal)),
    TabItem(Icons.shopping_bag_sharp, AppLocalizations.current.cart, AppColor.primaryColor,
        labelStyle: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
    TabItem(Icons.person, AppLocalizations.current.profile, AppColor.primaryColor,
        labelStyle: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
    TabItem(Icons.settings, AppLocalizations.current.settings, AppColor.primaryColor,
        labelStyle: const TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold))
  ]);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BottomBarNavigationProvider(),
      child: Consumer<BottomBarNavigationProvider>(
        builder: (context, bottomProvider, child) {
          return Scaffold(
            body: Stack(
              children: [
                const Padding(padding: EdgeInsets.only(bottom: 60), child: AutoRouter()),
                Positioned(
                  bottom: 0,
                  child: CircularBottomNavigation(
                    tabItems,
                    selectedCallback: (int? index) {
                      _navigationController.value = index ?? 0;
                      if (index == 3) {
                        BottomBarNavigationProvider().setCurrentIndex(context, 0);
                      } else {
                        BottomBarNavigationProvider().setCurrentIndex(context, index ?? 0);
                      }
                    },
                    controller: _navigationController,
                    barBackgroundColor: Colors.white,
                    backgroundBoxShadow: const <BoxShadow>[
                      BoxShadow(color: Colors.black45, blurRadius: 10.0),
                    ],
                    barHeight: 60,
                    iconsSize: 25,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
