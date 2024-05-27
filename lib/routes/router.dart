import 'package:distributor_empower/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/presentation/home/screen/home_screen.dart';
import 'package:distributor_empower/presentation/offers/offers_screen.dart';
import 'package:distributor_empower/presentation/quick_order/quick_order_screen.dart';
import 'package:distributor_empower/presentation/splash/splash_screen.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({required super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: DashboardRoute.page,
          path: "/${DashboardRoute.name}",
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: HomeRoute.name,
              initial: true,
            ),
            AutoRoute(page: OffersRoute.page, path: OffersRoute.name),
            AutoRoute(page: QuickOrderRoute.page, path: QuickOrderRoute.name),
            AutoRoute(page: QuickOrderRoute.page, path: QuickOrderRoute.name),
          ],
        ),
      ];
}
