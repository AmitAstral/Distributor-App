import 'package:distributor_empower/model/base/base_model.dart';

class ReportMenuResponse extends BaseModel {
  ReportMenuResponse({
    this.id,
    this.name,
    this.shortName,
    this.redirectUrl,
    this.iconsUrl,
  });

  String? id;
  String? name;
  String? shortName;
  String? redirectUrl;
  String? iconsUrl;

  @override
  ReportMenuResponse fromJson(Map<String, dynamic> json) {
    return ReportMenuResponse(
      id: json['id'],
      name: json['Name'],
      shortName: json['ShortName'],
      redirectUrl: json['RedirectUrl'],
      iconsUrl: json['IconsUrl'],
    );
  }
}
