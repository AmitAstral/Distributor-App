import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/statement_response.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
import 'package:distributor_empower/presentation/statement_of_account/provider/statement_provider.dart';
import 'package:distributor_empower/utils/app_date_utils.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class StatementOfAccountScreen extends BaseStatefulWidget {
  const StatementOfAccountScreen({super.key});

  @override
  BaseState<StatementOfAccountScreen> createState() => _StatementOfAccountScreenState();
}

class _StatementOfAccountScreenState extends BaseState<StatementOfAccountScreen> {
  String? fromDate = storage.settingsData.fYStartDate ?? AppDateUtils.getCurrentDateStr;
  String? toDate = AppDateUtils.getCurrentDateStr;

  final _statementProvider = StatementProvider();

  List<StatementResponse?> get statementList => _statementProvider.accountStatementList;

  @override
  void initState() {
    _getStatementOfAccount();
    super.initState();
  }

  @override
  void dispose() {
    _statementProvider.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
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
          value: _statementProvider,
          builder: (context, child) {
            return Consumer<StatementProvider>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _upperSectionWidget(),
                    15.verticalSpace,
                    _buildMiddleView(),
                    10.verticalSpace,
                    _buildMainView(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
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
              Expanded(child: _buildTextView(AppLocalizations.of(context).partyWithName, storage.userDetails.distributorName ?? '')),
              2.horizontalSpace,
              Expanded(child: _buildTextView(AppLocalizations.of(context).address, storage.userDetails.address ?? '')),
            ],
          ),
          //_buildTextView('SapCode', storage.userDetails.distributorSapCode ?? ''),
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
          style: TextStyles.semiBold11.copyWith(
            color: AppColor.textSecondary,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            value,
            maxLines: 4,
            style: TextStyles.regular11.copyWith(
              color: AppColor.textSecondary,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainView() {
    if (_statementProvider.isLoading.value) {
      return SizedBox(
        height: 100.h,
        child: ProgressWidget(
          inAsyncCall: _statementProvider.isLoading.value,
          opacity: 0,
          child: const SizedBox.shrink(),
        ),
      );
    }
    return statementList.isEmpty ? const SizedBox(height: 200, child: NoDataFoundWidget()) : buildTable();
  }

  Widget _upperSectionWidget() {
    return Column(
      children: [
        10.verticalSpace,
        if (statementList.lastOrNull != null)
          Text(
            statementList.lastOrNull?.balance ?? '',
            style: TextStyles.bold20.copyWith(color: AppColor.textSecondary),
          ),
        10.verticalSpace,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  if (_statementProvider.isLoading.value) return;
                  if (fromDate == null) {
                    errorToast(AppLocalizations.of(context).pleaseSelectFromDate);
                  } else if (toDate == null) {
                    errorToast(AppLocalizations.of(context).pleaseSelectToDate);
                  } else {
                    _getStatementOfAccount();
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
          children: List.generate(_statementProvider.accountStatementList.length + 1, (index) {
            return index == 0 ? _buildColum() : _buildRow(index - 1);
          }),
        ),
        20.verticalSpace,
      ],
    );
  }

  TableRow _buildColum() {
    final columList = [
      AppLocalizations.current.date,
      AppLocalizations.current.narration,
      AppLocalizations.current.debit,
      AppLocalizations.current.balance,
    ];
    return TableRow(
      decoration: const BoxDecoration(
        color: AppColor.primaryColorLight,
      ),
      children: List.generate(
          4,
          (index) => TableCell(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(5).h,
                  margin: const EdgeInsets.only(left: 8).w,
                  child: index == 2
                      ? Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(
                              AppLocalizations.of(context).debit,
                              style: TextStyles.semiBold11.copyWith(
                                color: AppColor.red,
                              ),
                            ),
                            5.horizontalSpace,
                            Text(
                              AppLocalizations.of(context).credit,
                              style: TextStyles.semiBold11.copyWith(
                          color: AppColor.green,
                        ),
                      ),
                    ],
                  )
                : Text(
                    columList[index],
                    style: TextStyles.semiBold11,
                  ),
          ),
        ),
      ),
    );
  }

  TableRow _buildRow(int index) {
    final item = _statementProvider.accountStatementList[index];
    final listValue = [item?.date, item?.narration, item?.debitCredit, item?.balance];
    return TableRow(
      decoration: BoxDecoration(
        color: index % 2 == 0 ? AppColor.tableEvenRowColor : AppColor.tableOddRowColor,
      ),
      children: List.generate(
        4,
        (index) => TableCell(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              listValue[index] ?? '',
              style: TextStyles.regular11.copyWith(
                color: index == 2 ? item?.color.getColorFromString : AppColor.textSecondary,
              ),
              textAlign: index == 2 || index == 3 ? TextAlign.right : TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }

  void _getStatementOfAccount() {
    _statementProvider.callStatementOfAccountAPI(fromDate, toDate);
  }
}
