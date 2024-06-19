import 'package:distributor_empower/model/base/base_model.dart';
import 'package:distributor_empower/utils/enum_classes.dart';

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
