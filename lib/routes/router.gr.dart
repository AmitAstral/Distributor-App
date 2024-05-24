// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.routeGuard,
  }) : super(navigatorKey);

  final RouteGuard routeGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    LoggedAppBodyRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const LoggedAppBody(),
      );
    },
    HomeRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    OffersRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const OffersScreen(),
      );
    },
    QuickOrderRouter.name: (routeData) {
      return CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const QuickOrderScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/LoggedAppBody',
          fullMatch: true,
        ),
        RouteConfig(
          LoggedAppBodyRouter.name,
          path: '/LoggedAppBody',
          guards: [routeGuard],
          children: [
            RouteConfig(
              '#redirect',
              path: '',
              parent: LoggedAppBodyRouter.name,
              redirectTo: 'homepage',
              fullMatch: true,
            ),
            RouteConfig(
              HomeRouter.name,
              path: 'homepage',
              parent: LoggedAppBodyRouter.name,
              guards: [routeGuard],
            ),
            RouteConfig(
              OffersRouter.name,
              path: 'OffersScreen',
              parent: LoggedAppBodyRouter.name,
              guards: [routeGuard],
            ),
            RouteConfig(
              QuickOrderRouter.name,
              path: 'QuickOrderScreen',
              parent: LoggedAppBodyRouter.name,
              guards: [routeGuard],
            ),
            RouteConfig(
              QuickOrderRouter.name,
              path: 'QuickOrderScreen',
              parent: LoggedAppBodyRouter.name,
              guards: [routeGuard],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [LoggedAppBody]
class LoggedAppBodyRouter extends PageRouteInfo<void> {
  const LoggedAppBodyRouter({List<PageRouteInfo>? children})
      : super(
          LoggedAppBodyRouter.name,
          path: '/LoggedAppBody',
          initialChildren: children,
        );

  static const String name = 'LoggedAppBodyRouter';
}

/// generated route for
/// [HomeScreen]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: 'homepage',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [OffersScreen]
class OffersRouter extends PageRouteInfo<void> {
  const OffersRouter()
      : super(
          OffersRouter.name,
          path: 'OffersScreen',
        );

  static const String name = 'OffersRouter';
}

/// generated route for
/// [QuickOrderScreen]
class QuickOrderRouter extends PageRouteInfo<void> {
  const QuickOrderRouter()
      : super(
          QuickOrderRouter.name,
          path: 'QuickOrderScreen',
        );

  static const String name = 'QuickOrderRouter';
}
