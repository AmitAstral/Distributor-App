import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatefulWidget {
  final String? title;

  final OrderDetails? orderDetails;

  const OrderDetailsWidget(this.orderDetails, {super.key, required this.title});

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  int touchedIndex = -1;

  OrderDetails get orderDetails => widget.orderDetails ?? OrderDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      // padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.w),
            child: Text(
              widget.title ?? '',
              style: googleFontPoppins.copyWith(
                fontWeight: GoogleFontWeight.semiBold,
                fontSize: 14.sp,
                color: const Color(0xFF333333),
              ),
            ),
          ),
          // SizedBox(height: 9.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: (1.sw / 2) - 17.55.w,
                height: 112.h,
                alignment: Alignment.center,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 2,
                    centerSpaceRadius: 0,
                    sections: showingSections(),
                  ),
                ),
              ),
              8.horizontalSpace,
              SizedBox(
                width: (1.sw / 2) - 17.55.w,
                // flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 11.sp,
                          height: 11.sp,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFFEFEFE),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).totalOrder,
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              orderDetails.totalOrder.formatWithCurrency,
                              style: googleFontMontserrat.copyWith(
                                fontWeight: GoogleFontWeight.semiBold,
                                fontSize: 14.sp,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 11.sp,
                          height: 11.sp,
                          decoration: ShapeDecoration(
                            color: orderDetails.colorDispatched,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).dispatchedOrder,
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              orderDetails.dispatchedOrder.formatWithCurrency,
                              style: googleFontMontserrat.copyWith(
                                fontWeight: GoogleFontWeight.semiBold,
                                fontSize: 14.sp,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 11.sp,
                          height: 11.sp,
                          decoration: ShapeDecoration(
                            color: orderDetails.colorAuthorizedPending,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).authorizedPendingOrder,
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              orderDetails.authorizedPendingOrder.formatWithCurrency,
                              style: googleFontMontserrat.copyWith(
                                fontWeight: GoogleFontWeight.semiBold,
                                fontSize: 14.sp,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 11.sp,
                          height: 11.sp,
                          decoration: ShapeDecoration(
                            color: orderDetails.colorUnAuthorizedPending,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).unauthorizedPendingOrder,
                                style: googleFontPoppins.copyWith(
                                  fontWeight: GoogleFontWeight.medium,
                                  fontSize: 10.sp,
                                  color: const Color(0xFF7E7E7E),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                orderDetails.unAuthorizedPendingOrder.formatWithCurrency,
                                style: googleFontMontserrat.copyWith(
                                  fontWeight: GoogleFontWeight.semiBold,
                                  fontSize: 14.sp,
                                  color: const Color(0xFF333333),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.sp : 11.sp;
      final radius = isTouched ? 75.r : 65.r;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 2:
          return PieChartSectionData(
            color: orderDetails.colorDispatched,
            value: orderDetails.percentageDispatched,
            title: AppLocalizations.current.amountWithPercentage(orderDetails.percentageDispatched),
            radius: radius,
            titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
          );
        case 1:
          return PieChartSectionData(
            color: orderDetails.colorAuthorizedPending,
            value: orderDetails.percentageAuthorizedPending,
            title: AppLocalizations.current.amountWithPercentage(orderDetails.percentageAuthorizedPending),
            radius: radius,
            titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
          );
        case 0:
          return PieChartSectionData(
            color: orderDetails.colorUnAuthorizedPending,
            value: orderDetails.percentageUnAuthorizedPending,
            title: AppLocalizations.current.amountWithPercentage(orderDetails.percentageUnAuthorizedPending),
            radius: radius,
            titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
          );
        default:
          throw Error();
      }
    });
  }
}
