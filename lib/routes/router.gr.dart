// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CommonWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CommonWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommonWebViewScreen(
          key: args.key,
          url: args.url,
          title: args.title,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    MaintenanceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MaintenanceScreen(),
      );
    },
    NoInternetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NoInternetScreen(),
      );
    },
    OffersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OffersScreen(),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderDetailsScreen(),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrderHistoryScreen(),
      );
    },
    OtpVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OtpVerificationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OtpVerificationScreen(
          screenType: args.screenType,
          sentOTP: args.sentOTP,
          key: args.key,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    QuickOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const QuickOrderScreen(),
      );
    },
    ReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReportScreen(),
      );
    },
    SetPinRoute.name: (routeData) {
      final args = routeData.argsAs<SetPinRouteArgs>(
          orElse: () => const SetPinRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SetPinScreen(key: args.key),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(key: args.key),
      );
    },
    VerifyPinRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyPinRouteArgs>(
          orElse: () => const VerifyPinRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VerifyPinScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [CommonWebViewScreen]
class CommonWebViewRoute extends PageRouteInfo<CommonWebViewRouteArgs> {
  CommonWebViewRoute({
    Key? key,
    required String url,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          CommonWebViewRoute.name,
          args: CommonWebViewRouteArgs(
            key: key,
            url: url,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonWebViewRoute';

  static const PageInfo<CommonWebViewRouteArgs> page =
      PageInfo<CommonWebViewRouteArgs>(name);
}

class CommonWebViewRouteArgs {
  const CommonWebViewRouteArgs({
    this.key,
    required this.url,
    this.title,
  });

  final Key? key;

  final String url;

  final String? title;

  @override
  String toString() {
    return 'CommonWebViewRouteArgs{key: $key, url: $url, title: $title}';
  }
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [MaintenanceScreen]
class MaintenanceRoute extends PageRouteInfo<void> {
  const MaintenanceRoute({List<PageRouteInfo>? children})
      : super(
          MaintenanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MaintenanceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoInternetScreen]
class NoInternetRoute extends PageRouteInfo<void> {
  const NoInternetRoute({List<PageRouteInfo>? children})
      : super(
          NoInternetRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OffersScreen]
class OffersRoute extends PageRouteInfo<void> {
  const OffersRoute({List<PageRouteInfo>? children})
      : super(
          OffersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OffersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailsScreen]
class OrderDetailsRoute extends PageRouteInfo<void> {
  const OrderDetailsRoute({List<PageRouteInfo>? children})
      : super(
          OrderDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderHistoryScreen]
class OrderHistoryRoute extends PageRouteInfo<void> {
  const OrderHistoryRoute({List<PageRouteInfo>? children})
      : super(
          OrderHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OtpVerificationScreen]
class OtpVerificationRoute extends PageRouteInfo<OtpVerificationRouteArgs> {
  OtpVerificationRoute({
    OTPVerificationType? screenType,
    required String sentOTP,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            screenType: screenType,
            sentOTP: sentOTP,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const PageInfo<OtpVerificationRouteArgs> page =
      PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    this.screenType,
    required this.sentOTP,
    this.key,
  });

  final OTPVerificationType? screenType;

  final String sentOTP;

  final Key? key;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{screenType: $screenType, sentOTP: $sentOTP, key: $key}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QuickOrderScreen]
class QuickOrderRoute extends PageRouteInfo<void> {
  const QuickOrderRoute({List<PageRouteInfo>? children})
      : super(
          QuickOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'QuickOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReportScreen]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute({List<PageRouteInfo>? children})
      : super(
          ReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetPinScreen]
class SetPinRoute extends PageRouteInfo<SetPinRouteArgs> {
  SetPinRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SetPinRoute.name,
          args: SetPinRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SetPinRoute';

  static const PageInfo<SetPinRouteArgs> page = PageInfo<SetPinRouteArgs>(name);
}

class SetPinRouteArgs {
  const SetPinRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SetPinRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<SplashRouteArgs> page = PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key}';
  }
}

/// generated route for
/// [VerifyPinScreen]
class VerifyPinRoute extends PageRouteInfo<VerifyPinRouteArgs> {
  VerifyPinRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerifyPinRoute.name,
          args: VerifyPinRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'VerifyPinRoute';

  static const PageInfo<VerifyPinRouteArgs> page =
      PageInfo<VerifyPinRouteArgs>(name);
}

class VerifyPinRouteArgs {
  const VerifyPinRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VerifyPinRouteArgs{key: $key}';
  }
}
