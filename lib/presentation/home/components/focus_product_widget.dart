import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FocusProductWidget extends StatelessWidget {
  const FocusProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: 1.sw,
      margin: EdgeInsets.only(bottom: 6.h),
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
                  'Focus Products',
                  style: googleFontPoppins.copyWith(
                    fontWeight: GoogleFontWeight.semiBold,
                    fontSize: 14.sp,
                    color: const Color(0xFF333333),
                  ),
                ),
                Text(
                  AppLocalizations.current.seeAll,
                  textAlign: TextAlign.center,
                  style: googleFontPoppins.copyWith(
                    fontWeight: GoogleFontWeight.medium,
                    fontSize: 11.sp,
                    color: const Color(0xFF1377E7),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 100,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 140.w,
                    margin: EdgeInsets.only(left: 10.w, right: index == 5 ? 10.w : 0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 0.50, color: Color(0xFF333333)),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16.h, bottom: 8.h),
                          width: 112.w,
                          height: 56.75.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://via.placeholder.com/112x57"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.70,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              'BondTite Quick',
                              style: googleFontPoppins.copyWith(
                                fontWeight: GoogleFontWeight.semiBold,
                                fontSize: 11.sp,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '₹ 5',
                                  style: googleFontPoppins.copyWith(
                                    fontWeight: GoogleFontWeight.semiBold,
                                    fontSize: 10.5.sp,
                                    color: const Color(0xFF002972),
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: googleFontPoppins.copyWith(
                                    fontWeight: GoogleFontWeight.semiBold,
                                    fontSize: 10.5.sp,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                                TextSpan(
                                  text: 'per piece',
                                  style: googleFontPoppins.copyWith(
                                    fontWeight: GoogleFontWeight.regular,
                                    fontSize: 8.sp,
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 95.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF0A04B1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '-',
                                style: googleFontPoppins.copyWith(
                                  fontWeight: GoogleFontWeight.medium,
                                  fontSize: 12.sp,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: 18.w),
                              Text(
                                'Add',
                                style: googleFontPoppins.copyWith(
                                  fontWeight: GoogleFontWeight.medium,
                                  fontSize: 10.sp,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: 18.w),
                              Text(
                                '+',
                                style: googleFontPoppins.copyWith(
                                  fontWeight: GoogleFontWeight.medium,
                                  fontSize: 12.sp,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
