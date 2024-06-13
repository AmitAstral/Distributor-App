import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/report_menu_response.dart';
import 'package:distributor_empower/presentation/reports/report_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  final _reportProvider = ReportProvider();

  ReportScreen({super.key}) {
    _reportProvider.getReportMenuList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          titleText: AppLocalizations.current.reports,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _reportProvider,
        child: Consumer<ReportProvider>(builder: (context, provider, child) {
          return ProgressWidget(
            inAsyncCall: provider.isLoading.value,
            child: reportMenuList.isEmpty && !provider.isLoading.value
                ? const NoDataFoundWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 10).w,
                    child: GridView.builder(
                      itemCount: reportMenuList.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 20.w,
                      ),
                      itemBuilder: (context, index) {
                        final item = reportMenuList[index];
                        return Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16).w,
                              margin: const EdgeInsets.symmetric(horizontal: 20).w,
                              decoration: BoxDecoration(
                                color: const Color(0xffEEF1FA),
                                borderRadius: BorderRadius.all(const Radius.circular(16).r),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.primaryColor.withOpacity(0.19),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: CachedNetworkImageWidget(
                                imageUrl: item?.iconsUrl ?? '',
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              item?.name ?? '',
                              style: TextStyles.semiBold12.copyWith(color: AppColor.textSecondary),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ).addGesture(() => _onPressReportMenu(item));
                      },
                    ),
                  ),
          );
        }),
      ),
    );
  }

  void _onPressReportMenu(ReportMenuResponse? item) {
    switch (item?.id) {
      case '3':
        //Pending Order
        appRouter.push(const PendingOrderRoute());
        break;
      default:
        errorToast(AppLocalizations.current.somethingWentWrong);
    }
  }
}
