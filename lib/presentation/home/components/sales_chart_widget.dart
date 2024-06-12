import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesChartWidget extends StatefulWidget {
  final List<Sales>? sales;
  final String? title;

  const SalesChartWidget(this.sales, {super.key, this.title});

  @override
  State<SalesChartWidget> createState() => _SalesChartWidgetState();
}

class _SalesChartWidgetState extends State<SalesChartWidget> with AutomaticKeepAliveClientMixin {
  final TooltipBehavior _tooltip = TooltipBehavior(enable: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h),
            child: Text(
              widget.title ?? '',
              style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
            ),
          ),
          SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(
                    width: 0,
                  ),
                  axisLine: AxisLine(width: 0),
                  labelAlignment: LabelAlignment.center),
              primaryYAxis: const NumericAxis(isVisible: false, majorGridLines: MajorGridLines(width: 0), axisLine: AxisLine(width: 0)),
              tooltipBehavior: _tooltip,
              borderWidth: 0,
              margin: const EdgeInsets.all(0),
              series: <CartesianSeries>[
                SplineAreaSeries<Sales, String>(
                  enableTooltip: true,
                  splineType: SplineType.cardinal,
                  cardinalSplineTension: 1,
                  dataSource: widget.sales,
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

  @override
  bool get wantKeepAlive => true;
}
