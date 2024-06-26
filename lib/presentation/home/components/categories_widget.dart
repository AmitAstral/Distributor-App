import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/presentation/base_statefull_widget.dart';
import 'package:distributor_empower/presentation/home/provider/home_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends BaseStatefulWidget {
  final List<Categories?>? focusProductList;
  final String title;
  final HomeProvider homeProvider;

  const CategoriesWidget(this.focusProductList, {required this.title, required this.homeProvider, super.key});

  @override
  BaseState<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends BaseState<CategoriesWidget> {
  @override
  Widget buildBody(BuildContext context) {
    if (widget.focusProductList?.isEmpty ?? true) return const SizedBox.shrink();
    return SizedBox(
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.title,
                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.focusProductList?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return _buildCategories(index);
                  // ignore: require_trailing_commas
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories(int index) {
    final item = widget.focusProductList?[index];
    return Container(
      width: 130.w,
      margin: const EdgeInsets.only(left: 10).w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: CachedNetworkImageWidget(
                imageUrl: item?.imgUrl ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  (item?.name ?? ''),
                  style: TextStyles.regular13.copyWith(color: AppColor.textSecondary),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
