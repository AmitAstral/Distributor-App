import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductViewWidget extends StatelessWidget {
  final FocusProduct? item;
  final double? height;
  final VoidCallback onChangeFav;

  const ProductViewWidget({
    super.key,
    required this.item,
    required this.onChangeFav,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatefulBuilder(builder: (context, state) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(top: 5).w,
            child: Icon(
              Icons.bookmark_rounded,
              size: 20.sp,
              color: (item?.isFavorite ?? false) ? AppColor.leavePendingColor : AppColor.grey,
            ),
          ).addGesture(
            () {
              item?.isFavorite = !(item?.isFavorite ?? false);
              state(() {});
              onChangeFav();
            },
          );
        }),
        const Spacer(),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5).h,
          height: height ?? 70.h,
          child: CachedNetworkImageWidget(
            imageUrl: item?.productImage ?? '',
            fit: BoxFit.contain,
            errorListener: (value) {
              debugPrint('Image load to failed $value');
            },
          ),
        ),
        const Spacer(),
        2.verticalSpace,
        Opacity(
          opacity: 0.70,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              item?.title ?? '',
              style: TextStyles.semiBold10.copyWith(
                color: AppColor.hintTextColor,
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 2,
            ),
          ),
        ),
        2.verticalSpace,
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: item?.rate ?? '',
                  style: TextStyles.semiBold11.copyWith(color: AppColor.primaryColor),
                ),
                TextSpan(
                  text: ' ${AppLocalizations.of(context).perPiece}',
                  style: TextStyles.regular11.copyWith(color: AppColor.hintTextColor),
                ),
              ],
            ),
          ),
        ),
        2.verticalSpace,
        Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          decoration: ShapeDecoration(
            color: AppColor.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).w,
                child: Text(
                  '-',
                  style: TextStyles.semiBold11,
                ),
              ),
              const Spacer(),
              Text(
                'Add',
                style: TextStyles.semiBold11,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10).w,
                child: Text(
                  '+',
                  style: TextStyles.semiBold11,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
