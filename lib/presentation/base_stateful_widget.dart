import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:visibility_detector/visibility_detector.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});

  @override
  BaseState createState();
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  var refreshController = RefreshController(initialRefresh: false);

  var visibilityKey = Key('visibilityKey-${DateTime.now().toIso8601String()}');
  var popKey = Key('popKey-${DateTime.now().toIso8601String()}');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: visibilityKey,
      onVisibilityChanged: (info) {
        if ((info.visibleFraction * 100).toInt() == 100 && BottomBarNavigationProvider().currentContext != context) {
          BottomBarNavigationProvider().currentContext = context;
          onVisibleInvoke();
        }
      },
      child: PopScope(key: popKey, canPop: true, onPopInvoked: onBackPress, child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context);

  void onVisibleInvoke() {}

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  void onBackPress(bool didPop) {}
}
