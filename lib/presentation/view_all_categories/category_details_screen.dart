import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/product_sub_group_model.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/presentation/my_orders/provider/order_provider.dart';
import 'package:distributor_empower/presentation/quick_order/bottom_sheet/checkout_bottom_sheet.dart';
import 'package:distributor_empower/presentation/view_all_categories/product_shimmer_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/shimmer.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class CategoryDetailsScreen extends BaseStatefulWidget {
  final String categoryId;
  final String categoryName;

  const CategoryDetailsScreen({
    required this.categoryId,
    required this.categoryName,
    super.key,
  });

  @override
  BaseState<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends BaseState<CategoryDetailsScreen> {
  final _orderProvider = OrderProvider();
  final _searchController = TextEditingController();
  final _refreshController = RefreshController(initialRefresh: false);

  int _selectedIndex = 0;

  String? productId;

  @override
  void initState() {
    _orderProvider.getProductGroupsByCategories(categoryId: widget.categoryId);
    super.initState();
  }

  @override
  void dispose() {
    _orderProvider.dispose();
    _refreshController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          title: Text(
            widget.categoryName,
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _orderProvider,
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildProductGroupWidget(),
              ),
              Expanded(
                flex: 8,
                child: _buildProductSubGroupWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductGroupWidget() {
    return Container(
      alignment: Alignment.topCenter,
      height: 1.sh,
      decoration: const BoxDecoration(color: AppColor.white),
      child: Consumer<OrderProvider>(
        builder: (context, value, child) {
          return _orderProvider.isCategoryLoading
              ? _buildCategoryShimmerEffect()
              : AnimationLimiter(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10, bottom: 12).h,
                    shrinkWrap: true,
                    itemCount: value.productGroupList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = value.productGroupList[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 1),
                        child: SlideAnimation(
                          verticalOffset: 44,
                          child: FadeInAnimation(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _selectedIndex = index;
                                    productId = item?.id;
                                    _orderProvider.getProductSubGroupList(productGroupId: productId, searchText: _searchController.text.trim());
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4).h,
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.all(7).copyWith(top: 8, bottom: 4),
                                      decoration: BoxDecoration(
                                        color: _selectedIndex == index
                                            ? AppColor.primaryColor.withOpacity(0.3)
                                            : AppColor.primaryColor.withOpacity(0.05),
                                        borderRadius: BorderRadius.circular(200),
                                      ),
                                      child: Container(
                                        child: CachedNetworkImageWidget(
                                          imageUrl: item?.imgUrl ?? '',
                                          imageBuilder: (context, imageProvider) => Container(
                                            width: 0.25.sw,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  item?.description ?? '',
                                  maxLines: 2,
                                  style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }

  Widget _buildProductSubGroupWidget() {
    return Container(
      color: AppColor.grey.withOpacity(0.2),
      child: Consumer<OrderProvider>(
        child: const ProductShimmerWidget(),
        builder: (context, value, child) {
          return Column(
            children: [
              if (!_orderProvider.isLoading.value) _buildSearchTextField(),
              Expanded(
                child: _orderProvider.isLoading.value
                    ? child!
                    : SmartRefresherWidget(
                        controller: _refreshController,
                        onRefresh: () async {
                          await _orderProvider.getProductSubGroupList(
                            productGroupId: productId ?? _orderProvider.productGroupList.firstOrNull?.id,
                            searchText: _searchController.text.trim(),
                            loading: false,
                          );
                          _refreshController.refreshCompleted();
                        },
                        child: _orderProvider.productSubGroupList.isEmpty
                            ? const NoDataFoundWidget()
                            : GridView.builder(
                                shrinkWrap: true,
                                itemCount: _orderProvider.productSubGroupList.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.6),
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 0.0,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  final item = _orderProvider.productSubGroupList[index];
                                  return GestureDetector(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.44,
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: SizedBox(
                                              child: Container(
                                                child: CachedNetworkImageWidget(
                                                  imageUrl: item?.imgUrl ?? '',
                                                  imageBuilder: (context, imageProvider) => Container(
                                                    width: 0.25.sw,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                item?.description ?? '',
                                                maxLines: 2,
                                                style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                                                //   maxLine: 2,
                                              ),
                                            ),
                                          ),
                                          2.verticalSpace,
                                          Expanded(
                                            flex: 2,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: Text(
                                                    item?.unitDesc ?? '',
                                                    maxLines: 2,
                                                    style: TextStyles.regular11.copyWith(color: AppColor.primaryColor),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 4,
                                                  child: InkWell(
                                                    onTap: () => _openProductListBottomSheet(item),
                                                    child: Container(
                                                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                                                      decoration: BoxDecoration(
                                                          color: AppColor.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(5)),
                                                      child: Assets.icons.cart.svg(color: AppColor.black),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Container _buildSearchTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 0, top: 10).copyWith(left: 10, right: 10, bottom: 5),
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
                  /*_selectedIndex = 0;*/
                  _searchController.clear();
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
            _selectedIndex = 0;
            //_searchController.clear();
          },
        ),
      ),
    );
  }

  Widget _buildCategoryShimmerEffect() {
    return ListView.builder(
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            8.verticalSpace,
            const ShimmerEffect.circular(height: 65),
            3.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5).w,
              child: const ShimmerEffect.rectangular(height: 10),
            ),
          ],
        );
      },
    );
  }

  Future<void> _openProductListBottomSheet(ProductSubGroupModel? item) async {
    CheckoutBottomSheet.checkoutBottomSheetWidget(subGroupId: item?.id ?? '', isCart: false);
  }
}
