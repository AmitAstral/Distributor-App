import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CreditDetailsWidget extends StatelessWidget {
  final CreditDetails? creditDetails;
  final String? title;

  const CreditDetailsWidget(this.creditDetails, {super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x260A04B1),
            blurRadius: 20.r,
            offset: const Offset(0, 2),
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
          ),
          SizedBox(height: 9.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.horizontalSpace,
              Expanded(
                // flex: 4,
                child: SizedBox(
                  width: 105.w,
                  height: 105.w,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SfRadialGauge(
                        enableLoadingAnimation: true,
                        animationDuration: 2500,
                        axes: [
                          RadialAxis(
                            showLabels: false,
                            showTicks: false,
                            startAngle: 180,
                            endAngle: 0,
                            radiusFactor: 1.sp,
                            canScaleToFit: true,
                            axisLineStyle: const AxisLineStyle(
                              thickness: 0.12,
                              thicknessUnit: GaugeSizeUnit.factor,
                              cornerStyle: CornerStyle.bothCurve,
                            ),
                            pointers: <GaugePointer>[
                              RangePointer(
                                  value: creditDetails?.remainingPercentage ?? 0,
                                  cornerStyle: CornerStyle.startCurve,
                                  enableAnimation: true,
                                  animationDuration: 2000,
                                  width: 8.sp,
                                  color: AppColor.primaryColor,
                                  gradient: const SweepGradient(
                                    colors: <Color>[
                                      AppColor.primaryColor,
                                      AppColor.primaryColor,
                                    ],
                                  )),
                              MarkerPointer(
                                value: creditDetails?.remainingPercentage ?? 0,
                                enableAnimation: true,
                                overlayColor: AppColor.primaryColor,
                                animationDuration: 2000,
                                // markerHeight: 10,
                                // markerWidth: 10,
                                markerType: MarkerType.circle,
                                enableDragging: true,
                                color: AppColor.transparent,
                                borderWidth: 3,
                                elevation: 10,
                                borderColor: const Color(0xFFFEFEFE),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppLocalizations.of(context).amountWithPercentage((creditDetails?.remainingPercentage ?? 0).toString()),
                              style: googleFontMontserrat.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 14.sp,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context).creditLeftWithAmount(
                                (creditDetails?.remainingCredit ?? ''),
                              ),
                              style: TextStyles.regular9.copyWith(color: AppColor.hintTextColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              30.horizontalSpace,
              Expanded(
                child: SizedBox(
                  width: 105.w,
                  child: ListView.builder(
                    itemCount: creditDetails?.tiles?.length ?? 0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = creditDetails?.tiles?[index];
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item?.label ?? '',
                            style: TextStyles.semiBold10.copyWith(color: AppColor.lightGrey),
                          ),
                          Text(
                            item?.value ?? '0',
                            style: TextStyles.semiBold13.copyWith(color: AppColor.hintTextColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                          5.verticalSpace,
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
