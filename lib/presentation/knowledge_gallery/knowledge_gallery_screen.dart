import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
import 'package:distributor_empower/presentation/knowledge_gallery/knowledge_gallery_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:distributor_empower/widgets/no_data_found_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:distributor_empower/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class KnowledgeGalleryScreen extends BaseStatefulWidget {
  const KnowledgeGalleryScreen({super.key});

  @override
  BaseState<KnowledgeGalleryScreen> createState() => _KnowledgeGalleryScreenState();
}

class _KnowledgeGalleryScreenState extends BaseState<KnowledgeGalleryScreen> {
  final _knowledgeGalleryProvider = KnowledgeGalleryProvider();

  @override
  void initState() {
    _knowledgeGalleryProvider.getKnowledgeGalleryList();
    super.initState();
  }

  @override
  void dispose() {
    _knowledgeGalleryProvider.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarWidget(
          toolbarHeight: AppBar().preferredSize.height,
          title: Text(
            AppLocalizations.of(context).knowledgeGallery,
            maxLines: 1,
            style: TextStyles.semiBold15,
          ),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: null,
        ),
      ),
      body: ChangeNotifierProvider.value(
        value: _knowledgeGalleryProvider,
        child: Consumer<KnowledgeGalleryProvider>(
          builder: (context, value, child) {
            return ProgressWidget(
              inAsyncCall: value.isLoading.value,
              child: SmartRefresherWidget(
                controller: refreshController,
                onRefresh: () async {
                  await _knowledgeGalleryProvider.getKnowledgeGalleryList(loading: false);
                  refreshController.refreshCompleted();
                },
                child: value.knowledgeGalleryList.isEmpty
                    ? const NoDataFoundWidget()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5).w,
                        itemCount: value.knowledgeGalleryList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final item = value.knowledgeGalleryList[index];
                          return GestureDetector(
                            onTap: () {
                              if (item?.urlType == 'images') {
                                appRouter.push(
                                  ViewImageRoute(title: item?.knowledgeName ?? '', productArguments: item?.getImageURL),
                                );
                              } else if (item?.urlType == 'youtube') {
                                appRouter.push(
                                  YoutubePlayerRoute(productArguments: item?.imgUrl ?? ''),
                                );
                              } else if (item?.urlType == 'video') {
                                appRouter.push(
                                  VideoPlayerRoute(productArguments: item?.imgUrl ?? '', title: item?.knowledgeName ?? ''),
                                );
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                              ),
                              margin: const EdgeInsets.only(
                                bottom: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        margin: const EdgeInsets.all(2).h,
                                        height: MediaQuery.of(context).size.height * 0.1,
                                        width: MediaQuery.of(context).size.width,
                                        child: CachedNetworkImageWidget(
                                          imageUrl: item?.getImageURL ?? '',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4, top: 6).w,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item?.knowledgeName ?? '',
                                            style: TextStyles.semiBold12.copyWith(color: AppColor.textSecondary),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2, bottom: 5).w,
                                            child: Text(
                                              item?.shortDescription ?? '',
                                              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary.withOpacity(0.8)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  // ignore: require_trailing_commas
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
