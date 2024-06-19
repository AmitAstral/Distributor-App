import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/drop_down_response.dart';
import 'package:distributor_empower/presentation/my_orders/provider/order_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/pagination_loader.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final _orderProvider = OrderProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _orderProvider.getDropDownList();
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
            AppLocalizations.of(context).myOrder,
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _orderProvider,
        child: SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: () async {
            _orderProvider.hasMore = true;
            await _getOrderList(pageNo: 1, isLoading: false);
            _refreshController.refreshCompleted();
          },
          loadMoreData: () {
            _getOrderList(pageNo: _orderProvider.pageNo + 1, isLoading: false);
          },
          child: Consumer<OrderProvider>(builder: (context, provider, child) {
            return ProgressWidget(
              inAsyncCall: provider.isLoading.value,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildPopupMenu,
                    _buildOrderList,
                    if (provider.isPaginationLoading) const PaginationLoader(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget get _buildOrderList {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _orderProvider.orderListResponse.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = _orderProvider.orderListResponse[index];
        return Container(
          width: 1.sw,
          margin: EdgeInsets.only(
            left: 12.w,
            right: 12.w,
            top: 5.h,
          ),
          padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h, bottom: 8.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1.50, color: AppColor.primaryColorLight), borderRadius: BorderRadius.circular(10.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppLocalizations.current.date} : ',
                    textAlign: TextAlign.start,
                    style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                  ),
                  Text(
                    '${item?.date}',
                    textAlign: TextAlign.start,
                    style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                  ),
                  const Spacer(),
                  Text(
                    '${AppLocalizations.current.orderNo} : ',
                    textAlign: TextAlign.end,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                  ),
                  Text(
                    '${item?.orderNo}',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                  ),
                ],
              ),
              4.verticalSpace,
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${AppLocalizations.current.orderValue} : ',
                          style: TextStyles.regular11.copyWith(color: AppColor.hintTextColor),
                        ),
                        TextSpan(text: '${item?.orderAmount}', style: TextStyles.semiBold11.copyWith(color: AppColor.hintTextColor)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${AppLocalizations.current.totalSku} : ',
                    textAlign: TextAlign.end,
                    style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                  ),
                  Text(
                    '${item?.totalSKU}',
                    textAlign: TextAlign.start,
                    style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                  ),
                ],
              ),
            ],
          ),
        ).addGesture(
          () {
            appRouter.pushNamed(OrderDetailsRoute.name);
          },
        );
      },
    );
  }

  Widget get _buildPopupMenu {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              5.r,
            ),
            border: Border.all(color: AppColor.primaryColorLight),
          ),
          child: PopupMenuButton<DropDownResponse>(
            initialValue: _orderProvider.selectedMenu,
            child: Consumer<OrderProvider>(
              builder: (context, value, child) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    5.horizontalSpace,
                    Text(
                      _orderProvider.selectedMenu?.displayName ?? '',
                      style: TextStyles.semiBold12.copyWith(
                        color: AppColor.textSecondary,
                      ),
                    ),
                    5.horizontalSpace,
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      size: 20.h,
                      color: AppColor.textSecondary,
                    )
                  ],
                );
              },
            ),
            itemBuilder: (context) {
              return List.generate(
                _orderProvider.dropDownList.length,
                (index) {
                  final item = _orderProvider.dropDownList[index];
                  return PopupMenuItem(
                    child: Text(item?.displayName ?? ''),
                    onTap: () {
                      if (_orderProvider.selectedMenu?.value == item?.value) return;
                      _orderProvider.updateSelectedMenu(item);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Future<void> _getOrderList({required int pageNo, required bool isLoading}) async {
    if (!_orderProvider.isLoading.value && _orderProvider.hasMore) {
      _orderProvider.pageNo = pageNo;
      await _orderProvider.callGetOrderListAPI(isLoading);
    }
  }
}
