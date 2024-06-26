import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/pending_order_response.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/presentation/pending_order/provider/pending_order_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/pagination_loader.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class PendingOrderScreen extends BaseStatefulWidget {
  const PendingOrderScreen({super.key});

  @override
  BaseState<PendingOrderScreen> createState() => _PendingOrderScreenState();
}

class _PendingOrderScreenState extends BaseState<PendingOrderScreen> {
  final _pendingOrderProvider = PendingOrderProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  List<PendingOrderResponse?> get getPendingOrderList => _pendingOrderProvider.pendingOrderListResponse;

  @override
  void initState() {
    _getPendingOrderList(true);
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          titleText: AppLocalizations.current.pendingOrder,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _pendingOrderProvider,
        child: SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: () async {
            _pendingOrderProvider.pageNo = 1;
            await _getPendingOrderList(getPendingOrderList.isEmpty);
            _refreshController.refreshCompleted();
          },
          loadMoreData: _loadMore,
          child: Consumer<PendingOrderProvider>(
            builder: (context, value, child) {
              return ProgressWidget(
                inAsyncCall: value.isLoading.value,
                child: SingleChildScrollView(
                  child: value.isLoading.value
                      ? const SizedBox.shrink()
                      : value.pendingOrderListResponse.isEmpty
                          ? const NoDataFoundWidget()
                          : buildTable(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pendingOrderProvider.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  Widget buildTable() {
    return Column(
      children: [
        Table(
          columnWidths: const <int, TableColumnWidth>{
            0: IntrinsicColumnWidth(flex: 1.3),
            1: IntrinsicColumnWidth(flex: 1),
            3: IntrinsicColumnWidth(flex: 1),
            4: IntrinsicColumnWidth(),
          },
          children: List.generate(getPendingOrderList.length + 1, (index) {
            return index == 0 ? _buildColum() : _buildRow(index - 1);
          }),
        ),
        10.verticalSpace,
        if (_pendingOrderProvider.isPaginationLoading) const PaginationLoader(),
      ],
    );
  }

  TableRow _buildColum() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.primaryColorLight,
      ),
      children: [
        _buildTitle(AppLocalizations.of(context).orderNo),
        _buildTitle(AppLocalizations.of(context).orderDate),
        _buildTitle(AppLocalizations.of(context).orderAmount),
        _buildTitle(AppLocalizations.of(context).status),
        const SizedBox.shrink(),
      ],
    );
  }

  TableCell _buildTitle(String title) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(5).h,
        child: Text(
          title,
          style: TextStyles.semiBold12,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  TableRow _buildRow(int index) {
    final item = getPendingOrderList[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
        ),
        children: [
          TableCell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(2).h,
                child: Text(
                  item?.orderNo ?? '',
                  style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                ),
              ),
            ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(2).h,
            child: Text(
              item?.orderDate ?? '',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        TableCell(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(2).h,
            child: Text(
              item?.orderAmount ?? '',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(2).h,
            child: Text(
              item?.status ?? '',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            navigateToDetailsPage(item);
          },
          child: const Icon(Icons.keyboard_arrow_right_outlined),
        ),
      ],
    );
  }

  void navigateToDetailsPage(PendingOrderResponse? item) {
    appRouter.push(PendingOrderDetailsRoute(orderDetails: item));
  }

  Future<void> _getPendingOrderList(bool isProgress) async {
    await _pendingOrderProvider.callPendingOrderListAPI(isProgress: isProgress);
  }

  void _loadMore() {
    if (_pendingOrderProvider.hasMore) {
      _pendingOrderProvider.pageNo += 1;
      _getPendingOrderList(false);
    }
  }
}
