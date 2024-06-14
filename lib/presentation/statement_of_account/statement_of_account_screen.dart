import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/statement_of_account/provider/statement_provider.dart';
import 'package:distributor_empower/utils/date_utils.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class StatementOfAccountScreen extends StatefulWidget {
  const StatementOfAccountScreen({super.key});

  @override
  State<StatementOfAccountScreen> createState() => _StatementOfAccountScreenState();
}

class _StatementOfAccountScreenState extends State<StatementOfAccountScreen> {
  int i = 0;

  String? fromDate;
  String? toDate;

  final _ledgerProvider = StatementProvider();

  @override
  void initState() {
    //fromDate = getSharedPreferenceUtils().getString(AppConst.keyFYStartDate).replaceAll("-", ' '); TODO
    fromDate = AppDateUtils.getCurrentDateStr;
    toDate = AppDateUtils.getCurrentDateStr;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: AppBarWidget(
            toolbarHeight: AppBar().preferredSize.height,
            titleText: AppLocalizations.of(context).statementOfAccounts,
            centerTitle: true,
            elevation: 0,
            flexibleSpace: null,
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: _ledgerProvider,
          builder: (context, child) {
            return Consumer<StatementProvider>(builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(children: [
                  _upperSectionWidget(),
                  15.verticalSpace,
                  _buildMiddleView(),
                  10.verticalSpace,
                  _buildMainView(),
                ]),
              );
            });
          },
        ));
  }

  Padding _buildMiddleView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTextView(AppLocalizations.of(context).partyWithName(''), storage.userDetails.distributorName ?? '')),
              2.horizontalSpace,
              Expanded(child: _buildTextView(AppLocalizations.of(context).address, storage.userDetails.address ?? '')),
            ],
          ),
          _buildTextView('SapCode', storage.userDetails.distributorSapCode ?? ''),
        ],
      ),
    );
  }

  Widget _buildTextView(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title : ',
          style: TextStyles.regular11.copyWith(
            color: AppColor.textSecondary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            value,
            maxLines: 4,
            style: TextStyles.semiBold11.copyWith(
              color: AppColor.textSecondary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainView() {
    return _ledgerProvider.statementList.isEmpty ? const NoDataFoundWidget() : buildTable();
  }

  Widget _upperSectionWidget() {
    return Column(
      children: [
        10.verticalSpace,
        if (true) // checkBalance
          Text(
            '100100',
            style: TextStyles.bold20.copyWith(color: AppColor.textSecondary),
          ),
        10.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              2.verticalSpace,
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context, initialDate: AppDateUtils.stringToDate(fromDate), firstDate: DateTime(1950), lastDate: DateTime.now());
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
                          style: TextStyles.regular11.copyWith(
                            color: AppColor.primaryColor,
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
              15.horizontalSpace,
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
                        lastDate: DateTime.now());
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              GestureDetector(
                onTap: () {
                  if (fromDate == null) {
                    errorToast(AppLocalizations.of(context).pleaseSelectFromDate);
                  } else if (toDate == null) {
                    errorToast(AppLocalizations.of(context).pleaseSelectToDate);
                  } else {
                    //_ledgerProvider.fetchData(widget.marketVisitListModel?.outlet ?? '', fromDate, toDate);
                  }
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: AppColor.primaryColor,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.search,
                    color: AppColor.white,
                  ),
                ),
              ),
              10.horizontalSpace,
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTable() {
    return Table(
        children: List.generate(_ledgerProvider.statementList.length + 1, (index) {
      return index == 0 ? _buildColum() : _buildRow(index - 1);
    }));
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
                AppLocalizations.current.date,
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(5),
              child: Text(
                AppLocalizations.of(context).narration,
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),
          TableCell(
              child: Center(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(5),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Text(
                    'Debit',
                    style: TextStyles.semiBold11.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                  Text(
                    'Credit',
                    style: TextStyles.semiBold11.copyWith(
                      color: AppColor.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          )),
          TableCell(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                AppLocalizations.of(context).balance,
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          )),
        ]);
  }

  TableRow _buildRow(int index) {
    final item = _ledgerProvider.statementList[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.grey88.withOpacity(0.2) : AppColor.primaryColorLight.withOpacity(0.3),
        ),
        children: [
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                '25/05/1999',
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Narration',
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Credit',
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Balance',
                style: TextStyles.semiBold11.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            ),
          ),
        ]);
  }
}
