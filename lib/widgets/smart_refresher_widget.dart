import 'package:distributor_empower/constants/all_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherWidget extends StatefulWidget {
  final Widget? child;
  final Function() onRefresh;
  final Function()? loadMoreData;
  final RefreshController? controller;

  const SmartRefresherWidget({
    super.key,
    required this.child,
    required this.onRefresh,
    required this.controller,
    this.loadMoreData,
  });

  @override
  State<SmartRefresherWidget> createState() => _SmartRefresherWidgetState();
}

class _SmartRefresherWidgetState extends State<SmartRefresherWidget> {
  final scrollController = ScrollController();

  @override
  void initState() {
    if (widget.loadMoreData != null) {
      scrollController.addListener(
        () {
          if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
            widget.loadMoreData!();
          }
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: widget.controller!,
        onRefresh: widget.onRefresh,
        primary: false,
        scrollController: scrollController,
        enablePullDown: true,
        header: const WaterDropHeader(
          waterDropColor: AppColor.primaryColor,
          complete: SizedBox(),
          refresh: CupertinoActivityIndicator(color: AppColor.primaryColor),
          completeDuration: Duration(seconds: 0),
        ),
        child: widget.child);
  }
}
