import 'package:distributor_empower/constants/all_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CreditDetailsWidget extends StatelessWidget {
  const CreditDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 145.h,
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
            'Credit Details',
            style: googleFontPoppins.copyWith(
              fontWeight: GoogleFontWeight.semiBold,
              fontSize: 14.sp,
              color: const Color(0xFF333333),
            ),
          ),
          SizedBox(height: 9.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                                  value: 70,
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
                              const MarkerPointer(
                                  value: 70,
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
                                  borderColor: Color(0xFFFEFEFE)),
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
                              '70%',
                              style: googleFontMontserrat.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 14.sp,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            Text(
                              '(3,00,000 Left)',
                              style: googleFontMontserrat.copyWith(
                                fontWeight: GoogleFontWeight.regular,
                                fontSize: 9.sp,
                                color: AppColor.hintTextColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              15.horizontalSpace,
              Expanded(
                // flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.55.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Credit Limit',
                            style: googleFontPoppins.copyWith(
                              fontWeight: GoogleFontWeight.medium,
                              fontSize: 10.sp,
                              color: const Color(0xFF7E7E7E),
                            ),
                          ),
                          Text(
                            '₹ 10,00,000',
                            style: googleFontMontserrat.copyWith(
                              fontWeight: GoogleFontWeight.semiBold,
                              fontSize: 13.sp,
                              color: const Color(0xFF333333),
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Used Credit',
                            style: googleFontPoppins.copyWith(
                              fontWeight: GoogleFontWeight.medium,
                              fontSize: 10.sp,
                              color: const Color(0xFF7E7E7E),
                            ),
                          ),
                          Text(
                            '₹ 7,00,000',
                            style: googleFontMontserrat.copyWith(
                              fontWeight: GoogleFontWeight.semiBold,
                              fontSize: 13.sp,
                              color: const Color(0xFF333333),
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Remaining Credit',
                            style: googleFontPoppins.copyWith(
                              fontWeight: GoogleFontWeight.medium,
                              fontSize: 10.sp,
                              color: const Color(0xFF7E7E7E),
                            ),
                          ),
                          Text(
                            '₹ 3,00,000',
                            style: googleFontMontserrat.copyWith(
                              fontWeight: GoogleFontWeight.semiBold,
                              fontSize: 13.sp,
                              color: const Color(0xFF333333),
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
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
