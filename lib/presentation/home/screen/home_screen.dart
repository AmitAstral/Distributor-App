import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/home/components/credit_aging_widget.dart';
import 'package:distributor_empower/presentation/home/components/credit_details_widget.dart';
import 'package:distributor_empower/presentation/home/components/focus_product_widget.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget1.dart';
import 'package:distributor_empower/presentation/home/components/sales_chart_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

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
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: Assets.staticImages.profile.provider(),
                      fit: BoxFit.fill,
                    ),
                    shape: const OvalBorder(),
                  ),
                ),
              )),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                maxLines: 1,
                style: TextStyles.semiBold11,
              ),
              Text(
                "Ambika Hardware",
                maxLines: 2,
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: IconButton(
                  onPressed: () {
                    debugPrint('HERE WE ARE AGAIn');
                    BottomBarNavigationProvider().dashboardKey.currentState?.openDrawer();
                  },
                  icon: Assets.icons.menu.svg()),
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
          )),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    _refreshController.refreshCompleted();
  }
}
