import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 10).w,
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.w,
          ),
          itemBuilder: (context, index) {
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
                  child: Assets.icons.cart.svg(
                    width: 24.w,
                    height: 24.h,
                    color: AppColor.primaryColor,
                  ),
                ),
                10.verticalSpace,
                Text(
                  'Reports',
                  style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
