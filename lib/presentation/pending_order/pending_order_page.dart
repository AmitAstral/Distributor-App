import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/pending_order/provider/pending_order_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class PendingOrderScreen extends StatefulWidget {
  const PendingOrderScreen({super.key});

  @override
  State<PendingOrderScreen> createState() => _PendingOrderScreenState();
}

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  final _pendingOrderProvider = PendingOrderProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Consumer<PendingOrderProvider>(
          builder: (context, value, child) {
            return ProgressWidget(
              inAsyncCall: value.isLoading.value,
              child: SmartRefresherWidget(
                controller: _refreshController,
                onRefresh: () {},
                child: value.pendingOrderListResponse.isEmpty && false
                    ? const NoDataFoundWidget()
                    : SingleChildScrollView(
                        child: _createDataTable(),
                      ),
              ),
            );
          },
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

  Widget _createDataTable() {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: buildTable());
  }

  Widget buildTable() {
    return Table(
        columnWidths: const <int, TableColumnWidth>{
          4: IntrinsicColumnWidth(),
        },
        children: List.generate(/*_pendingOrderProvider.pendingOrderListResponse.length + 1*/ 10, (index) {
          return index == 0 ? _buildColum() : _buildRow(index - 1);
        }));
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
        ]);
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
    ));
  }

  TableRow _buildRow(int index) {
    //final item = _pendingOrderProvider.pendingOrderListResponse[index];
    return TableRow(
        decoration: BoxDecoration(
          color: index % 2 == 0 ? AppColor.grey88.withOpacity(0.2) : AppColor.primaryColorLight.withOpacity(0.3),
        ),
        children: [
          TableCell(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5).h,
                child: Text(
                  '100001',
                  style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                ),
              ),
            ),
          ),
          TableCell(
              child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(5).h,
            child: Text(
              '25/05/2024',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              textAlign: TextAlign.center,
            ),
          )),
          TableCell(
              child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(5).h,
            child: Text(
              '12,000',
              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
              textAlign: TextAlign.right,
            ),
          )),
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(5).h,
              child: Text(
                'Success',
                style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                navigateToDetailsPage('');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5).w,
                child: const Icon(Icons.keyboard_arrow_right_outlined),
              )),
        ]);
  }

  void navigateToDetailsPage(item) {
    appRouter.push(const PendingOrderDetailsRoute());
  }
}
