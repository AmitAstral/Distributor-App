import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/product_model.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/focus_products/provider/product_provider.dart';
import 'package:distributor_empower/presentation/quick_order/bottom_sheet/checkout_bottom_sheet.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/product_item_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class QuickOrderScreen extends BaseStatefulWidget {
  const QuickOrderScreen({super.key});

  @override
  BaseState<QuickOrderScreen> createState() => _QuickOrderScreenState();
}

class _QuickOrderScreenState extends BaseState<QuickOrderScreen> {
  final _productProvider = ProductProvider();
  final _isDisableButton = ValueNotifier(true);

  @override
  void initState() {
    _productProvider.getFavProductList();
    super.initState();
  }

  @override
  void onVisibleInvoke() {
    BottomBarNavigationProvider().updateCurrentTab(BottomNavigationEnum.quickOrder);
    super.onVisibleInvoke();
  }

  @override
  Widget buildBody(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _productProvider,
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
        body: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return SmartRefresherWidget(
              controller: refreshController,
              onRefresh: () async {
                _isDisableButton.value = true;
                await _productProvider.getFavProductList();
                refreshController.refreshCompleted();
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
                          return ProductItemWidget(
                            item: item,
                            addRemoveFavCallback: () {
                              _productProvider.addRemoveFromFav(item?.itemId, item?.getRequireAction);
                            },
                            manageAddRemoveQty: _manageAddRemoveQty,
                            isCart: false,
                          );
                        },
                      ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            return provider.favProductList.isEmpty
                ? const SizedBox.shrink()
                : ValueListenableBuilder(
                    valueListenable: _isDisableButton,
                    builder: (context, value, child) {
                      return SizedBox(
                        height: 30.h,
                        width: 0.4.sw,
                        child: AppButton(
                          width: 0.4.sw,
                          text: AppLocalizations.of(context).checkout,
                          icon: Assets.icons.cart.svg(),
                          isDisable: _isDisableButton.value,
                          onPressed: () async {
                            final result = await _productProvider.addToCartAPI();
                            if (result) {
                              CheckoutBottomSheet.checkoutBottomSheetWidget(subGroupId: '', isCart: true);
                            }
                          },
                          textStyle: TextStyles.regular14,
                          isLoading: _productProvider.isButtonLoading,
                        ),
                      );
                    },
                  );
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
    ProductModel? result;
    try {
      result = _productProvider.favProductList.firstWhere(
        (element) => (element?.qty.value ?? 0) > 1,
      );
    } catch (e) {
      debugPrint('NO FOUND');
    }
    _isDisableButton.value = result == null;
  }
}
