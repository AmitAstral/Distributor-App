import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/routes/router.dart';

class ReportMenuResponse extends BaseModel {
  ReportMenuResponse({
    this.reportType,
    this.name,
    this.shortName,
    this.redirectUrl,
    this.iconsUrl,
  });

  ReportType? reportType;
  String? name;
  String? shortName;
  String? redirectUrl;
  String? iconsUrl;

  @override
  ReportMenuResponse fromJson(Map<String, dynamic> json) {
    return ReportMenuResponse(
      reportType: ReportType.getReportType(json['id']),
      name: json['Name'],
      shortName: json['ShortName'],
      redirectUrl: json['RedirectUrl'],
      iconsUrl: json['IconsUrl'],
    );
  }
}

enum ReportType {
  statementOfAccount('1', StatementOfAccountRoute()),
  ageing('2', AgeingRoute()),
  pendingOrder('3', PendingOrderRoute()),
  salesReport('4', PendingOrderRoute()),
  none('', null);

  final String id;
  final PageRouteInfo? route;

  const ReportType(this.id, this.route);

  static ReportType getReportType(String? id) => ReportType.values.firstWhere(
        (element) => element.id == (id ?? ''),
      );
}
