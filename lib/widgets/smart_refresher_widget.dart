import 'package:distributor_empower/constants/all_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SmartRefresherWidget extends StatelessWidget {
  final Widget? child;
  final Function() onRefresh;
  final RefreshController? controller;

  const SmartRefresherWidget(
      {super.key,
      required this.child,
      required this.onRefresh,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        controller: controller!,
        onRefresh: onRefresh,
        enablePullDown: true,
        header:  const WaterDropHeader(
          waterDropColor: AppColor.primaryColor,
          complete: SizedBox(),
          refresh: CupertinoActivityIndicator(color: AppColor.primaryColor),
          completeDuration: Duration(seconds: 0),
        ),
        child: child);
  }
}
