import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChartWidget extends StatelessWidget {
  final List<Sales>? sales;
  final String? title;

  SalesChartWidget(this.sales, {super.key, this.title});

  final TooltipBehavior _tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: Text(
              title ?? '',
              style: googleFontPoppins.copyWith(
                fontWeight: GoogleFontWeight.semiBold,
                fontSize: 14.sp,
                color: const Color(0xFF333333),
              ),
            ),
          ),
          SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: const CategoryAxis(
                  // edgeLabelPlacement: EdgeLabelPlacement.shift,
                  //Hide the gridlines of x-axis
                  majorGridLines: MajorGridLines(
                    width: 0,
                  ),
                  //Hide the axis line of x-axis
                  axisLine: AxisLine(width: 0),
                  labelAlignment: LabelAlignment.center),
              primaryYAxis: const NumericAxis(
                  isVisible: false,
                  //Hide the gridlines of y-axis
                  majorGridLines: MajorGridLines(width: 0),
                  //Hide the axis line of y-axis
                  axisLine: AxisLine(width: 0)),
              tooltipBehavior: _tooltip,
              borderWidth: 0,
              margin: const EdgeInsets.all(0),
              series: <CartesianSeries>[
                SplineAreaSeries<Sales, String>(
                  enableTooltip: true,
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 1,
                  dataSource: sales,
                  xValueMapper: (Sales data, _) => data.monthName,
                  yValueMapper: (Sales data, _) => data.netTotalSales,
                  borderColor: const Color(0xFFC3C1FF),
                  name: AppLocalizations.of(context).sales,
                  borderWidth: 1.5,
                  color: const Color(0xFF0A04B1),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF0A04B1).withOpacity(0.5),
                      AppColor.white,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
