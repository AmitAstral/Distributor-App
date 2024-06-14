import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/sales_report/provider/sales_report_provider.dart';
import 'package:distributor_empower/utils/date_utils.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SalesReportDetailScreen extends StatefulWidget {
  final String docId;
  final String date;

  const SalesReportDetailScreen({
    required this.docId,
    required this.date,
    super.key,
  });

  @override
  State<SalesReportDetailScreen> createState() => _SalesReportDetailScreenState();
}

class _SalesReportDetailScreenState extends State<SalesReportDetailScreen> {
  String? fromDate = AppDateUtils.getCurrentDateStr;
  String? toDate = AppDateUtils.getCurrentDateStr;

  final _saleInvoiceDetailProvider = SalesReportProvider();

  @override
  void initState() {
    //_saleInvoiceDetailProvider.fetchDetailData(widget.docId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: AppBarWidget(
            toolbarHeight: AppBar().preferredSize.height,
            titleText: AppLocalizations.of(context).salesDetails,
            centerTitle: true,
            elevation: 0,
            flexibleSpace: null,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0).w,
                child: IconButton(
                  icon: const Icon(
                    Icons.picture_as_pdf,
                    color: AppColor.white,
                  ),
                  onPressed: () {
                    //OPEN PDF VIEWER
                    /*Get.to(PdfViewerPage(
                      text: "Invoice PDF",
                      url: _saleInvoiceDetailProvider?.saleDeatils?.invoice_URL ?? "",
                      isDownloadable: true,
                    ));*/
                  },
                ),
              )
            ],
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: _saleInvoiceDetailProvider,
          builder: (context, child) {
            return Consumer<SalesReportProvider>(builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(children: [
                  _upperSectionWidget('value.saleDeatils'),
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
                            /*value.saleDeatils?.total_amount ?? ""*/
                            'Total Amount',
                            style: TextStyles.regular11.copyWith(
                              color: AppColor.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              );
            });
          },
        ));
  }

  Widget _buildMainView() {
    return true /*(_saleInvoiceDetailProvider.saleDeatils?.invoiceItem_List?.length ?? 0) <= 0*/
        ? const NoDataFoundWidget()
        : buildTable();
  }

  Widget _upperSectionWidget(/*SaleReportDetailModel?*/ value) {
    return Column(
      children: [
        1.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.04.sw),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.current.partyName,
                        style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                      ),
                      borderedContainer(
                        width: 0.6.sw,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            width: 0.5.sw,
                            child: Text(
                              /*value?.party_name ?? */
                              "Party name",
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
                            '956631233123',
                            style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                  1.horizontalSpace,
                ],
              ),
              0.5.verticalSpace,
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
                                  'value?.party_address ?? ""',
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
              0.5.verticalSpace,
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
                            '25/05/2001',
                            style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
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
                            '1002120',
                            style: TextStyles.semiBold11.copyWith(
                              color: AppColor.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  0.5.verticalSpace,
                ],
              ),
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
    return Table(
        columnWidths: const {
          0: FlexColumnWidth(4),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(2),
          4: FlexColumnWidth(3),
        },
        children: List.generate(/*(_saleInvoiceDetailProvider.saleDeatils?.invoiceItem_List?.length ?? 0) +*/ 1, (index) {
          return index == 0 ? _buildColum() : _buildRow(index - 1);
        }));
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
          AppLocalizations.of(context).amount
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
                    style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                  ),
                ),
              ),
            )
            .toList());
  }

  TableRow _buildRow(int index) {
    //final item = _saleInvoiceDetailProvider.saleDeatils?.invoiceItem_List?[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
        ),
        children: ['Product Name', 'unit', 'qty', 'price', 'amount']
            .map(
              (value) => TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    value,
                    style: TextStyles.regular11.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }
}
