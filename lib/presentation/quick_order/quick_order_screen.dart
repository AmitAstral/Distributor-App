import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/focus_products/provider/product_provider.dart';
import 'package:distributor_empower/presentation/quick_order/checkout_bottom_sheet.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class QuickOrderScreen extends StatefulWidget {
  const QuickOrderScreen({super.key});

  @override
  State<QuickOrderScreen> createState() => _QuickOrderScreenState();
}

class _QuickOrderScreenState extends State<QuickOrderScreen> {
  final _productProvider = ProductProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _productProvider.getFavProductList();
    super.initState();
  }

  @override
  void dispose() {
    _productProvider.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        BottomBarNavigationProvider().selectHomePage();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5.h),
          child: AppBarWidget(
            toolbarHeight: AppBar().preferredSize.height,
            title: Text(
              AppLocalizations.of(context).quickOrder,
              maxLines: 1,
              style: TextStyles.semiBold16,
            ),
            leading: const SizedBox.shrink(),
            centerTitle: true,
            elevation: 0,
            flexibleSpace: null,
          ),
        ),
        body: ChangeNotifierProvider.value(
          value: _productProvider,
          child: Consumer<ProductProvider>(builder: (context, provider, child) {
            return SmartRefresherWidget(
              controller: _refreshController,
              onRefresh: () async {
                await _productProvider.getFavProductList(loading: false);
                _refreshController.refreshCompleted();
              },
              child: ProgressWidget(
                inAsyncCall: provider.isLoading.value,
                child: _productProvider.favProductList.isEmpty
                    ? const NoDataFoundWidget()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _productProvider.favProductList.length,
                        itemBuilder: (context, index) {
                          final item = _productProvider.favProductList[index];
                          return Container(
                            width: 1.sw,
                            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                            margin: EdgeInsets.only(bottom: index == 9 ? 50.h : 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                left: const BorderSide(color: Color(0xFF9B9B9B)),
                                top: const BorderSide(color: Color(0xFF9B9B9B)),
                                right: const BorderSide(color: Color(0xFF9B9B9B)),
                                bottom: index == _productProvider.favProductList.length
                                    ? const BorderSide(width: 1, color: Color(0xFF9B9B9B))
                                    : BorderSide.none,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.only(top: 21.w),
                                        width: 105.w,
                                        height: 80.w,
                                        child: CachedNetworkImageWidget(imageUrl: item?.imgUrl ?? ''),
                                      ),
                                      StatefulBuilder(builder: (context, state) {
                                        return Icon(
                                              Icons.bookmark_rounded,
                                              size: 20.sp,
                                              color: (item?.isFav ?? false) ? AppColor.leavePendingColor : AppColor.grey,
                                            ).addGesture(
                                              () {
                                                item?.isFav = !item.isFav;
                                                _productProvider.addRemoveFromFav(item?.itemId, item?.getRequireAction);
                                                state(() {});
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.w).copyWith(top: 0, bottom: 0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 2.w),
                                          child: Text(
                                            item?.name ?? '',
                                            style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2.w),
                                          child: Text(
                                            (item?.weight ?? ''),
                                            style: TextStyles.regular12.copyWith(color: AppColor.leavePendingColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 2.w),
                                          child: Text(
                                            '${storage.settingsData.currencySymbol ?? ''} ${item?.dp ?? ''}',
                                            style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                                          ),
                                        ),
                                        /*Padding(
                                        padding: EdgeInsets.only(top: 2.w),
                                        child: Text(
                                          'Min Qty. 20',
                                          style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                                        ),
                                      ),*/
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.topCenter,
                                        margin: EdgeInsets.only(left: 3.w),
                                        decoration: BoxDecoration(
                                          border: Border.all(width: 1, color: const Color(0xFFE8E8E8)),
                                          borderRadius: BorderRadius.circular(20.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsets.all(5.w),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                      borderRadius:
                                                          BorderRadius.only(topLeft: Radius.circular(20.r), bottomLeft: Radius.circular(20.r)),
                                                    ),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 16.sp,
                                                    ),
                                                  ),
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.only(left: 4.w, right: 4.w),
                                                width: 42,
                                                child: TextFormField(
                                                  maxLength: 3,
                                                  style: TextStyle(fontSize: 11.sp),
                                                  textAlign: TextAlign.center,
                                                  controller: TextEditingController()..text = item?.cartonQty ?? '0',
                                                  cursorColor: AppColor.black,
                                                  decoration: InputDecoration(
                                                    counterText: '',
                                                    hintStyle: TextStyle(fontSize: 12.sp),
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.all(5.r),
                                                  ),
                                                  keyboardType: TextInputType.phone,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding: EdgeInsets.all(5.w),
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                      borderRadius:
                                                          BorderRadius.only(topRight: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
                                                    ),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 16.sp,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                        ),
                                      ),
                                      /* Padding(
                                      padding: EdgeInsets.only(top: 5.w),
                                      child: Text(
                                        '50x₹10',
                                        style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                                      )),*/
                                      Padding(
                                        padding: EdgeInsets.only(top: 10.w),
                                        child: Text(
                                          item?.getTotalPrice ?? '',
                                            style: TextStyles.semiBold13.copyWith(color: AppColor.textSecondary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.horizontalSpace,
                                ],
                              ),
                            );
                          },
                        ),
                ),
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColor.primaryColor),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          onPressed: () {
            CheckoutBottomSheet.checkoutBottomSheetWidget(
              context,
              AppLocalizations.of(context).chooseQuantity,
              AppLocalizations.of(context).addToCart,
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Assets.icons.cart.svg(),
              ),
              Text(
                AppLocalizations.of(context).checkout,
                textAlign: TextAlign.justify,
                style: TextStyles.semiBold13.copyWith(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
