import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});

  @override
  BaseState createState();
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> with RouteAware {
  final appRouter = AutoRouter.of(appContext);

  //BuildContext? baseContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context);

  @override
  bool get wantKeepAlive => true;

  @override
  void didChangeDependencies() {
    /*AppRouter().routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
    baseContext = context;
    BottomBarNavigationProvider().currentContext = context;*/
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    debugPrint('User returned to FirstScreen');
  }

  @override
  void dispose() {
    AppRouter().routeObserver.unsubscribe(this);
    super.dispose();
  }
}
