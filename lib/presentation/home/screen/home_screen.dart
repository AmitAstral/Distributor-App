import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/home/components/credit_aging_widget.dart';
import 'package:distributor_empower/presentation/home/components/credit_details_widget.dart';
import 'package:distributor_empower/presentation/home/components/focus_product_widget.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget.dart';
import 'package:distributor_empower/presentation/home/components/sales_chart_widget.dart';
import 'package:distributor_empower/presentation/home/provider/home_provider.dart';
import 'package:distributor_empower/presentation/home/screen/home_shimmer_effect_widget.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _refreshController = RefreshController(initialRefresh: false);
  final _homeProvider = HomeProvider();

  @override
  void initState() {
    _homeProvider.callGetDashboardAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5.h),
        child: _buildAppBar(),
      ),
      body: ChangeNotifierProvider.value(
        value: _homeProvider,
        builder: (context, _) {
          return Consumer<HomeProvider>(builder: (context, provider, child) {
            return _homeProvider.isLoading ? const HomeShimmerEffectWidget() : _buildHomeGraphs();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _homeProvider.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    await _homeProvider.callGetDashboardAPI();
    _refreshController.refreshCompleted();
  }

  Widget _buildAppBar() {
    return AppBarWidget(
      titleSpacing: 10.w,
      leading: GestureDetector(
          onTap: () {
            appRouter.push(const ReportRoute());
          },
          child: FittedBox(
            child: Container(
              width: 40.w,
              height: 40.w,
              margin: EdgeInsets.only(left: 10.w),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(40.w)),
                child: CachedNetworkImageWidget(
                  imageUrl: storage.userDetails.getUserProfile,
                  fit: BoxFit.cover,
                  loaderColor: AppColor.white,
                  errorIconColor: AppColor.white,
                ),
              ),
            ),
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.current.hello,
            maxLines: 1,
            style: TextStyles.semiBold11,
          ),
          Text(
            storage.userDetails.distributorName ?? '',
            maxLines: 2,
            style: TextStyles.semiBold13,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 5.w),
          child: IconButton(
              onPressed: () {
                BottomBarNavigationProvider().dashboardKey.currentState?.openDrawer();
              },
              icon: Assets.icons.menu.svg()),
        )
      ],
      centerTitle: false,
      elevation: 0,
      shapeRadius: 10.r,
      flexibleSpace: null,
    );
  }

  Widget _buildHomeGraphs() {
    return SmartRefresherWidget(
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SalesChartWidget(
                _homeProvider.dashboardData?.sales,
                title: _homeProvider.dashboardData?.salesTitle,
              ),
              CreditDetailsWidget(
                _homeProvider.dashboardData?.creditDetails,
                title: _homeProvider.dashboardData?.creditDetailsTitle,
              ),
              OrderDetailsWidget(
                _homeProvider.dashboardData?.orderDetails,
                title: _homeProvider.dashboardData?.orderDetailsTitle,
              ),
              FocusProductWidget(
                _homeProvider.dashboardData?.focusProduct,
                title: _homeProvider.dashboardData?.focusDetailsTitle ?? '',
              ),
              CreditAgingWidget(
                _homeProvider.dashboardData?.creditAging,
                title: _homeProvider.dashboardData?.creditAgeingTitle ?? '',
              ),
            ],
          ),
        ));
  }
}
