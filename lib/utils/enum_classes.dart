import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';

enum DropdownTypeEnum { MyOrderList, Schemes }

enum Environment {
  debug('http://sfauat.astralpipes.com:8087/api/'),
  staging('http://sfauat.astralpipes.com:8087/api/'),
  live('http://sfauat.astralpipes.com:8087/api/');

  final String value;

  const Environment(this.value);
}

enum DashboardViewType {
  sales,
  creditDetails,
  orderDetails,
  focusProduct,
  creditAging,
  filter,
  none;
}

enum SetPinType {
  newPin,
  resetPin,
  verifyPin;
}

enum EntityType { schemes, priceList }

enum ReportType {
  statementOfAccount('1', StatementOfAccountRoute()),
  ageing('2', AgeingRoute()),
  pendingOrder('3', PendingOrderRoute()),
  salesReport('4', SalesReportRoute()),
  none('', null);

  final String id;
  final PageRouteInfo? route;

  const ReportType(this.id, this.route);

  static ReportType getReportType(String? id) => ReportType.values.firstWhere(
        (element) => element.id == (id ?? ''),
      );
}

enum BottomNavigationEnum {
  home(route: HomeRoute(), icon: Icons.home, label: 'Home'),
  cart(route: QuickOrderRoute(), icon: Icons.shopping_bag_sharp, label: 'Quick Order'),
  offers(route: SchemesRoute(), icon: Icons.local_offer_rounded, label: 'Offers'),
  profile(route: ProfileRoute(), icon: Icons.person, label: 'Settings');

  final PageRouteInfo route;
  final IconData icon;
  final String label;

  const BottomNavigationEnum({
    required this.route,
    required this.icon,
    required this.label,
  });
}

enum OTPVerificationType { login, forgotPin }
