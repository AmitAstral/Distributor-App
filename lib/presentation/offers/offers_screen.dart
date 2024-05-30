import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class OffersScreen extends StatefulWidget {
  static const String routeName = 'OffersScreen';

  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        BottomBarNavigationProvider().selectHomePage();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: AppBarWidget(
            toolbarHeight: AppBar().preferredSize.height,
            leading: Container(),
            title: Text(
              AppConst.schemes,
              maxLines: 1,
              style: TextStyles.semiBold16,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: IconButton(
                  onPressed: () {},
                  icon: Assets.icons.filter.svg(color: AppColor.white),
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
                margin: EdgeInsets.only(left: 13.w, right: 13.w, top: 13.h, bottom: index == 9 ? 13.h : 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 130.w,
                      height: 130.w,
                      decoration: ShapeDecoration(
                        image: const DecorationImage(
                          image: NetworkImage("https://via.placeholder.com/152x110"),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.w).copyWith(top: 0, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.w),
                              child: Text(
                                'Bond Tite Toofan Scheme',
                                style: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.bold, fontSize: 12.sp, color: AppColor.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.w),
                              child: Text(
                                'Purchase Minimum Rs.2000 order value in first\npurchase of any MNT product & get one time\nbenefit between Rs.50 to 5000',
                                style: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 10.sp, color: AppColor.black),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5.w),
                              child: Text(
                                'Expire in 7 Days',
                                style: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 10.sp, color: AppColor.red),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
