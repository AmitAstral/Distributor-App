import 'package:auto_route/auto_route.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/drawer/drawer_screen.dart';
import 'package:distributor_empower/presentation/quick_order/bottom_sheet/checkout_bottom_sheet.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/bottom_tab_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends BaseStatefulWidget {
  const DashboardScreen({super.key});

  @override
  BaseState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends BaseState<DashboardScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    BottomBarNavigationProvider().navigationController ??= TabController(length: BottomNavigationEnum.values.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showUpdateDialog();
    });
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: BottomBarNavigationProvider(),
      child: Consumer<BottomBarNavigationProvider>(
        builder: (context, currentProvider, child) {
          return Scaffold(
            drawer: const DrawerScreen(),
            key: currentProvider.dashboardKey,
            floatingActionButton: FloatingActionButton(
              child: Stack(
                children: [
                  Center(child: Assets.icons.cart.svg(height: 28)),
                  if (storage.userDetails.cartBadge.tryParseToNum.toInt() > 0)
                    Positioned(
                      top: 1,
                      right: 2,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(color: AppColor.red, borderRadius: BorderRadius.circular(50)),
                        child: Center(
                          child: Text(
                            storage.userDetails.cartBadge ?? '0',
                            style: TextStyles.regular10,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onPressed: () {
                CheckoutBottomSheet.checkoutBottomSheetWidget(subGroupId: '', isCart: true);
              },
              backgroundColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.r)),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: ConvexAppBar.builder(
              count: 5,
              backgroundColor: AppColor.white,
              itemBuilder: BottomTabBuilder(),
              top: currentProvider.currentIndex == -1 ? 0 : -15,
              curveSize: currentProvider.currentIndex == -1 ? 0 : 50,
              controller: currentProvider.navigationController,
              onTap: (index) {
                currentProvider.setCurrentBottomItem(BottomNavigationEnum.values[index]);
              },
            ),
            body: const AutoRouter(
              inheritNavigatorObservers: false,
            ),
          );
        },
      ),
    );
  }

  void _showUpdateDialog() {
    if (storage.userDetails.isUpdateAvailable) CommonDialog.showUpdateAppDialog();
  }
}
