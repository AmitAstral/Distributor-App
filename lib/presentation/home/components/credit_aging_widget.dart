import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditAgingWidget extends StatefulWidget {
  final List<CreditAging>? creditAging;
  final String title;

  CreditAgingWidget(this.creditAging, {super.key, required this.title});

  final Color barBackgroundColor = const Color(0xFFC9E4FF).withOpacity(0.5);
  final Color barColor = AppColor.primaryColor;
  final Color touchedBarColor = AppColor.green;

  @override
  State<CreditAgingWidget> createState() => _CreditAgingWidgetState();
}

class _CreditAgingWidgetState extends State<CreditAgingWidget> {
  int touchedIndex = -1;

  List<CreditAging> get getCreditAging => widget.creditAging ?? <CreditAging>[];

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
              style: googleFontPoppins.copyWith(
                fontWeight: GoogleFontWeight.semiBold,
                fontSize: 14.sp,
                color: const Color(0xFF333333),
              ),
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
                    AppLocalizations.of(context).amountInLacs,
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
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: const Duration(milliseconds: 250),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10.h,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final value = getCreditAging[groupIndex].value ?? '';
            return BarTooltipItem(
              value,
              TextStyles.regular12.copyWith(color: AppColor.primaryColor),
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 35.h,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
      alignment: BarChartAlignment.spaceAround,
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
          rod.toY.round().toString(),
          const TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    ),
  );

  Widget getTitles(double index, TitleMeta meta) {
    TextStyle style = googleFontNunitoSans.copyWith(
      fontWeight: GoogleFontWeight.semiBold,
      fontSize: 10.sp,
      color: AppColor.black,
    );
    Widget text;
    text = Text(getCreditAging[index.toInt()].label ?? '', style: style);
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16.h,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return getCreditAging
        .map((e) =>
            makeGroupData(getCreditAging.indexOf(e), double.tryParse((e.value ?? '0')) ?? 0, isTouched: getCreditAging.indexOf(e) == touchedIndex))
        .toList();
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double? width,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barsSpace: y,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width = 8.w,
          borderSide: isTouched ? BorderSide(color: widget.touchedBarColor) : const BorderSide(color: AppColor.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 20.h,
            color: AppColor.transparent,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
