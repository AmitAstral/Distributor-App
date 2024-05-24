import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SalesChartWidget extends StatefulWidget {
  const SalesChartWidget({super.key});

  @override
  State<SalesChartWidget> createState() => _SalesChartWidgetState();
}

class _SalesChartWidgetState extends State<SalesChartWidget> {
  final List<ChartData> chartData = [
    ChartData("Jan", 1),
    ChartData("Feb", 2.5),
    ChartData("Mar", 1.5),
    ChartData("Apr", 3.5),
    ChartData("May", 1.99),
    ChartData("Jun", 1.44),
    ChartData("Jul", 2),
    ChartData("Aug", 1.56),
    ChartData("Sep", 2.1),
    ChartData("Oct", 2.1),
    ChartData("Nov", 3.1),
    ChartData("Dec", 1.1),
  ];

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
              AppLocalizations.current.sales,
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
                SplineAreaSeries<ChartData, String>(
                  enableTooltip: true,
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 1,
                  dataSource: [
                    ChartData("Jan", 0),
                    ChartData("Feb", 2.5),
                    ChartData("Mar", 1),
                    ChartData("Apr", 3.5),
                    ChartData("May", 1.99),
                    ChartData("Jun", 1.44),
                    ChartData("Jul", 2),
                    ChartData("Aug", 1.56),
                    ChartData("Sep", 2.1),
                    ChartData("Oct", 2),
                    ChartData("Nov", 1.56),
                    ChartData("Dec", 2.1),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  borderColor: const Color(0xFFC3C1FF),
                  name: "Sales",
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

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
