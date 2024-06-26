import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/menu_response.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/home/provider/home_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/providers/common_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerScreen extends BaseStatefulWidget {
  const DrawerScreen({super.key});

  @override
  BaseState<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends BaseState<DrawerScreen> {
  int currentIndex = 0;

  @override
  Widget buildBody(BuildContext context) {
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
                padding: const EdgeInsets.only(left: 8, right: 8).w,
                child: IntrinsicWidth(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ProfileWidget(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8).w,
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
                              if (storage.userDetails.address?.isNotEmpty ?? false)
                                Text(
                                  storage.userDetails.address ?? '',
                                  maxLines: 3,
                                  style: TextStyles.regular11.copyWith(
                                    color: AppColor.white,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
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
                padding: const EdgeInsets.only(top: 18).h,
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
                  itemCount: mainMenuListData?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = mainMenuListData?[index];
                    return Container(
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
                            child: SvgPicture.network(
                              item?.menuIconURL ?? '',
                              height: 14.h,
                              width: 14.w,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item?.menuName ?? '',
                              style: TextStyles.semiBold15,
                            ),
                          ),
                        ],
                      ),
                    ).addGesture(
                      () {
                        setState(() {
                          currentIndex = index;
                        });
                        _drawerNavigation(item);
                      },
                    );
                  },
                ),
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

  Future<void> _drawerNavigation(MenuResponse? item) async {
    BottomBarNavigationProvider().closeDrawer();
    switch (item?.id) {
      case '1':
      //HOME
        break;
      case '2':
        BottomBarNavigationProvider().setCurrentBottomItem(BottomNavigationEnum.profile);
        break;
      case '3':
        BottomBarNavigationProvider().setCurrentBottomItem(BottomNavigationEnum.offers);
        break;
      case '4':
        //ORDER HISTORY
        appRouter.push(const OrderHistoryRoute());
        break;
      case '5':
        //REPORTS
        appRouter.push(ReportRoute());
        break;
      case '6':
        //Price List
        _redirectToWeb(item);
        break;
      case '7':
        //Knowledge Gallery
        appRouter.push(const KnowledgeGalleryRoute());
        break;
      case '8':
        //NEWS
        _redirectToWeb(item);
        break;
      case '9':
        //We CARE
        _redirectToWeb(item);
        break;
    }
  }

  Future<void> _redirectToWeb(MenuResponse? item) async {
    if (item?.entityType.ifBlank != null) {
      BottomBarNavigationProvider().closeDrawer();
      final webViewMenuResponse = await CommonProvider().getWebViewMenuDetails(type: item?.entityType);
      if (webViewMenuResponse?.menuRedairectURLIsPDF == '1') {
        appRouter.push(
          PDFViewerRoute(url: webViewMenuResponse?.menuRedairectURL ?? '', title: webViewMenuResponse?.name ?? ''),
        );
      } else if (webViewMenuResponse?.menuRedairectURLIsPDF == '0') {
        appRouter.push(
          CommonWebViewRoute(url: webViewMenuResponse?.menuRedairectURL ?? '', title: webViewMenuResponse?.name ?? ''),
        );
      }
    }
  }
}
