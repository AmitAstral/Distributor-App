import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatefulWidget {
  final List<Categories?>? focusProductList;
  final String title;

  const CategoriesWidget(this.focusProductList, {required this.title, super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
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
    ).addGesture(
      () {
        appRouter.push(CategoryDetailsRoute(categoryId: item?.id ?? '', categoryName: item?.name ?? ''));
      },
    );
  }
}
