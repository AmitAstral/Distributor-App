import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/sales_report_response.dart';
import 'package:distributor_empower/presentation/sales_report/provider/sales_report_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/app_date_utils.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
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
class SalesReportScreen extends StatefulWidget {
  const SalesReportScreen({
    super.key,
  });

  @override
  State<SalesReportScreen> createState() => _SalesReportScreenState();
}

class _SalesReportScreenState extends State<SalesReportScreen> {
  String? fromDate = storage.settingsData.fYStartDate ?? AppDateUtils.getCurrentDateStr;
  String? toDate = AppDateUtils.getCurrentDateStr;

  final _refreshController = RefreshController(initialRefresh: false);

  final _salesReportProvider = SalesReportProvider();

  List<SalesReportResponse?> get getSalesReportList => _salesReportProvider.salesListResponse;

  @override
  void initState() {
    _getFreshData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: AppBarWidget(
            toolbarHeight: AppBar().preferredSize.height,
            titleText: AppLocalizations.of(context).salesReport,
            centerTitle: true,
            elevation: 0,
            flexibleSpace: null,
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: _salesReportProvider,
          builder: (context, child) {
            return SmartRefresherWidget(
              controller: _refreshController,
              onRefresh: () async {
                if (_salesReportProvider.isLoading.value) {
                  _refreshController.refreshCompleted();
                  return;
                }
                await _getFreshData(isLoading: false);
                _refreshController.refreshCompleted();
              },
              loadMoreData: _loadMore,
              child: Consumer<SalesReportProvider>(builder: (context, value, child) {
                return ProgressWidget(
                  inAsyncCall: _salesReportProvider.isLoading.value,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _upperSectionWidget(),
                        2.verticalSpace,
                        if (!_salesReportProvider.isLoading.value) _buildMainView(),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainView() {
    return getSalesReportList.isEmpty ? const NoDataFoundWidget() : buildTable();
  }

  Widget _upperSectionWidget() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              2.verticalSpace,
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: AppDateUtils.stringToDate(fromDate),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    fromDate = AppDateUtils.dateToString(pickedDate ?? DateTime.now());
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppColor.primaryColorLight,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          fromDate ?? AppLocalizations.current.select,
                          style: TextStyles.semiBold11.copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                        30.horizontalSpace,
                        const Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              5.horizontalSpace,
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if (fromDate == null || (fromDate?.isEmpty ?? true)) {
                      errorToast(AppLocalizations.current.pleaseSelectFromDate);
                      return;
                    }
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: AppDateUtils.stringToDate(toDate!),
                      firstDate: AppDateUtils.stringToDate(fromDate!),
                      lastDate: DateTime.now(),
                    );
                    toDate = AppDateUtils.dateToString(pickedDate ?? DateTime.now());
                    setState(() {});
                  },
                  child: Container(
                    constraints: BoxConstraints(minWidth: 1.sw / 3),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: AppColor.primaryColorLight,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          toDate ?? AppLocalizations.of(context).select,
                          style: TextStyles.semiBold11.copyWith(
                            color: AppColor.textSecondary,
                          ),
                        ),
                        30.horizontalSpace,
                        const Icon(
                          Icons.calendar_month,
                          size: 18,
                          color: AppColor.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              5.horizontalSpace,
              GestureDetector(
                onTap: () {
                  if (fromDate == null) {
                    errorToast(AppLocalizations.current.pleaseSelectFromDate);
                  } else if (toDate == null) {
                    errorToast(AppLocalizations.current.pleaseSelectToDate);
                  } else {
                    _getFreshData(isLoading: true);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(const Radius.circular(5).r),
                    color: AppColor.primaryColor,
                  ),
                  padding: const EdgeInsets.all(4).h,
                  child: const Icon(
                    Icons.search,
                    color: AppColor.white,
                  ),
                ),
              ),
              1.horizontalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTable() {
    return Column(
      children: [
        Table(
          columnWidths: const {3: IntrinsicColumnWidth()},
          children: List.generate(
            getSalesReportList.length + 1,
            (index) {
              return index == 0 ? _buildColum() : _buildRow(index - 1);
            },
          ),
        ),
        if (_salesReportProvider.isPaginationLoading) const PaginationLoader(),
      ],
    );
  }

  TableRow _buildColum() {
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.primaryColorLight,
      ),
      children: [AppLocalizations.current.date, AppLocalizations.current.invoiceNo, AppLocalizations.current.orderAmount, '']
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
    final item = _salesReportProvider.salesListResponse[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
        ),
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.invoiceDate ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          TableCell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  item?.invoiceNo ?? '',
                  style: TextStyles.regular11.copyWith(color: AppColor.black),
                ),
              ).addGesture(
                () {
                  //OPEN PDF VIEWER
                },
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                item?.invoiceAmt ?? '',
                style: TextStyles.regular11.copyWith(color: AppColor.black),
                textAlign: TextAlign.right,
              ),
            ).addGesture(
              () {
                //OPEN PDF VIEWER
              },
            ),
          ),
          TableCell(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(7),
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 10),
                child: const Icon(
                  Icons.chevron_right,
                color: AppColor.black,
                size: 18,
              ),
            ),
          ).addGesture(
            () {
              appRouter.push(SalesReportDetailRoute(docId: item?.invoiceNo ?? ''));
            },
          ),
        ),
      ],
    );
  }

  Future<void> _getFreshData({isLoading = true}) async {
    _salesReportProvider.pageNo = 1;
    _salesReportProvider.hasMore = true;
    await _salesReportProvider.callSalesReportListAPI(fromDate, toDate, isLoading);
  }

  Future<void> _loadMore() async {
    if (_salesReportProvider.hasMore) {
      _salesReportProvider.pageNo += 1;
      await _salesReportProvider.callSalesReportListAPI(fromDate, toDate, false);
    }
  }
}
