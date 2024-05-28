import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/constants/app_statics_text/app_labels.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget1.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

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
            AppLocalizations.current.orderDetails,
            maxLines: 1,
            style: TextStyles.semiBold15.copyWith(color: AppColor.textSecondary),
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        margin: EdgeInsets.only(left: 13.w, right: 13.w, top: 8.h, bottom: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 7,
                    child: Text(
                      AppLocalizations.current.partyName,
                      style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                    ) //googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: 9.sp, color: AppColor.black)),
                    ),
                8.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: Text(
                    AppLocalizations.current.mobileNo,
                    style: TextStyles.regular9.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            3.verticalSpace,
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: Text(
                      "Bhakti Hardware",
                      maxLines: 2,
                      style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                    ),
                  ),
                ),
                8.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1, color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                    ),
                    child: Text(
                      '69874 56321',
                      maxLines: 2,
                      style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                    ),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            Text(
              AppLocalizations.current.address,
              textAlign: TextAlign.start,
              style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
            ),
            3.verticalSpace,
            Container(
              width: 1.sw,
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
              child: Text(
                "Opp. St. Sebastian's Garden, Behind the W, Goa.",
                maxLines: 3,
                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
              ),
            ),
            8.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.current.date,
                      style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                    ),
                    3.verticalSpace,
                    Container(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      child: Text(
                        "03/01/2023",
                        style: TextStyles.semiBold11.copyWith(
                          color: AppColor.textSecondary,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(child: 0.horizontalSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.current.orderNo,
                      style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                    ),
                    3.verticalSpace,
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1, color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                      child: Text(
                        '456123789',
                        style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 8.h),
              width: 1.sw,
              color: AppColor.orderDetails.withOpacity(0.5),
              padding: EdgeInsets.all(12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: FittedBox(
                      child: Text(
                        AppConst.product_name,
                        style: TextStyles.bold15.copyWith(color: AppColor.textSecondary),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: FittedBox(
                      child: Text(
                        AppConst.sku,
                        style: TextStyles.bold12.copyWith(color: AppColor.textSecondary),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: FittedBox(
                      child: Text(
                        AppConst.qty,
                        style: TextStyles.bold12.copyWith(color: AppColor.textSecondary),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: FittedBox(child: Text(AppConst.price, style: TextStyles.bold12.copyWith(color: AppColor.textSecondary))),
                  ),
                  Flexible(
                    flex: 2,
                    child: FittedBox(child: Text(AppConst.amount, style: TextStyles.bold12.copyWith(color: AppColor.textSecondary))),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      color: (index % 2 == 0) ? AppColor.orderDetailsList : AppColor.white,
                      child: Padding(
                        padding: EdgeInsets.all(7.5.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 4,
                                child:
                                    Text("BONDTITE PRO 180 GM", maxLines: 3, style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary))),
                            Expanded(flex: 2, child: Text("180 GM", style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary))),
                            Expanded(flex: 2, child: Text("6.00", style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary))),
                            Expanded(flex: 2, child: Text("256.10", style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary))),
                            Expanded(
                              flex: 2,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text("1536", style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary))),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                Expanded(child: 0.horizontalSpace),
                Container(
                  width: 62.83.w,
                  height: 1,
                  decoration: const ShapeDecoration(
                    color: AppColor.hintTextColor,
                    shape: OvalBorder(),
                  ),
                ),
              ],
            ),
            Container(
                width: 1.sw,
                padding: EdgeInsets.only(top: 3.h),
                alignment: Alignment.centerRight,
                child: Text("${AppConst.rupees}16,00,000", style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary)))
          ],
        ),
      ),
    );
  }
}
