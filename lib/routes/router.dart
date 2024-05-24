import 'package:distributor_empower/layout/logged_app_body.dart';
import 'package:distributor_empower/presentation/home/screen/home_screen.dart';
import 'package:distributor_empower/presentation/offers/offers_screen.dart';
import 'package:distributor_empower/presentation/quick_order/quick_order_screen.dart';
import 'package:distributor_empower/routes/router_guard.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

part 'router.gr.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Router',
  routes: <AutoRoute>[
    AutoRoute(
      page: LoggedAppBody,
      name: 'LoggedAppBodyRouter',
      path: LoggedAppBody.routeName,
      guards: [RouteGuard],
      initial: true,
      children: [
        AutoRoute(
          page: HomeScreen,
          initial: true,
          path: HomeScreen.routeName,
          guards: [RouteGuard],
        ),
        AutoRoute(
          page: OffersScreen,
          path: OffersScreen.routeName,
          guards: [RouteGuard],
        ),
        AutoRoute(
          page: QuickOrderScreen,
          path: QuickOrderScreen.routeName,
          guards: [RouteGuard],
        ),
        AutoRoute(
          page: QuickOrderScreen,
          path: QuickOrderScreen.routeName,
          guards: [RouteGuard],
        ),

      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.routeGuard});
}
