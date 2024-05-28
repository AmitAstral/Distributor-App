import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget1.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OrderHistoryScreen extends StatelessWidget {
  static const String routeName = 'OrderHistoryScreen';

  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          backgroundColor: const Color(0x19F1A1A2),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColor.transparent, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark),
          title: Text(
            AppLocalizations.current.orderHistory,
            maxLines: 1,
            style: TextStyles.semiBold15.copyWith(color: AppColor.textSecondary),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.router.pushNamed(OrderDetailsRoute.name);
            },
            child: Container(
              width: 1.sw,
              margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.h, bottom: index == 49 ? 12.w : 0),
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1.50, color: AppColor.primaryColor), borderRadius: BorderRadius.circular(10.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '${AppLocalizations.current.date} : 03/01/23',
                          textAlign: TextAlign.start,
                          style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${AppLocalizations.current.orderNo} : 456123789',
                          textAlign: TextAlign.end,
                          style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                        ),
                      ),
                    ],
                  ),
                  4.verticalSpace,
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '${AppLocalizations.current.orderValue} :   ', style: TextStyles.regular13.copyWith(color: AppColor.hintTextColor)),
                        TextSpan(
                            text: '${AppLocalizations.current.rupees}45,321', style: TextStyles.semiBold13.copyWith(color: AppColor.hintTextColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
