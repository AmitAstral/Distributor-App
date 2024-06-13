import 'package:distributor_empower/model/base/base_model.dart';

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
  statementOfAccount,
  ageing,
  pendingOrder,
  salesReport,
  none;

  static ReportType getReportType(String? id) {
    switch (id) {
      case '1':
        return ReportType.statementOfAccount;
      case '2':
        return ReportType.ageing;
      case '3':
        return ReportType.pendingOrder;
      case '4':
        return ReportType.salesReport;
      default:
        return ReportType.none;
    }
  }
}
