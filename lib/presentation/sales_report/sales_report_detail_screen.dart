import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/sales_report_details.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
import 'package:distributor_empower/presentation/sales_report/provider/sales_report_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SalesReportDetailScreen extends BaseStatefulWidget {
  final String docId;

  const SalesReportDetailScreen({
    required this.docId,
    super.key,
  });

  @override
  BaseState<SalesReportDetailScreen> createState() => _SalesReportDetailScreenState();
}

class _SalesReportDetailScreenState extends BaseState<SalesReportDetailScreen> {
  final _saleInvoiceDetailProvider = SalesReportProvider();

  SalesReportDetailsResponse? get getSalesReportDetails => _saleInvoiceDetailProvider.salesReportDetails;

  @override
  void initState() {
    _getSalesReportDetails();
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          titleText: AppLocalizations.of(context).salesDetails,
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
          actions: const [
            /*Padding(
                padding: const EdgeInsets.only(right: 10.0).w,
                child: IconButton(
                  icon: const Icon(
                    Icons.picture_as_pdf,
                    color: AppColor.white,
                  ),
                  onPressed: () {
                    //OPEN PDF VIEWER
                    */ /*Get.to(PdfViewerPage(
                      text: "Invoice PDF",
                      url: _saleInvoiceDetailProvider?.saleDeatils?.invoice_URL ?? "",
                      isDownloadable: true,
                    ));*/ /*
                  },
                ),
              )*/
            ],
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: _saleInvoiceDetailProvider,
          builder: (context, child) {
            return Consumer<SalesReportProvider>(builder: (context, value, child) {
              return ProgressWidget(
                inAsyncCall: _saleInvoiceDetailProvider.isLoading.value,
                child: SingleChildScrollView(
                  child: Column(children: [
                    _upperSectionWidget(),
                    2.verticalSpace,
                    _buildMainView(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(top: 7, end: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.topRight,
                              width: 70,
                              child: Assets.images.divider.image(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                                getSalesReportDetails?.totalAmount ?? '0',
                                style: TextStyles.regular11.copyWith(
                                  color: AppColor.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      10.verticalSpace,
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMainView() {
    return getSalesReportDetails == null ? const NoDataFoundWidget() : buildTable();
  }

  Widget _upperSectionWidget() {
    return Column(
      children: [
        1.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          child: Column(
            children: [
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.distributorName,
                        style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                      ),
                      borderedContainer(
                        width: 0.6.sw,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 0.5.sw,
                            child: Text(
                              getSalesReportDetails?.distributorName ?? '',
                              style: TextStyles.semiBold11.copyWith(color: AppColor.secondaryColor),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.mobileNo,
                        style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                      ),
                      borderedContainer(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getSalesReportDetails?.distributorMobile ?? '',
                            style: TextStyles.semiBold11.copyWith(color: AppColor.secondaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  1.horizontalSpace,
                ],
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.address,
                        style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                      ),
                      Row(
                        children: [
                          borderedContainer(
                            width: 0.92.sw,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: 0.86.sw,
                                child: Text(
                                  getSalesReportDetails?.distributorAddress ?? '',
                                  style: TextStyles.semiBold11.copyWith(
                                    color: AppColor.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.date,
                        style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                      ),
                      borderedContainer(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getSalesReportDetails?.invoiceDate ?? '',
                            style: TextStyles.regular11.copyWith(color: AppColor.secondaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.invoiceNo,
                        style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                      ),
                      borderedContainer(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            getSalesReportDetails?.invoiceNo ?? '',
                            style: TextStyles.semiBold11.copyWith(
                              color: AppColor.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  0.5.verticalSpace,
                ],
              ),
              5.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget borderedContainer({child, double width = 100}) {
    return Container(
      padding: const EdgeInsets.only(left: 5).w,
      margin: EdgeInsetsDirectional.only(top: 2.h),
      constraints: BoxConstraints(
        minHeight: 30,
        minWidth: width,
      ),
      decoration:
          BoxDecoration(border: Border.all(width: 0.5, color: AppColor.tableBorderColor), borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: child,
    );
  }

  Widget buildTable() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).h,
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(4),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(3),
        },
        children: List.generate((getSalesReportDetails?.invoiceItemList?.length ?? 0) + 1, (index) {
          return index == 0 ? _buildColum() : _buildRow(index - 1);
        }),
      ),
    );
  }

  TableRow _buildColum() {
    return TableRow(
        decoration: const BoxDecoration(
          color: AppColor.primaryColorLight,
        ),
        children: [
        AppLocalizations.of(context).productName,
        AppLocalizations.of(context).unit,
        AppLocalizations.of(context).qty,
        AppLocalizations.of(context).price,
        AppLocalizations.of(context).amount,
      ]
          .map(
              (title) => TableCell(
                child: Container(
                  alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(5).h,
                margin: const EdgeInsets.only(left: 2).w,
                width: 50,
                child: Text(
                  title,
                  style: TextStyles.regular11,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  TableRow _buildRow(int index) {
    final item = getSalesReportDetails?.invoiceItemList?[index];
    final list = [item?.productName, item?.unit, item?.qty, item?.price, item?.amount];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
        ),
        children: List.generate(
          list.length,
          (no) {
            return TableCell(
              child: Padding(
                padding: const EdgeInsets.all(5).copyWith(right: no == 4 ? 15 : 5).w,
              child: Text(
                list[no] ?? '',
                style: TextStyles.regular11.copyWith(
                  color: AppColor.textSecondary,
                ),
                textAlign: no == 3 || no == 4 ? TextAlign.right : TextAlign.left,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _getSalesReportDetails() async {
    await _saleInvoiceDetailProvider.callSalesReportDetails(widget.docId);
  }
}
