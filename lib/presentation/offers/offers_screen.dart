import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/presentation/dashboard/bottombar_navigation/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersScreen extends StatefulWidget {
  static const String routeName = 'OffersScreen';

  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  _OffersScreenState() {
    BottomBarNavigationProvider().highLightItem(BottomBarNavigationItemName.offers);
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
            AppConst.schemes,
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
      body: const Center(),

    );
  }
}
