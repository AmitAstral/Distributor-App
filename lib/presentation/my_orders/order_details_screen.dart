import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/order_response.dart';
import 'package:distributor_empower/presentation/my_orders/provider/order_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class OrderDetailsScreen extends StatefulWidget {
  final OrderResponse? orderItem;

  const OrderDetailsScreen({required this.orderItem, super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final _orderProvider = OrderProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  OrderResponse? get orderItem => widget.orderItem;

  @override
  void initState() {
    _orderProvider.getOrderDetailsAPI(orderId: orderItem?.orderNo);
    super.initState();
  }

  @override
  void dispose() {
    _orderProvider.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          title: Text(
            AppLocalizations.current.orderDetails,
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: SmartRefresherWidget(
        controller: _refreshController,
        onRefresh: () async {
          await _orderProvider.getOrderDetailsAPI(orderId: orderItem?.orderNo, loading: false);
          _refreshController.refreshCompleted();
        },
        child: ChangeNotifierProvider.value(
          value: _orderProvider,
          child: Consumer<OrderProvider>(builder: (context, value, child) {
            return ProgressWidget(
              inAsyncCall: value.isLoading.value,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              AppLocalizations.current.distributorName,
                              style: TextStyles.regular10.copyWith(color: AppColor.textSecondary),
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            flex: 3,
                            child: Text(
                              AppLocalizations.current.mobileNo,
                              style: TextStyles.regular10.copyWith(
                                color: AppColor.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      3.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1, color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              child: Text(
                                orderItem?.distName ?? '',
                                maxLines: 2,
                                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                              ),
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 1, color: AppColor.primaryColor),
                                  borderRadius: BorderRadius.circular(5.r),
                                ),
                              ),
                              child: Text(
                                storage.userDetails.distributorMobileNumber ?? '',
                                maxLines: 2,
                                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                              ),
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Text(
                        AppLocalizations.current.address,
                        textAlign: TextAlign.start,
                        style: TextStyles.regular10.copyWith(color: AppColor.textSecondary),
                      ),
                      3.verticalSpace,
                      Container(
                        width: 1.sw,
                        padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1, color: AppColor.primaryColor),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        child: Text(
                          storage.userDetails.address ?? '',
                          maxLines: 3,
                          style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.current.date,
                                style: TextStyles.regular10.copyWith(color: AppColor.textSecondary),
                              ),
                              3.verticalSpace,
                              Container(
                                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(width: 1, color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  orderItem?.date ?? '',
                                  style: TextStyles.semiBold11.copyWith(
                                    color: AppColor.textSecondary,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(child: 0.horizontalSpace),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.current.orderNo,
                                style: TextStyles.regular10.copyWith(color: AppColor.textSecondary),
                              ),
                              3.verticalSpace,
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.w),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(width: 1, color: AppColor.primaryColor),
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  orderItem?.orderNo ?? '',
                                  style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      5.verticalSpace,
                      if (_orderProvider.orderDetailsResponse?.orderDetails?.isNotEmpty ?? false) ...[
                        buildTable(),
                        5.verticalSpace,
                        Row(
                          children: [
                            Expanded(child: 0.horizontalSpace),
                            Container(
                              width: 63.w,
                              height: 1,
                              decoration: const ShapeDecoration(
                                color: AppColor.hintTextColor,
                                shape: OvalBorder(),
                              ),
                            ),
                          ],
                        ),
                        Container(
                            width: 1.sw,
                            padding: EdgeInsets.only(top: 3.h),
                            alignment: Alignment.centerRight,
                            child: Text(_orderProvider.orderDetailsResponse?.amount ?? '0',
                                style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary)))
                      ]
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget buildTable() {
    return Table(
      columnWidths: const {
        0: IntrinsicColumnWidth(flex: 1),
        1: IntrinsicColumnWidth(flex: 0.8),
        2: IntrinsicColumnWidth(flex: 0.5),
        3: IntrinsicColumnWidth(flex: 0.5),
        4: IntrinsicColumnWidth(flex: 0.5),
      },
      children: List.generate(
        (_orderProvider.orderDetailsResponse?.orderDetails?.length ?? 0) + 1,
        (index) {
          return index == 0 ? _buildColum() : _buildRow(index - 1);
        },
      ),
    );
  }

  TableRow _buildColum() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.primaryColorLight,
      ),
      children: [
        AppLocalizations.current.productName,
        AppLocalizations.current.unit,
        AppLocalizations.current.qty,
        AppLocalizations.current.price,
        AppLocalizations.current.amount,
      ]
          .map(
            (title) => TableCell(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5).h,
                margin: const EdgeInsets.only(left: 8).w,
                child: Text(
                  title,
                  style: TextStyles.semiBold11,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  TableRow _buildRow(int index) {
    final item = _orderProvider.orderDetailsResponse?.orderDetails?[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
        ),
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.itemName ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
              ),
            ),
          ),
          TableCell(
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.weight ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
              ),
            )),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.qty ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.rate ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.netAmount ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ]);
  }
}
