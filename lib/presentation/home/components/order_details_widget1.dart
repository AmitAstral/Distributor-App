import 'package:distributor_empower/constants/all_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget1 extends StatefulWidget {
  const OrderDetailsWidget1({super.key});

  @override
  State<OrderDetailsWidget1> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget1> {
  int touchedIndex = -1;

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
              'Order Details',
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
                              'Total Order',
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              '₹ 88,344',
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
                            color: const Color(0xFF0A04B1),
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
                              'Dispatched Order',
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              '₹ 25,750',
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
                            color: const Color(0xFF918DFF),
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
                              'Authorized pending Order',
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              '₹ 36,700',
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
                            color: const Color(0xFF030064),
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
                              'unauthorized Pending Order',
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.medium,
                                fontSize: 10.sp,
                                color: const Color(0xFF7E7E7E),
                              ),
                            ),
                            Text(
                              '₹ 25,894',
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
            color: AppColor.primaryColor,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFF030064),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
          );
        case 0:
          return PieChartSectionData(
            color: const Color(0xFF918DFF),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
          );
        default:
          throw Error();
      }
    });
  }
}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color black = Color(0xFF000000);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF000000);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}
