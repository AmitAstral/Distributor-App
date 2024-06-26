import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/constants/fonts/font_family.dart';
import 'package:distributor_empower/constants/fonts/font_weight.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsWidget extends BaseStatefulWidget {
  final String? title;

  final List<OrderDetail>? orderDetails;

  const OrderDetailsWidget(this.orderDetails, {required this.title, super.key});

  @override
  BaseState<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends BaseState<OrderDetailsWidget> {
  int touchedIndex = -1;

  List<OrderDetail> get getOrderLabelList => widget.orderDetails ?? [];

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
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
          // ignore: require_trailing_commas
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
              style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
            ),
          ),
          // SizedBox(height: 9.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              8.horizontalSpace,
              Expanded(
                child: Container(
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
              ),
              8.horizontalSpace,
              Expanded(
                child: SizedBox(
                  width: (1.sw / 2) - 17.55.w,
                  // flex: 4,
                  child: ListView.builder(
                    itemCount: getOrderLabelList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = getOrderLabelList[index];
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 11.sp,
                            height: 11.sp,
                            decoration: ShapeDecoration(
                              color: item.colorCode,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.r)),
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.label ?? '',
                                  style: TextStyles.semiBold10.copyWith(color: AppColor.lightGrey),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  item.value ?? '',
                                  style: TextStyles.semiBold13.copyWith(color: AppColor.textSecondary),
                                ),
                                5.verticalSpace,
                              ],
                            ),
                          ),
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

  List<PieChartSectionData> showingSections() {
    return List.generate(getOrderLabelList.length, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.sp : 11.sp;
      final radius = isTouched ? 75.r : 65.r;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      final item = getOrderLabelList[i];
      return PieChartSectionData(
        color: item.colorCode,
        value: item.percentageValue,
        title: AppLocalizations.current.amountWithPercentage(item.percentageValue.toString()),
        radius: radius,
        titleStyle: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: fontSize, color: AppColor.white, shadows: shadows),
      );
    });
  }
}
