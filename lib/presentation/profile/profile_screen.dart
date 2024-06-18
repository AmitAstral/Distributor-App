import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/api/api_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        BottomBarNavigationProvider().selectHomePage();
      },
      child: Scaffold(
          backgroundColor: AppColor.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: AppBarWidget(
              toolbarHeight: AppBar().preferredSize.height,
              title: Text(
                AppLocalizations.current.profile,
                maxLines: 1,
                style: TextStyles.semiBold15,
              ),
              centerTitle: true,
              elevation: 0,
              flexibleSpace: null,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      ProfileWidget(
                        width: 45.h,
                        height: 45.h,
                      ),
                      9.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.current.hiWithName(storage.userDetails.distributorName ?? ''),
                              maxLines: 2,
                              style: TextStyles.semiBold16.copyWith(
                                color: AppColor.textSecondary,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              storage.userDetails.address ?? '',
                              style: TextStyles.semiBold10.copyWith(
                                color: AppColor.hintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  15.verticalSpace,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildInfoView(AppLocalizations.current.division, storage.userDetails.divisionID)),
                      Expanded(child: _buildInfoView(AppLocalizations.current.sapCode, storage.userDetails.distributorSapCode)),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildInfoView(AppLocalizations.current.gstNo, storage.userDetails.gstNo)),
                      Expanded(child: _buildInfoView(AppLocalizations.current.mobileNo, storage.userDetails.distributorMobileNumber)),
                    ],
                  ),
                  15.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8FAFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              10.verticalSpace,
                              Assets.icons.cart.svg(color: AppColor.black),
                              10.verticalSpace,
                              Text(
                                AppLocalizations.current.myOrders,
                                textAlign: TextAlign.center,
                                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                              ),
                              10.verticalSpace
                            ],
                          ),
                        ).addGesture(
                          () {
                            appRouter.push(const OrderHistoryRoute());
                          },
                        ),
                      ),
                      15.horizontalSpace,
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8FAFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              10.verticalSpace,
                              Assets.icons.cart.svg(color: AppColor.black),
                              10.verticalSpace,
                              Text(
                                AppLocalizations.of(context).myInvoices,
                                textAlign: TextAlign.center,
                                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                              ),
                              10.verticalSpace
                            ],
                          ),
                        ),
                      ),
                      15.horizontalSpace,
                      /*Expanded(
                        flex: 3,
                        child: Container(
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF8FAFB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Column(
                            children: [
                              10.verticalSpace,
                              Assets.icons.cart.svg(color: AppColor.black),
                              10.verticalSpace,
                              Text(
                                AppLocalizations.current.settings,
                                textAlign: TextAlign.center,
                                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                              ),
                              10.verticalSpace
                            ],
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  15.verticalSpace,
                  Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF8FAFB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 15.w),
                          child: Row(
                            children: [
                              Assets.icons.aboutUs.svg(
                                height: 15.w,
                                width: 15.w,
                              ),
                              15.horizontalSpace,
                              Expanded(
                                child: Text(
                                  AppLocalizations.current.aboutUs,
                                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color(0xFFB4B6C2),
                                size: 18.sp,
                              )
                            ],
                          ),
                        ).addGesture(
                          () {
                            appRouter.push(CommonWebViewRoute(url: 'https://www.astralpipes.com/'));
                          },
                        ),
                        Container(
                          width: 1.sw,
                          height: 1,
                          decoration: const BoxDecoration(color: Color(0xFFEAF0F3)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                          child: Row(
                            children: [
                              Assets.icons.faq.svg(
                                height: 15.w,
                                width: 15.w,
                              ),
                              15.horizontalSpace,
                              Expanded(
                                child: Text(
                                  AppLocalizations.current.faqs,
                                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color(0xFFB4B6C2),
                                size: 18.sp,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 1.sw,
                          height: 1,
                          decoration: const BoxDecoration(color: Color(0xFFEAF0F3)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                          child: Row(
                            children: [
                              Assets.icons.needHelp.svg(
                                height: 15.w,
                                width: 15.w,
                              ),
                              15.horizontalSpace,
                              Expanded(
                                child: Text(
                                  AppLocalizations.current.needHelp,
                                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color(0xFFB4B6C2),
                                size: 18.sp,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 1.sw,
                          height: 1,
                          decoration: const BoxDecoration(color: Color(0xFFEAF0F3)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                          child: Row(
                            children: [
                              Assets.icons.share.svg(
                                height: 15.w,
                                width: 15.w,
                              ),
                              15.horizontalSpace,
                              Expanded(
                                child: Text(
                                  AppLocalizations.current.shareTheApp,
                                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color(0xFFB4B6C2),
                                size: 18.sp,
                              )
                            ],
                          ),
                        ).addGesture(
                          () async {
                            await Share.share('Please checkout distributor app');
                          },
                        ),
                        Container(
                          width: 1.sw,
                          height: 1,
                          decoration: const BoxDecoration(color: Color(0xFFEAF0F3)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                          child: Row(
                            children: [
                              Assets.icons.rateUs.svg(
                                height: 15.w,
                                width: 15.w,
                              ),
                              15.horizontalSpace,
                              Expanded(
                                child: Text(
                                  AppLocalizations.current.rateUsOnTheAppStore,
                                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: const Color(0xFFB4B6C2),
                                size: 18.sp,
                              )
                            ],
                          ),
                        ).addGesture(
                          () async {
                            await launchUrlString(await ApiConstants.getAppURL);
                          },
                        ),
                      ],
                    ),
                  ),
                  25.verticalSpace,
                  Container(
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF8FAFB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                      child: Row(
                        children: [
                          Assets.icons.logOut.svg(
                            height: 15.w,
                            width: 15.w,
                          ),
                          15.horizontalSpace,
                          Expanded(
                            child: Text(
                              AppLocalizations.current.logout,
                              style: TextStyles.regular14.copyWith(color: AppColor.textSecondary),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color(0xFFB4B6C2),
                            size: 18.sp,
                          )
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
                  50.verticalSpace,
                  Text(
                    'Version : v${storage.currentAppVersion}',
                    style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget _buildInfoView(String? title, String? value) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        margin: const EdgeInsets.only(bottom: 5, right: 5).h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF8FAFB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title : ",
              style: TextStyles.regular10.copyWith(color: AppColor.hintTextColor),
            ),
            const Spacer(),
            Expanded(
              flex: 60,
              child: Text(
                value ?? '',
                style: TextStyles.semiBold10.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ],
        ));
  }
}
