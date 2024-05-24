import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/presentation/dashboard/bottombar_navigation/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/home/screen/components/credit_aging_widget.dart';
import 'package:distributor_empower/presentation/home/screen/components/credit_details_widget.dart';
import 'package:distributor_empower/presentation/home/screen/components/focus_product_widget.dart';
import 'package:distributor_empower/presentation/home/screen/components/order_details_widget1.dart';
import 'package:distributor_empower/presentation/home/screen/components/sales_chart_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'homepage';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    BottomBarNavigationProvider().highLightItem(BottomBarNavigationItemName.home);
  }

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5.h),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height + 5.h,
          backgroundColor: AppColor.primaryColor,
          titleSpacing: 10.w,
          leading: GestureDetector(
              onTap: () {},
              child: FittedBox(
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  margin: EdgeInsets.only(left: 10.w),
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/static_images/profile_pic.png"),
                      // image: NetworkImage("https://via.placeholder.com/40x40"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
              )),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                maxLines: 1,
                style: googleFontMontserrat.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 11.sp, color: AppColor.white),
              ),
              Text(
                "Ambika Hardware",
                maxLines: 2,
                style: googleFontMontserrat.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 16.sp, color: AppColor.white),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: IconButton(onPressed: () {}, icon: SvgPicture.asset('assets/icons/menu.svg')),
            )
          ],
          centerTitle: false,
          elevation: 0,
          shapeRadius: 10.r,
          flexibleSpace: null,
        ),
      ),
      body: SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: _onRefresh,
          child: Container(
            // height: 1.sh,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const SalesChartWidget(),
                  const CreditDetailsWidget(),
                  // OrderDetailsWidget(),
                  const OrderDetailsWidget1(),
                  const FocusProductWidget(),
                  CreditAgingWidget(),
                ],
              ),
            ),
          )),
    );
  }
}
