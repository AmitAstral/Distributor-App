import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/order_details_response.dart';
import 'package:distributor_empower/model/pending_order_response.dart';
import 'package:distributor_empower/presentation/pending_order/provider/pending_order_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class PendingOrderDetailsScreen extends StatefulWidget {
  final PendingOrderResponse? orderDetails;

  const PendingOrderDetailsScreen(this.orderDetails, {super.key});

  @override
  State<PendingOrderDetailsScreen> createState() => _PendingOrderDetailsScreenState();
}

class _PendingOrderDetailsScreenState extends State<PendingOrderDetailsScreen> {
  final _pendingOrderProvider = PendingOrderProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  List<OrderDetailsResponse?> get getOrderDetailsListResponse => _pendingOrderProvider.orderDetailsListResponse;

  @override
  void initState() {
    _getOrderDetails(isLoading: true);
    super.initState();
  }

  @override
  void dispose() {
    _pendingOrderProvider.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          titleText: AppLocalizations.of(context).pendingOrderDetails,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _pendingOrderProvider,
        child: SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: () {
            _getOrderDetails(isLoading: false);
          },
          child: Consumer<PendingOrderProvider>(
            builder: (context, value, child) {
              return ProgressWidget(
                inAsyncCall: _pendingOrderProvider.isLoading.value,
                child: Column(
                  children: [
                    10.verticalSpace,
                    _buildUpperView(),
                    10.verticalSpace,
                    _createDataTable(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _createDataTable() {
    return Flexible(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20).h,
          child: Table(
              columnWidths: const {0: FixedColumnWidth(130)},
              children: List.generate(getOrderDetailsListResponse.length + 1, (index) {
                return index == 0 ? _buildColum() : _buildRow(index - 1);
              })),
        ),
      ),
    );
  }

  TableRow _buildColum() {
    return TableRow(
        decoration: const BoxDecoration(
          color: AppColor.primaryColorLight,
        ),
        children: [
          TableCell(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(5).h,
              margin: const EdgeInsets.only(left: 8).w,
              child: Text(
                AppLocalizations.of(context).itemName,
                style: TextStyles.semiBold12,
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                AppLocalizations.of(context).unit,
                style: TextStyles.semiBold12,
              ),
            ),
          ),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppLocalizations.of(context).orderQty,
              style: TextStyles.semiBold12,
            ),
          )),
          TableCell(
            child: Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context).pendingQty,
                style: TextStyles.semiBold12,
              ),
            ),
          ),
          TableCell(
              child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(5),
            child: Text(
              AppLocalizations.of(context).pendingAmt,
              style: TextStyles.semiBold12,
            ),
          )),
        ]);
  }

  TableRow _buildRow(int index) {
    final item = getOrderDetailsListResponse[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
        ),
        children: [
          TableCell(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(2).h,
              child: Text(
                item?.itemId ?? '',
                style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(2).h,
            child: Text(
              item?.unit ?? '',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
            ),
          )),
          TableCell(
              child: Container(
                alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(2).h,
            child: Text(
              item?.orderQty ?? '',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
            ),
          )),
          TableCell(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(2).h,
              child: Text(
                item?.pendingQty ?? '',
                style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(2).h,
              child: Text(
                item?.pendingAmt ?? '',
                style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ),
        ]);
  }

  Widget _buildUpperView() {
    return Row(
      children: [
        10.horizontalSpace,
        _buildTextView(AppLocalizations.current.orderNo, widget.orderDetails?.orderNo ?? ''),
        const Spacer(),
        _buildTextView(AppLocalizations.current.date, widget.orderDetails?.orderDate ?? ''),
        10.horizontalSpace,
      ],
    );
  }

  Widget _buildTextView(String title, String? value) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
        ),
        Text(
          ' : ${value ?? ''}',
          style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
        ),
      ],
    );
  }

  Future<void> _getOrderDetails({required bool isLoading}) async {
    await _pendingOrderProvider.callGetPendingOrderDetailByOrderNo(widget.orderDetails?.orderNo, isProgress: isLoading);
    _refreshController.refreshCompleted();
  }
}
