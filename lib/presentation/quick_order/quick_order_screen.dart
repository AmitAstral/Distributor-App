import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/constants/app_statics_text/app_labels.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget1.dart';
import 'package:distributor_empower/presentation/quick_order/checkout_bottom_sheet.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class QuickOrderScreen extends StatefulWidget {
  const QuickOrderScreen({super.key});

  @override
  State<QuickOrderScreen> createState() => _QuickOrderScreenState();
}

class _QuickOrderScreenState extends State<QuickOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          backgroundColor: AppColor.appBarBackground,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
          leading: Container(),
          title: Text(
            AppConst.quickOrder,
            maxLines: 1,
            style: TextStyles.semiBold16.copyWith(color: AppColor.textSecondary),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: IconButton(
                onPressed: () {},
                icon: Assets.icons.filter.svg(
                  color: AppColor.primaryColor,
                ),
              ),
            )
          ],
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 1.sw,
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 5.h, bottom: 5.h),
              margin: EdgeInsets.only(bottom: index == 9 ? 50.h : 0),
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
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.staticImages.productImage.provider(),
                              ),
                            )),
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
                              style: TextStyles.regular12.copyWith(color: AppColor.leavePendingColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: Text(
                              '${AppConst.rupees}10',
                              style: TextStyles.semiBold11.copyWith(color: AppColor.textSecondary),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 2.w),
                            child: Text(
                              'Min Qty. 20',
                              style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
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
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r), bottomLeft: Radius.circular(20.r))),
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
                                    controller: TextEditingController()..text = "50",
                                    cursorColor: AppColor.black,
                                    decoration: InputDecoration(
                                        counterText: "", hintStyle: TextStyle(fontSize: 12.sp), isDense: true, contentPadding: EdgeInsets.all(5.r)),
                                    keyboardType: TextInputType.phone,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                      padding: EdgeInsets.all(5.w),
                                      decoration: BoxDecoration(
                                          color: AppColor.white,
                                          borderRadius: BorderRadius.only(topRight: Radius.circular(20.r), bottomRight: Radius.circular(20.r))),
                                      child: Icon(
                                        Icons.add,
                                        size: 16.sp,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 5.w),
                            child: Text(
                              '50x₹10',
                              style: TextStyles.regular9.copyWith(color: AppColor.textSecondary),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 0.w),
                          child: Text(
                            '${AppConst.rupees}500',
                            style: TextStyles.semiBold13.copyWith(color: AppColor.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  5.horizontalSpace,
                ],
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          )),
        ),
        onPressed: () {
          CheckoutBottomSheet.checkoutBottomSheetWidget(context, AppConst.choose_quantity, AppConst.add_to_cart);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Assets.icons.cart.svg(),
            ),
            Text(
              AppConst.checkout,
              textAlign: TextAlign.justify,
              style: TextStyles.semiBold13.copyWith(),
            )
          ],
        ),
      ),
    );
  }
}
