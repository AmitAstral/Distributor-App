import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/presentation/home/components/product_view_widget.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

class FocusProductWidget extends StatelessWidget {
  final List<FocusProduct>? focusProductList;
  final String title;

  const FocusProductWidget(this.focusProductList, {required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    if (focusProductList?.isEmpty ?? true) return const SizedBox.shrink();
    return Container(
      height: 180.h,
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
                  title,
                  style: TextStyles.semiBold14.copyWith(color: AppColor.textSecondary),
                ),
                Text(
                  AppLocalizations.current.seeAll,
                  textAlign: TextAlign.center,
                  style: TextStyles.semiBold11.copyWith(color: AppColor.primaryColor),
                ).addGesture(
                  () => appRouter.push(FocusProductRoute(title: title)),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: focusProductList?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = focusProductList?[index];
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
