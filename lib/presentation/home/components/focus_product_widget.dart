import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/presentation/home/components/product_view_widget.dart';
import 'package:distributor_empower/presentation/home/provider/home_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FocusProductWidget extends StatefulWidget {
  final List<FocusProduct?>? focusProductList;
  final String title;
  final HomeProvider homeProvider;

  const FocusProductWidget(this.focusProductList, {required this.title, required this.homeProvider, super.key});

  @override
  State<FocusProductWidget> createState() => _FocusProductWidgetState();
}

class _FocusProductWidgetState extends State<FocusProductWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.focusProductList?.isEmpty ?? true) return const SizedBox.shrink();
    return Container(
      height: 190.h,
      width: 1.sw,
      margin: const EdgeInsets.only(bottom: 6).h,
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
                Text(
                  AppLocalizations.current.seeAll,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold11.copyWith(color: AppColor.primaryColor),
                ).addGesture(
                  () => appRouter.push(
                    FocusProductRoute(title: widget.title, homeProvider: widget.homeProvider),
                  ),
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
                  final item = widget.focusProductList?[index];
                  return Container(
                    width: 140.w,
                    margin: EdgeInsets.only(left: index == 0 ? 10 : 0, right: 10).w,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.50, color: Color(0xFF333333)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: ProductViewWidget(
                      item: item,
                      height: 35.h,
                      onChangeFav: () {
                        //_productProvider.addRemoveFromFav(item?.id, item?.getRequireAction);
                      },
                    ),
                  );
                  // ignore: require_trailing_commas
                }),
          ),
        ],
      ),
    );
  }
}
