import 'package:distributor_empower/model/base/base_model.dart';

class DropDownResponse extends BaseModel {
  DropDownResponse({
    this.id,
    this.displayName,
    this.value,
    this.status,
  });

  @override
  DropDownResponse fromJson(json) {
    return DropDownResponse(id: json['Id'], displayName: json['DisplayName'], value: json['value'], status: json['Status']);
  }

  String? id;
  String? displayName;
  String? value;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['DisplayName'] = displayName;
    map['value'] = value;
    map['Status'] = status;
    return map;
  }
}
