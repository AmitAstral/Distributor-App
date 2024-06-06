import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int currentIndex = 0;

  List<dynamic> menuList = [
    {"name": "Home", "icon": Icons.home},
    {"name": "Profile", "icon": Icons.person_outline_rounded},
    {"name": "Schemes", "icon": Icons.account_tree_outlined},
    {"name": "My Orders", "icon": Icons.currency_rupee_sharp},
    {"name": "Analytics", "icon": Icons.shopping_cart_outlined},
    {"name": "Price List", "icon": Icons.add_shopping_cart_sharp},
    {"name": "Knowledge Gallery", "icon": Icons.lightbulb_outlined},
    {"name": "We Care", "icon": Icons.account_circle_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.6.sw,
      backgroundColor: AppColor.primaryColor,
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 17.h),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: AppColor.primaryColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileWidget(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.current.hiWithName(storage.userDetails.distributorName ?? ''),
                                maxLines: 1,
                                style: TextStyles.semiBold12.copyWith(
                                  color: AppColor.white,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (storage.userDetails.Address?.isNotEmpty ?? false)
                                Text(
                                  storage.userDetails.Address ?? '',
                                  maxLines: 3,
                                  style: TextStyles.regular11.copyWith(
                                    color: AppColor.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ).addGesture(
                () {
                  appRouter.maybePop();
                  BottomBarNavigationProvider().setCurrentBottomItem(BottomNavigationEnum.profile);
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.h),
                child: Opacity(
                  opacity: 0.30,
                  child: Container(
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: menuList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });
                          _drawerNavigation();
                        },
                        child: Container(
                          width: 1.sw,
                          padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 8.w, right: 8.w),
                          margin: EdgeInsets.only(top: 8.h),
                          decoration: index == currentIndex
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: const Alignment(-1.00, -0.00),
                                    end: const Alignment(1, 0),
                                    colors: [
                                      Colors.white.withOpacity(0),
                                      Colors.white,
                                    ],
                                  ),
                                )
                              : BoxDecoration(color: Colors.white.withOpacity(0.1)),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8.w, right: 25.w),
                                child: Icon(
                                  menuList[index]["icon"],
                                  color: AppColor.white,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  menuList[index]["name"],
                                  style: TextStyles.semiBold15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 8.h),
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF8FAFB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 25.w),
                        child: Assets.icons.logOut.svg(
                          height: 18.spMin,
                          width: 18.spMin,
                        ),
                      ),
                      Text(
                        AppLocalizations.current.logout,
                        style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                      ),
                    ],
                  ),
                ),
              ).addGesture(
                () {
                  CommonDialog.showCommonDialog(
                    title: AppLocalizations.current.messageAreYouSureLogout,
                    positiveTitle: AppLocalizations.current.yes,
                    negativeTitle: AppLocalizations.current.no,
                    onPositivePressed: () {
                      storage.logout();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _drawerNavigation() {
    switch (currentIndex) {
      case 0:
        Navigator.pop(context);
        break;
      case 1:
        Navigator.pop(context);
        BottomBarNavigationProvider().setCurrentBottomItem(BottomNavigationEnum.profile);
        break;
      case 2:
        // context.router.pushNamed(ProfileScreen.routeName);
        break;
      case 3:
        Navigator.pop(context);
        appRouter.pushNamed(OrderHistoryRoute.name);
        break;
      case 4:
        // context.router.pushNamed(ProfileScreen.routeName);
        break;
      case 5:
        // context.router.pushNamed(ProfileScreen.routeName);
        break;
      case 6:
        // context.router.pushNamed(ProfileScreen.routeName);
        break;
      case 7:
        // context.router.pushNamed(ProfileScreen.routeName);
        break;
    }
  }
}
