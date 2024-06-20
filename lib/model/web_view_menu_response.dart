import 'package:distributor_empower/model/base/base_model.dart';

class WebViewMenuResponse extends BaseModel {
  WebViewMenuResponse({
    this.name,
    this.menuImagePath,
    this.menuRedairectURL,
    this.menuRedairectURLIsPDF,
  });

  @override
  WebViewMenuResponse fromJson(dynamic json) {
    return WebViewMenuResponse(
      name: json['Name'],
      menuImagePath: json['MenuImagePath'],
      menuRedairectURL: json['MenuRedairectURL'],
      menuRedairectURLIsPDF: json['MenuRedairectURLIsPDF'],
    );
  }

  String? name;
  String? menuImagePath;
  String? menuRedairectURL;
  String? menuRedairectURLIsPDF;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['MenuImagePath'] = menuImagePath;
    map['MenuRedairectURL'] = menuRedairectURL;
    map['MenuRedairectURLIsPDF'] = menuRedairectURLIsPDF;
    return map;
  }
}
