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
    AgeingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AgeingScreen(),
      );
    },
    CategoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryDetailsScreen(
          categoryId: args.categoryId,
          categoryName: args.categoryName,
          key: args.key,
        ),
      );
    },
    CommonWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CommonWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommonWebViewScreen(
          url: args.url,
          key: args.key,
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
    FocusProductRoute.name: (routeData) {
      final args = routeData.argsAs<FocusProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: FocusProductScreen(
          title: args.title,
          homeProvider: args.homeProvider,
          key: args.key,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    KnowledgeGalleryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const KnowledgeGalleryScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
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
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailsScreen(
          orderItem: args.orderItem,
          key: args.key,
        ),
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
          sentOTP: args.sentOTP,
          screenType: args.screenType,
          key: args.key,
        ),
      );
    },
    PDFViewerRoute.name: (routeData) {
      final args = routeData.argsAs<PDFViewerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PDFViewerScreen(
          url: args.url,
          title: args.title,
          key: args.key,
        ),
      );
    },
    PendingOrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<PendingOrderDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PendingOrderDetailsScreen(
          args.orderDetails,
          key: args.key,
        ),
      );
    },
    PendingOrderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PendingOrderScreen(),
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
    SalesReportDetailRoute.name: (routeData) {
      final args = routeData.argsAs<SalesReportDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SalesReportDetailScreen(
          docId: args.docId,
          key: args.key,
        ),
      );
    },
    SalesReportRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SalesReportScreen(),
      );
    },
    SchemesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SchemesScreen(),
      );
    },
    SetPinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SetPinScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(orElse: () => const SplashRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashScreen(key: args.key),
      );
    },
    StatementOfAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StatementOfAccountScreen(),
      );
    },
    VerifyPinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyPinScreen(),
      );
    },
    VideoPlayerRoute.name: (routeData) {
      final args = routeData.argsAs<VideoPlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VideoPlayerScreen(
          productArguments: args.productArguments,
          title: args.title,
          key: args.key,
        ),
      );
    },
    ViewImageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewImageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewImageScreen(
          title: args.title,
          productArguments: args.productArguments,
          key: args.key,
        ),
      );
    },
    YoutubePlayerRoute.name: (routeData) {
      final args = routeData.argsAs<YoutubePlayerRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: YoutubePlayerScreen(
          productArguments: args.productArguments,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [AgeingScreen]
class AgeingRoute extends PageRouteInfo<void> {
  const AgeingRoute({List<PageRouteInfo>? children})
      : super(
          AgeingRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgeingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoryDetailsScreen]
class CategoryDetailsRoute extends PageRouteInfo<CategoryDetailsRouteArgs> {
  CategoryDetailsRoute({
    required String categoryId,
    required String categoryName,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryDetailsRoute.name,
          args: CategoryDetailsRouteArgs(
            categoryId: categoryId,
            categoryName: categoryName,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryDetailsRoute';

  static const PageInfo<CategoryDetailsRouteArgs> page = PageInfo<CategoryDetailsRouteArgs>(name);
}

class CategoryDetailsRouteArgs {
  const CategoryDetailsRouteArgs({
    required this.categoryId,
    required this.categoryName,
    this.key,
  });

  final String categoryId;

  final String categoryName;

  final Key? key;

  @override
  String toString() {
    return 'CategoryDetailsRouteArgs{categoryId: $categoryId, categoryName: $categoryName, key: $key}';
  }
}

/// generated route for
/// [CommonWebViewScreen]
class CommonWebViewRoute extends PageRouteInfo<CommonWebViewRouteArgs> {
  CommonWebViewRoute({
    required String url,
    Key? key,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          CommonWebViewRoute.name,
          args: CommonWebViewRouteArgs(
            url: url,
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonWebViewRoute';

  static const PageInfo<CommonWebViewRouteArgs> page = PageInfo<CommonWebViewRouteArgs>(name);
}

class CommonWebViewRouteArgs {
  const CommonWebViewRouteArgs({
    required this.url,
    this.key,
    this.title,
  });

  final String url;

  final Key? key;

  final String? title;

  @override
  String toString() {
    return 'CommonWebViewRouteArgs{url: $url, key: $key, title: $title}';
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
/// [FocusProductScreen]
class FocusProductRoute extends PageRouteInfo<FocusProductRouteArgs> {
  FocusProductRoute({
    required String? title,
    required HomeProvider homeProvider,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FocusProductRoute.name,
          args: FocusProductRouteArgs(
            title: title,
            homeProvider: homeProvider,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FocusProductRoute';

  static const PageInfo<FocusProductRouteArgs> page = PageInfo<FocusProductRouteArgs>(name);
}

class FocusProductRouteArgs {
  const FocusProductRouteArgs({
    required this.title,
    required this.homeProvider,
    this.key,
  });

  final String? title;

  final HomeProvider homeProvider;

  final Key? key;

  @override
  String toString() {
    return 'FocusProductRouteArgs{title: $title, homeProvider: $homeProvider, key: $key}';
  }
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
/// [KnowledgeGalleryScreen]
class KnowledgeGalleryRoute extends PageRouteInfo<void> {
  const KnowledgeGalleryRoute({List<PageRouteInfo>? children})
      : super(
          KnowledgeGalleryRoute.name,
          initialChildren: children,
        );

  static const String name = 'KnowledgeGalleryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [OrderDetailsScreen]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    required OrderResponse? orderItem,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            orderItem: orderItem,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static const PageInfo<OrderDetailsRouteArgs> page = PageInfo<OrderDetailsRouteArgs>(name);
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    required this.orderItem,
    this.key,
  });

  final OrderResponse? orderItem;

  final Key? key;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{orderItem: $orderItem, key: $key}';
  }
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
    required String sentOTP,
    OTPVerificationType? screenType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OtpVerificationRoute.name,
          args: OtpVerificationRouteArgs(
            sentOTP: sentOTP,
            screenType: screenType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OtpVerificationRoute';

  static const PageInfo<OtpVerificationRouteArgs> page = PageInfo<OtpVerificationRouteArgs>(name);
}

class OtpVerificationRouteArgs {
  const OtpVerificationRouteArgs({
    required this.sentOTP,
    this.screenType,
    this.key,
  });

  final String sentOTP;

  final OTPVerificationType? screenType;

  final Key? key;

  @override
  String toString() {
    return 'OtpVerificationRouteArgs{sentOTP: $sentOTP, screenType: $screenType, key: $key}';
  }
}

/// generated route for
/// [PDFViewerScreen]
class PDFViewerRoute extends PageRouteInfo<PDFViewerRouteArgs> {
  PDFViewerRoute({
    required String url,
    required String title,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PDFViewerRoute.name,
          args: PDFViewerRouteArgs(
            url: url,
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PDFViewerRoute';

  static const PageInfo<PDFViewerRouteArgs> page = PageInfo<PDFViewerRouteArgs>(name);
}

class PDFViewerRouteArgs {
  const PDFViewerRouteArgs({
    required this.url,
    required this.title,
    this.key,
  });

  final String url;

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'PDFViewerRouteArgs{url: $url, title: $title, key: $key}';
  }
}

/// generated route for
/// [PendingOrderDetailsScreen]
class PendingOrderDetailsRoute extends PageRouteInfo<PendingOrderDetailsRouteArgs> {
  PendingOrderDetailsRoute({
    required PendingOrderResponse? orderDetails,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PendingOrderDetailsRoute.name,
          args: PendingOrderDetailsRouteArgs(
            orderDetails: orderDetails,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PendingOrderDetailsRoute';

  static const PageInfo<PendingOrderDetailsRouteArgs> page = PageInfo<PendingOrderDetailsRouteArgs>(name);
}

class PendingOrderDetailsRouteArgs {
  const PendingOrderDetailsRouteArgs({
    required this.orderDetails,
    this.key,
  });

  final PendingOrderResponse? orderDetails;

  final Key? key;

  @override
  String toString() {
    return 'PendingOrderDetailsRouteArgs{orderDetails: $orderDetails, key: $key}';
  }
}

/// generated route for
/// [PendingOrderScreen]
class PendingOrderRoute extends PageRouteInfo<void> {
  const PendingOrderRoute({List<PageRouteInfo>? children})
      : super(
          PendingOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PendingOrderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [SalesReportDetailScreen]
class SalesReportDetailRoute extends PageRouteInfo<SalesReportDetailRouteArgs> {
  SalesReportDetailRoute({
    required String docId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SalesReportDetailRoute.name,
          args: SalesReportDetailRouteArgs(
            docId: docId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SalesReportDetailRoute';

  static const PageInfo<SalesReportDetailRouteArgs> page = PageInfo<SalesReportDetailRouteArgs>(name);
}

class SalesReportDetailRouteArgs {
  const SalesReportDetailRouteArgs({
    required this.docId,
    this.key,
  });

  final String docId;

  final Key? key;

  @override
  String toString() {
    return 'SalesReportDetailRouteArgs{docId: $docId, key: $key}';
  }
}

/// generated route for
/// [SalesReportScreen]
class SalesReportRoute extends PageRouteInfo<void> {
  const SalesReportRoute({List<PageRouteInfo>? children})
      : super(
          SalesReportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SalesReportRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SchemesScreen]
class SchemesRoute extends PageRouteInfo<void> {
  const SchemesRoute({List<PageRouteInfo>? children})
      : super(
          SchemesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SchemesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SetPinScreen]
class SetPinRoute extends PageRouteInfo<void> {
  const SetPinRoute({List<PageRouteInfo>? children})
      : super(
          SetPinRoute.name,
          initialChildren: children,
        );

  static const String name = 'SetPinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [StatementOfAccountScreen]
class StatementOfAccountRoute extends PageRouteInfo<void> {
  const StatementOfAccountRoute({List<PageRouteInfo>? children})
      : super(
          StatementOfAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'StatementOfAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyPinScreen]
class VerifyPinRoute extends PageRouteInfo<void> {
  const VerifyPinRoute({List<PageRouteInfo>? children})
      : super(
          VerifyPinRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VideoPlayerScreen]
class VideoPlayerRoute extends PageRouteInfo<VideoPlayerRouteArgs> {
  VideoPlayerRoute({
    required String productArguments,
    required String title,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VideoPlayerRoute.name,
          args: VideoPlayerRouteArgs(
            productArguments: productArguments,
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoPlayerRoute';

  static const PageInfo<VideoPlayerRouteArgs> page = PageInfo<VideoPlayerRouteArgs>(name);
}

class VideoPlayerRouteArgs {
  const VideoPlayerRouteArgs({
    required this.productArguments,
    required this.title,
    this.key,
  });

  final String productArguments;

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'VideoPlayerRouteArgs{productArguments: $productArguments, title: $title, key: $key}';
  }
}

/// generated route for
/// [ViewImageScreen]
class ViewImageRoute extends PageRouteInfo<ViewImageRouteArgs> {
  ViewImageRoute({
    required String title,
    required String? productArguments,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ViewImageRoute.name,
          args: ViewImageRouteArgs(
            title: title,
            productArguments: productArguments,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewImageRoute';

  static const PageInfo<ViewImageRouteArgs> page = PageInfo<ViewImageRouteArgs>(name);
}

class ViewImageRouteArgs {
  const ViewImageRouteArgs({
    required this.title,
    required this.productArguments,
    this.key,
  });

  final String title;

  final String? productArguments;

  final Key? key;

  @override
  String toString() {
    return 'ViewImageRouteArgs{title: $title, productArguments: $productArguments, key: $key}';
  }
}

/// generated route for
/// [YoutubePlayerScreen]
class YoutubePlayerRoute extends PageRouteInfo<YoutubePlayerRouteArgs> {
  YoutubePlayerRoute({
    required String productArguments,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          YoutubePlayerRoute.name,
          args: YoutubePlayerRouteArgs(
            productArguments: productArguments,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'YoutubePlayerRoute';

  static const PageInfo<YoutubePlayerRouteArgs> page = PageInfo<YoutubePlayerRouteArgs>(name);
}

class YoutubePlayerRouteArgs {
  const YoutubePlayerRouteArgs({
    required this.productArguments,
    this.key,
  });

  final String productArguments;

  final Key? key;

  @override
  String toString() {
    return 'YoutubePlayerRouteArgs{productArguments: $productArguments, key: $key}';
  }
}
