import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/presentation/authentication/login/login_screen.dart';
import 'package:distributor_empower/presentation/authentication/otp/otp_verification_screen.dart';
import 'package:distributor_empower/presentation/authentication/pin/set_pin_screen.dart';
import 'package:distributor_empower/presentation/authentication/pin/verify_pin_screen.dart';
import 'package:distributor_empower/presentation/dashboard/screens/dashboard_screen.dart';
import 'package:distributor_empower/presentation/home/screen/home_screen.dart';
import 'package:distributor_empower/presentation/maintainance/maintenance_screen.dart';
import 'package:distributor_empower/presentation/maintainance/no_internet_screen.dart';
import 'package:distributor_empower/presentation/offers/offers_screen.dart';
import 'package:distributor_empower/presentation/order_history/order_details_screen.dart';
import 'package:distributor_empower/presentation/order_history/order_history_screen.dart';
import 'package:distributor_empower/presentation/pending_order/pending_order_details_screen.dart';
import 'package:distributor_empower/presentation/pending_order/pending_order_page.dart';
import 'package:distributor_empower/presentation/profile/profile_screen.dart';
import 'package:distributor_empower/presentation/quick_order/quick_order_screen.dart';
import 'package:distributor_empower/presentation/reports/report_screen.dart';
import 'package:distributor_empower/presentation/splash/splash_screen.dart';
import 'package:distributor_empower/presentation/webviews/common_webview.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  static AppRouter? _instance;

  AppRouter._internal() {
    _instance = this;
  }

  factory AppRouter() => _instance ?? AppRouter._internal();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: DashboardRoute.page,
          path: "/${DashboardRoute.name}",
          children: [
            AutoRoute(page: HomeRoute.page, path: HomeRoute.name, initial: true),
            AutoRoute(page: OffersRoute.page, path: OffersRoute.name),
            AutoRoute(page: QuickOrderRoute.page, path: QuickOrderRoute.name),
            AutoRoute(page: ProfileRoute.page, path: ProfileRoute.name),
            AutoRoute(page: OrderDetailsRoute.page, path: OrderDetailsRoute.name),
            AutoRoute(page: OrderHistoryRoute.page, path: OrderHistoryRoute.name),
            AutoRoute(page: CommonWebViewRoute.page, path: CommonWebViewRoute.name),
            AutoRoute(page: ReportRoute.page, path: ReportRoute.name),
            AutoRoute(page: PendingOrderRoute.page, path: PendingOrderRoute.name),
            AutoRoute(page: PendingOrderDetailsRoute.page, path: PendingOrderDetailsRoute.name),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: OtpVerificationRoute.page),
        AutoRoute(page: SetPinRoute.page),
        AutoRoute(page: VerifyPinRoute.page),
        AutoRoute(page: MaintenanceRoute.page),
        AutoRoute(page: NoInternetRoute.page),
      ];

  void pushAndRemoveAll(PageRouteInfo route) {
    pushAndPopUntil(
      route,
      predicate: (route) => false,
    );
  }
}
