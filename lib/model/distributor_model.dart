import 'package:distributor_empower/model/base/base_model.dart';

class DistributorModel extends BaseModel {
  DistributorModel({
    this.value,
    this.text,
  });

  @override
  DistributorModel fromJson(json) {
    return DistributorModel(
      value: json['Value'],
      text: json['Text'],
    );
  }

  String? value;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Value'] = value;
    map['Text'] = text;
    return map;
  }
}
