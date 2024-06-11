import 'package:distributor_empower/model/base/base_model.dart';

class MenuResponse extends BaseModel {
  MenuResponse({
    this.id,
    this.menuName,
    this.menuShortName,
    this.redirectUrl,
    this.iconsUrl,
  });

  @override
  MenuResponse fromJson(dynamic json) {
    return MenuResponse(
        id: json['id'],
        menuName: json['menu_name'],
        menuShortName: json['menu_short_name'],
        redirectUrl: json['Redirect_Url'],
        iconsUrl: json['icons_url']);
  }

  String? id;
  String? menuName;
  String? menuShortName;
  String? redirectUrl;
  String? iconsUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['menu_name'] = menuName;
    map['menu_short_name'] = menuShortName;
    map['Redirect_Url'] = redirectUrl;
    map['icons_url'] = iconsUrl;
    return map;
  }
}
