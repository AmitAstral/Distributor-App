import 'dart:math';

import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreditAgingWidget extends StatefulWidget {
  final CreditAgingData? creditAging;
  final String title;

  const CreditAgingWidget(this.creditAging, {super.key, required this.title});

  @override
  State<CreditAgingWidget> createState() => _CreditAgingWidgetState();
}

class _CreditAgingWidgetState extends State<CreditAgingWidget> {
  int touchedIndex = -1;

  List<CreditAging> get getCreditAging => (widget.creditAging?.list ?? <CreditAging>[]);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 340.h,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title ?? '',
              style: TextStyles.semiBold14.copyWith(color: const Color(0xFF333333)),
            ),
          ),
          Container(
            width: 1.sw,
            height: 295.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            margin: EdgeInsets.symmetric(vertical: 10.h),
            decoration: ShapeDecoration(
              color: const Color(0xFFFEFEFE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              shadows: [
                BoxShadow(
                  color: const Color(0x331377E7),
                  blurRadius: 10.r,
                  offset: const Offset(0, 4),
                  spreadRadius: 1,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    widget.creditAging?.amountLabel ?? '',
                    textAlign: TextAlign.center,
                    style: googleFontPoppins.copyWith(
                      fontWeight: GoogleFontWeight.regular,
                      fontSize: 10.sp,
                      color: AppColor.black,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 250.h,
                  child: buildBarChart(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  BarChart buildBarChart() {
    final numList = getCreditAging.map(
      (e) => e.value.parseToNum.toDouble(),
    );
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: numList.reduce(max),
        minY: numList.reduce(min),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              getCreditAging[groupIndex].value.parseToNum < 1 ? '' : getCreditAging[groupIndex].value.removeTrailingZeros,
              TextStyles.regular12.copyWith(
                color: AppColor.primaryColor,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyles.regular10.copyWith(color: AppColor.textSecondary);
    final text = getCreditAging[value.toInt()].label ?? '';
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => getCreditAging
      .map(
        (e) => BarChartGroupData(
          x: getCreditAging.indexOf(e),
          barRods: [
            BarChartRodData(
              color: AppColor.primaryColor,
              toY: e.value.parseToNum.toDouble(),
            )
          ],
          showingTooltipIndicators: [0],
        ),
      )
      .toList();
}
