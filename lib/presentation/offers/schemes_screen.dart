import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:distributor_empower/presentation/offers/schemes_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

@RoutePage()
class SchemesScreen extends StatefulWidget {
  const SchemesScreen({super.key});

  @override
  State<SchemesScreen> createState() => _SchemesScreenState();
}

class _SchemesScreenState extends State<SchemesScreen> {
  final _schemesProvider = SchemesProvider();
  final _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _schemesProvider.callGetSchemesList();
    super.initState();
  }

  @override
  void dispose() {
    _schemesProvider.dispose();
    _refreshController.dispose();
    super.dispose();
  }

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
            centerTitle: true,
            elevation: 0,
            flexibleSpace: null,
          ),
        ),
        body: SmartRefresherWidget(
          controller: _refreshController,
          onRefresh: () async {
            await _schemesProvider.callGetSchemesList(isProgress: false);
            _refreshController.refreshCompleted();
          },
          child: ChangeNotifierProvider.value(
            value: _schemesProvider,
            child: Consumer<SchemesProvider>(builder: (context, provider, child) {
              return ProgressWidget(
                inAsyncCall: provider.isLoading.value,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _schemesProvider.schemeListResponse.length,
                    itemBuilder: (context, index) {
                      final item = _schemesProvider.schemeListResponse[index];
                      return Container(
                        width: 1.sw,
                        margin: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(13),
                              ).h,
                              child: CachedNetworkImageWidget(
                                imageUrl: item?.menuImagePath ?? '',
                                height: 100.h,
                                width: 130.w,
                                fit: BoxFit.cover,
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
                                        item?.menuName ?? '',
                                        style: googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.bold, fontSize: 12.sp, color: AppColor.black),
                                      ),
                                    ),
                                    if (item?.shortDescription?.isNotEmpty ?? false)
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.w),
                                        child: Text(
                                          item?.shortDescription ?? '',
                                          style:
                                              googleFontPoppins.copyWith(fontWeight: GoogleFontWeight.medium, fontSize: 10.sp, color: AppColor.black),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ).addGesture(
                        () {
                          if (item?.menuRedairectURLIsPDF == '1') {
                            appRouter.push(PDFViewerRoute(url: item?.menuPDFURL ?? '', title: item?.menuName ?? ''));
                          }
                        },
                      );
                    }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
