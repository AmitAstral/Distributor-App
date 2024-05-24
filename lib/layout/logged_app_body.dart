import 'package:distributor_empower/layout/main_bottom_bar_nav.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoggedAppBody extends StatelessWidget {
  static const String routeName = '/LoggedAppBody';

  const LoggedAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AutoRouter(),
      bottomNavigationBar: MainBottomBarNav(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
