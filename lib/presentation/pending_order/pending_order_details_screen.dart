import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/pending_order/provider/pending_order_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PendingOrderDetailsScreen extends StatefulWidget {
  const PendingOrderDetailsScreen({super.key});

  @override
  State<PendingOrderDetailsScreen> createState() => _PendingOrderDetailsScreenState();
}

class _PendingOrderDetailsScreenState extends State<PendingOrderDetailsScreen> {
  final _pendingOrderProvider = PendingOrderProvider();

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
    );
  }

  Widget _createDataTable() {
    return Flexible(
      child: SingleChildScrollView(
        child: Table(
            columnWidths: const {0: FixedColumnWidth(140)},
            children: List.generate(/*_pendingOrderProvider.pendingOrderDetailsResponse.length + 1*/ 10, (index) {
              return index == 0 ? _buildColum() : _buildRow(index - 1);
            })),
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
                style: TextStyles.semiBold11,
              ),
            ),
          ),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                AppLocalizations.of(context).unit,
                style: TextStyles.semiBold11,
              ),
            ),
          ),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              AppLocalizations.of(context).orderQty,
              style: TextStyles.semiBold11,
            ),
          )),
          TableCell(
            child: Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context).pendingQty,
                style: TextStyles.semiBold11,
              ),
            ),
          ),
          TableCell(
              child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(5),
            child: Text(
              AppLocalizations.of(context).pendingAmt,
              style: TextStyles.semiBold11,
            ),
          )),
        ]);
  }

  TableRow _buildRow(int index) {
    //final item = _pendingOrderProvider.pendingOrderDetailsResponse[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.grey88.withOpacity(0.2) : AppColor.primaryColorLight.withOpacity(0.3),
        ),
        children: [
          TableCell(
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(5).h,
              child: Text(
                'ItemId',
                style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ),
          TableCell(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5).h,
              child: Text(
                'unit',
                style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
              ),
            ),
          )),
          TableCell(
              child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(5).h,
            child: Text(
              'orderQty',
              style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
            ),
          )),
          TableCell(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(5).h,
              child: Text(
                'pendingQty',
                style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ),
          TableCell(
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(5).h,
              child: Text(
                'Pending Amt',
                style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
              ),
            ),
          ),
        ]);
  }

  Widget _buildUpperView() {
    return Row(
      children: [
        10.horizontalSpace,
        _buildTextView(AppLocalizations.current.orderNo, 'Order No' /*widget.pendingOrderData.orderNo ?? ''*/),
        const Spacer(),
        _buildTextView(AppLocalizations.current.date, '24/02/2024' /*widget.pendingOrderData.formattedDate ?? ''*/),
        10.horizontalSpace,
      ],
    );
  }

  Widget _buildTextView(String title, String? value) {
    return Row(
      children: [
        Text(title),
        const Text(' : '),
        Text(value ?? ''),
      ],
    );
  }
}
