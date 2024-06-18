import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/dashboard_response.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/home/components/credit_aging_widget.dart';
import 'package:distributor_empower/presentation/home/components/credit_details_widget.dart';
import 'package:distributor_empower/presentation/home/components/filter_menu_widget.dart';
import 'package:distributor_empower/presentation/home/components/focus_product_widget.dart';
import 'package:distributor_empower/presentation/home/components/home_shimmer_effect_widget.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget.dart';
import 'package:distributor_empower/presentation/home/components/sales_chart_widget.dart';
import 'package:distributor_empower/presentation/home/provider/home_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
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
    _homeProvider.callGetMenuList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homeProvider,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5.h),
          child: Consumer<HomeProvider>(builder: (context, provider, child) => _buildAppBar()),
        ),
        body: Consumer<HomeProvider>(builder: (context, provider, child) {
          return _homeProvider.isLoading.value ? const HomeShimmerEffectWidget() : _buildHomeGraphs();
        }),
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
          onTap: () {},
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
      child: (_homeProvider.dashboardData?.isEmpty ?? true)
          ? Center(
              child: Text(
                AppLocalizations.current.noDataFound,
                style: TextStyles.semiBold16.copyWith(
                  color: AppColor.textSecondary,
                ),
              ),
            )
          : ListView.builder(
              itemCount: _homeProvider.dashboardData?.length ?? 0,
              itemBuilder: (context, index) {
                return getViewWidget(_homeProvider.dashboardData?[index]);
              },
            ),
    );
  }

  Widget getViewWidget(DashboardResponse? dashboardData) {
    switch (dashboardData?.getViewType) {
      case DashboardViewType.filter:
        return FilterMenuWidget(
          dashboardData?.filter,
          dashboardData?.title ?? '',
          (FilterData filterData) {
            _homeProvider.callGetUserDetails();
            _onRefresh();
          },
        );
      case DashboardViewType.sales:
        return SalesChartWidget(
          dashboardData?.sales,
          title: dashboardData?.title,
        );
      case DashboardViewType.creditDetails:
        return CreditDetailsWidget(
          dashboardData?.creditDetails,
          title: dashboardData?.title,
        );

      case DashboardViewType.orderDetails:
        return OrderDetailsWidget(
          dashboardData?.orderDetail,
          title: dashboardData?.title,
        );

      case DashboardViewType.focusProduct:
        return FocusProductWidget(
          dashboardData?.focusProduct,
          title: dashboardData?.title ?? '',
        );

      case DashboardViewType.creditAging:
        return CreditAgingWidget(
          dashboardData?.creditAging,
          title: dashboardData?.title ?? '',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
