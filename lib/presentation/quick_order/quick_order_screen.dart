import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class QuickOrderScreen extends StatefulWidget {
  const QuickOrderScreen({super.key});

  @override
  State<QuickOrderScreen> createState() => _QuickOrderScreenState();
}

class _QuickOrderScreenState extends State<QuickOrderScreen> {
  _QuickOrderScreenState() {
    BottomBarNavigationProvider().highLightItem(BottomBarNavigationItemName.quickOrder);
  }

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
              style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.semiBold, fontSize: 16.sp, color: AppColor.black),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/filter.svg')),
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
                    left: BorderSide(color: Color(0xFF9B9B9B)),
                    top: BorderSide(color: Color(0xFF9B9B9B)),
                    right: BorderSide(color: Color(0xFF9B9B9B)),
                    bottom: index == 9 ? BorderSide(width: 1, color: Color(0xFF9B9B9B)) : BorderSide.none,
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
                                style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 10.5.sp, color: AppColor.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.w),
                              child: Text(
                                '3gm',
                                style:
                                    googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.light, fontSize: 12.5.sp, color: const Color(0xFFC7912A)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.w),
                              child: Text(
                                '${AppConst.rupees}10',
                                style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 10.5.sp, color: AppColor.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.w),
                              child: Text(
                                'Min Qty. 20',
                                style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: 8.5.sp, color: AppColor.black),
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
                                style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.regular, fontSize: 9.sp, color: AppColor.black),
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 0.w),
                            child: Text(
                              '${AppConst.rupees}500',
                              style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 12.5.sp, color: AppColor.black),
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
            backgroundColor: MaterialStateProperty.all(const Color(0xff1377E7)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            )),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: SvgPicture.asset(
                  'assets/icons/cart.svg',
                ),
              ),
              Text(
                AppConst.checkout,
                textAlign: TextAlign.justify,
                style: googleFontArchivo.copyWith(fontWeight: GoogleFontWeight.semiBold, fontSize: 13.sp, color: AppColor.white),
              )
            ],
          ),
        ));
  }
}
