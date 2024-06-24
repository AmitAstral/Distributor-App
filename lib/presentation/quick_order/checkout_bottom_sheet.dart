import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CheckoutBottomSheet {
  static void checkoutBottomSheetWidget(
    BuildContext context,
    text1,
    text2,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      useSafeArea: true,
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9,
            maxChildSize: 0.9,
            minChildSize: 0.32,
            builder: (context, scrollController) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
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
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalizations.current.chooseQty,
                                        style: TextStyles.bold15.copyWith(color: AppColor.textSecondary),
                                      ),
                                      TextSpan(
                                        text: '(Total SKU 2)',
                                        style: TextStyles.semiBold12.copyWith(color: AppColor.textSecondary),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                        const Divider(height: 1),
                      ],
                  ),
                ),
                Flexible(
                  child: AnimationLimiter(
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(seconds: 1),
                            child: SlideAnimation(
                              verticalOffset: 40,
                              child: FadeInAnimation(
                                child: Container(
                                  width: 1.sw,
                                  padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
                                  // margin: EdgeInsets.only(bottom: index == 9 ? 50.h : 0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border(
                                      left: const BorderSide(color: Color(0xFF9B9B9B)),
                                      top: const BorderSide(color: Color(0xFF9B9B9B)),
                                      right: const BorderSide(color: Color(0xFF9B9B9B)),
                                      bottom: index == 9 ? const BorderSide(width: 1, color: Color(0xFF9B9B9B)) : BorderSide.none,
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
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage('assets/static_images/product_image.png'),
                                                  // image: NetworkImage("https://via.placeholder.com/120x84"),
                                                  // fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              // (index % 2 == 0) ? Icons.bookmark_border_rounded :
                                              Icons.bookmark_rounded,
                                              size: 20.sp,
                                              color: const Color(0xFFF1A1A2),
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
                                                  'Bondtite Rapid',
                                                  style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 2.w),
                                                child: Text(
                                                  '3gm',
                                                  style: TextStyles.regular12.copyWith(color: AppColor.yellowAccent),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 2.w),
                                                child: Text(
                                                  '${AppLocalizations.current.rupees}10',
                                                  style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(top: 2.w),
                                                child: Text(
                                                  'Min Qty. 20',
                                                  style: TextStyles.regular8.copyWith(color: AppColor.textSecondary),
                                                ),
                                              ),
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
                                                      controller: TextEditingController()..text = '50',
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
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(20.r),
                                                            bottomRight: Radius.circular(20.r),
                                                          ),
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
                                            Padding(
                                              padding: EdgeInsets.only(top: 5.w),
                                              child: Text(
                                                '50x₹10',
                                                style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 0.w),
                                              child: Text(
                                                '500',
                                                style: TextStyles.semiBold12.copyWith(color: AppColor.textSecondary),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      5.horizontalSpace,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(8.w),
                  // height: MediaQuery.of(context).size.height * 0.1,
                  color: const Color(0xFFE8E8E8).withOpacity(0.3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total',
                                style: TextStyles.semiBold13.copyWith(color: AppColor.textSecondary),
                              ),
                              3.verticalSpace,
                              Text(
                                '1x1.7kg | 10x3gm',
                                style: TextStyles.regular11.copyWith(color: AppColor.borderColor),
                              ),
                              Text(
                                '16,055',
                                style: TextStyles.semiBold16.copyWith(color: AppColor.textSecondary),
                              ),
                            ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(AppColor.primaryColor),
                            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Assets.icons.cart.svg(),
                              ),
                              Text(
                                AppLocalizations.of(context).addToCart,
                                textAlign: TextAlign.justify,
                                style: TextStyles.semiBold13,
                              ),
                            ],
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
    );
  }
}
