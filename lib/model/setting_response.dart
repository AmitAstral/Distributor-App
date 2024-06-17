import 'package:distributor_empower/model/base/base_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'setting_response.g.dart';

@HiveType(typeId: 2)
class SettingResponse extends BaseModel {
  SettingResponse({
    this.currencySymbol,
    this.fYEndDate,
    this.fYStartDate,
  });

  @override
  SettingResponse fromJson(dynamic json) {
    return SettingResponse(currencySymbol: json['CurrencySymbol'], fYEndDate: json['FY_EndDate'], fYStartDate: json['FY_StartDate']);
  }

  @HiveField(0)
  String? currencySymbol;

  @HiveField(1)
  String? fYEndDate;

  @HiveField(2)
  String? fYStartDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CurrencySymbol'] = currencySymbol;
    map['FY_EndDate'] = fYEndDate;
    map['FY_StartDate'] = fYStartDate;
    return map;
  }
}
