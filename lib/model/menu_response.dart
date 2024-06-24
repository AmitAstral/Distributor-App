import 'package:distributor_empower/model/base/base_model.dart';

class MenuResponse extends BaseModel {
  MenuResponse({
    this.id,
    this.menuName,
    this.redirectURL,
    this.uRLType,
    this.menuIconURL,
    this.isMenuHorizontal,
    this.entityType,
  });

  @override
  MenuResponse fromJson(json) {
    return MenuResponse(
      id: json['Id'],
      menuName: json['MenuName'],
      redirectURL: json['Redirect_URL'],
      uRLType: json['URL_Type'],
      menuIconURL: json['Menu_Icon_URL'],
      isMenuHorizontal: json['IsMenuHorizontal'],
      entityType: json['EntityType'],
    );
  }

  String? id;
  String? menuName;
  String? redirectURL;
  String? uRLType;
  String? menuIconURL;
  String? isMenuHorizontal;
  String? entityType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['MenuName'] = menuName;
    map['Redirect_URL'] = redirectURL;
    map['URL_Type'] = uRLType;
    map['Menu_Icon_URL'] = menuIconURL;
    map['IsMenuHorizontal'] = isMenuHorizontal;
    map['EntityType'] = entityType;
    return map;
  }
}
