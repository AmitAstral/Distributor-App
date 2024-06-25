import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/presentation/dashboard/provider/bottombar_navigation_provider.dart';
import 'package:flutter/material.dart';

abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});

  @override
  BaseState createState();
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  late StackRouter appRouter;
  BuildContext? baseContext;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    baseContext = context;
    appRouter = AutoRouter.of(context);
    BottomBarNavigationProvider().currentContext = context;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
