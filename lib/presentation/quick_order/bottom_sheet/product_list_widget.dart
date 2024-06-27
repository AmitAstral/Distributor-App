import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/product_model.dart';
import 'package:distributor_empower/presentation/my_orders/provider/order_provider.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/product_item_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatefulWidget {
  final String subGroupId;
  final bool isCart;

  const ProductListWidget({required this.subGroupId, required this.isCart, super.key});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  final _orderProvider = OrderProvider();
  final _searchController = TextEditingController();

  final _netValue = ValueNotifier(0.0);

  @override
  void initState() {
    _getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _orderProvider,
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.9,
        maxChildSize: 0.9,
        minChildSize: 0.32,
        builder: (context, scrollController) {
          return Consumer<OrderProvider>(
            child: Container(
              decoration: ShapeDecoration(
                color: AppColor.lightGrey2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: const Color(0x14000000),
                    blurRadius: 30.r,
                    offset: const Offset(0, -4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColor.primaryColor,
                    ),
                    height: 5.h,
                    width: 50.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        Consumer<OrderProvider>(
                          builder: (context, value, child) {
                            return Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: widget.isCart ? AppLocalizations.of(context).myCart : AppLocalizations.current.chooseQty,
                                        style: TextStyles.bold15.copyWith(color: AppColor.textSecondary),
                                      ),
                                      TextSpan(
                                        text: widget.isCart
                                            ? AppLocalizations.of(context).totalItemsName(_orderProvider.productList.length)
                                            : AppLocalizations.of(context).totalSkuWithNo(_orderProvider.productList.length),
                                        style: TextStyles.semiBold12.copyWith(color: AppColor.textSecondary),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xFF7F7F7F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildSearchTextField(),
                  5.verticalSpace,
                  const Divider(height: 1),
                ],
              ),
            ),
            builder: (context, provider, child) {
              return ProgressWidget(
                inAsyncCall: provider.isLoading.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    child!,
                    Expanded(
                      child: AnimationLimiter(
                        child: _orderProvider.filteredProductList.isEmpty
                            ? const NoDataFoundWidget()
                            : ListView.builder(
                                controller: scrollController,
                                shrinkWrap: true,
                                itemCount: _orderProvider.filteredProductList.length,
                                itemBuilder: (context, index) {
                                  final item = _orderProvider.filteredProductList[index];
                                  return ProductItemWidget(
                                    item: item,
                                    addRemoveCallback: () {
                                      _orderProvider.addRemoveFromFav(item?.id, item?.getRequireAction);
                                    },
                                    manageAddRemoveQty: _manageAddRemoveQty,
                                    isCart: widget.isCart,
                                    deleteFromCart: () {
                                      if (widget.isCart) {
                                        CommonDialog.showCommonDialog(
                                          title: AppLocalizations.of(context).areYouSureYouWantToDeleteThisProductFrom,
                                          positiveTitle: AppLocalizations.current.yes,
                                          negativeTitle: AppLocalizations.current.no,
                                          onPositivePressed: () {
                                            _orderProvider.removeProductFromCart(productId: item?.id);
                                          },
                                        );
                                      }
                                    },
                                  );
                                },
                              ),
                      ),
                    ),
                    if (_orderProvider.productList.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context).total,
                                    style: TextStyles.semiBold13.copyWith(color: AppColor.textSecondary),
                                  ),
                                  3.verticalSpace,
                                  ValueListenableBuilder(
                                    valueListenable: _netValue,
                                    builder: (context, value, child) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.toString().formatWithCurrency,
                                            style: TextStyles.semiBold16.copyWith(color: AppColor.textSecondary),
                                          ),
                                          2.verticalSpace,
                                          Text(
                                            AppLocalizations.of(context).itemsWithNo(
                                              _orderProvider.productList
                                                  .where(
                                                    (e) => (e?.qty.value ?? 0) > 0,
                                                  )
                                                  .length
                                                  .toString(),
                                            ),
                                            style: TextStyles.regular11.copyWith(color: AppColor.textSecondary),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            AppButton(
                              text: widget.isCart ? AppLocalizations.of(context).placeOrder : AppLocalizations.of(context).addToCart,
                              isLoading: _orderProvider.isButtonLoading,
                              onPressed: () {
                                if (widget.isCart) {
                                  CommonDialog.showCommonDialog(
                                    title: AppLocalizations.of(context).areYouSureYouWantToConfirmOnceConfirmedIt,
                                    positiveTitle: AppLocalizations.current.yes,
                                    negativeTitle: AppLocalizations.current.no,
                                    onPositivePressed: () {
                                      _orderProvider.orderSaveAPI(remarks: '');
                                      //TODO
                                      // Order place DIALOG
                                    },
                                  );
                                } else {
                                  _orderProvider.addToCartAPI();
                                }
                              },
                              icon: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Assets.icons.cart.svg(),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSearchTextField() {
    if (_orderProvider.productList.isEmpty) return const SizedBox.shrink();
    return Container(
      margin: const EdgeInsets.only(bottom: 0, top: 5).copyWith(left: 10, right: 10, bottom: 5),
      padding: const EdgeInsets.all(18).copyWith(top: 5, bottom: 5),
      decoration: const BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          maxLength: 30,
          controller: _searchController,
          style: const TextStyle(
            fontFamily: 'regular',
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.none,
            color: AppColor.black,
            fontSize: 13,
          ),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            suffixIcon: Visibility(
              visible: _searchController.text.isNotEmpty,
              child: IconButton(
                onPressed: () {
                  _searchController.clear();
                  _orderProvider.searchProducts('');
                },
                icon: const Icon(Icons.close, size: 20),
              ),
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                Icons.search,
                size: 21,
                color: AppColor.black.withOpacity(0.5),
              ),
            ),
            hintText: AppLocalizations.of(context).search,
            hintStyle: TextStyle(
              fontFamily: 'regular',
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              color: AppColor.black.withOpacity(0.5),
              fontSize: 13,
            ),
          ),
          keyboardType: TextInputType.text,
          onChanged: (val) {
            _orderProvider.searchProducts(val.trim());
          },
        ),
      ),
    );
  }

  void _manageAddRemoveQty(ProductModel? item, bool isAdd) {
    int currentQty = item?.textController.text.tryParseToNum.toInt() ?? 0;

    if (!isAdd && currentQty == 0) {
      return;
    }

    final minQty = item?.cartonNo.tryParseToNum.toInt() ?? 0;

    if (currentQty < minQty) {
      currentQty = minQty;
    } else if (currentQty % minQty != 0) {
      currentQty = isAdd ? ((currentQty ~/ minQty) + 1) * minQty : ((currentQty ~/ 20) * 20);
    } else {
      if (isAdd) {
        currentQty += minQty;
      } else {
        currentQty -= minQty;
      }
    }
    item?.textController.text = currentQty.toString();
    item?.qty.value = currentQty;
    _updateNetAmount();
  }

  Future<void> _getProductList() async {
    if (widget.isCart) {
      await _orderProvider.getCartProductList();
      _updateNetAmount();
    } else {
      _orderProvider.getProductList(widget.subGroupId);
    }
  }

  void _updateNetAmount() {
    _netValue.value = (_orderProvider.productList
        .map(
          (e) => e?.getNetAmount ?? 0,
        )
        .toList()
        .reduce((a, b) => a + b)
        .toDouble());
  }
}

num sum<T extends num>(T lhs, T rhs) => lhs + rhs;
