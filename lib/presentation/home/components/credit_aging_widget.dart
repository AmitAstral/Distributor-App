import 'package:distributor_empower/constants/all_constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreditAgingWidget extends StatefulWidget {
  CreditAgingWidget({super.key});

  final Color barBackgroundColor = const Color(0xFFC9E4FF).withOpacity(0.5);
  final Color barColor = AppColor.primaryColor;
  final Color touchedBarColor = AppColor.green;

  @override
  State<CreditAgingWidget> createState() => _CreditAgingWidgetState();
}

class _CreditAgingWidgetState extends State<CreditAgingWidget> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

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
              "Credit Aging",
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
                    '* amount in lacs',
                    textAlign: TextAlign.center,
                    style: googleFontPoppins.copyWith(
                      fontWeight: GoogleFontWeight.regular,
                      fontSize: 10.sp,
                      color: AppColor.black,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Container(
                  width: 1.sw,
                  height: 250.h,
                  child: BarChart(
                    mainBarData(),
                    swapAnimationDuration: animDuration,
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
          // tooltipBgColor: Colors.blueGrey,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: 1.h - 11.h,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = '0-5';
                break;
              case 1:
                weekDay = '6-10';
                break;
              case 2:
                weekDay = '11-20';
                break;
              case 3:
                weekDay = '21-32';
                break;
              case 4:
                weekDay = '33-35';
                break;
              case 5:
                weekDay = '36-45';
                break;
              case 6:
                weekDay = '46-60';
                break;
              case 7:
                weekDay = '≥61';
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              TextStyle(
                color: AppColor.grey88,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
          sideTitles: SideTitles(showTitles: true),
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
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style = googleFontNunitoSans.copyWith(
      fontWeight: GoogleFontWeight.semiBold,
      fontSize: 10.sp,
      color: AppColor.black,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('0-5', style: style);
        break;
      case 1:
        text = Text('6-10', style: style);
        break;
      case 2:
        text = Text('11-20', style: style);
        break;
      case 3:
        text = Text('21-32', style: style);
        break;
      case 4:
        text = Text('33-35', style: style);
        break;
      case 5:
        text = Text('36-45', style: style);
        break;
      case 6:
        text = Text('46-60', style: style);
        break;
      case 7:
        text = Text('≥61', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16.h,
      child: text,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 3.20, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 5.23, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5.48, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 3.21, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 4.90, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 3.30, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 3.80, isTouched: i == touchedIndex);
          case 7:
            return makeGroupData(7, 2.80, isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

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
            color: widget.barBackgroundColor,
            // color: AppColor.transparent,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
}
