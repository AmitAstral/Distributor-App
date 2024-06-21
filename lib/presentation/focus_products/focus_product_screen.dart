import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/presentation/focus_products/provider/product_provider.dart';
import 'package:distributor_empower/presentation/home/components/product_view_widget.dart';
import 'package:distributor_empower/presentation/home/provider/home_provider.dart';
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
class FocusProductScreen extends StatefulWidget {
  final String? title;
  final HomeProvider homeProvider;

  const FocusProductScreen({
    super.key,
    required this.title,
    required this.homeProvider,
  });

  @override
  State<FocusProductScreen> createState() => _FocusProductScreenState();
}

class _FocusProductScreenState extends State<FocusProductScreen> {
  final _focusProductProvider = ProductProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _focusProductProvider.getFocusProductsList();
    super.initState();
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
            widget.title ?? '',
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _focusProductProvider,
        child: Consumer<ProductProvider>(builder: (context, provider, child) {
          return SmartRefresherWidget(
            controller: _refreshController,
            onRefresh: () async {
              await _focusProductProvider.getFocusProductsList(
                loading: false,
              );
              _refreshController.refreshCompleted();
            },
            child: ProgressWidget(
              inAsyncCall: provider.isLoading.value,
              child: _focusProductProvider.focusProductList.isEmpty
                  ? const NoDataFoundWidget()
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).w,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 5 / 7),
                          itemCount: _focusProductProvider.focusProductList.length,
                          itemBuilder: (context, index) {
                            final item = _focusProductProvider.focusProductList[index];
                            return Container(
                              width: 0.5.sw,
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5).h,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(width: 0.50, color: Color(0xFF333333)),
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: ProductViewWidget(
                                item: item,
                                onChangeFav: () {
                                  widget.homeProvider.updateFavItem(item);
                                  _focusProductProvider.addRemoveFromFav(item);
                                },
                              ),
                            );
                          }),
                    ),
            ),
          );
        }),
      ),
    );
  }
}
