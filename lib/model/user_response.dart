import 'package:distributor_empower/model/base/base_model.dart';
import 'package:hive/hive.dart';

part 'user_response.g.dart';

@HiveType(typeId: 1)
class UserResponse extends BaseModel {
  UserResponse({
    this.distributorUserID,
    this.distributorSapCode,
    this.distributorName,
    this.distributorMobileNumber,
    this.otp,
    this.token,
    this.allowAppVersion,
    this.currentAppVersion,
    this.isActive,
    this.isPinSet,
  });

  @override
  UserResponse fromJson(Map<String, dynamic> json) {
    distributorUserID = json['DistributorUserID'];
    distributorSapCode = json['DistributorSapCode'];
    distributorName = json['DistributorName'];
    distributorMobileNumber = json['DistributorMobileNumber'];
    otp = json['OTP'];
    token = json['Token'];
    allowAppVersion = json['AllowAppVersion'];
    currentAppVersion = json['CurrentAppVersion'];
    isActive = json['IsActive'];
    isPinSet = (json['IsPinSet'] is String) ? json['IsPinSet'] == '1' : json['IsPinSet'];
    return this;
  }

  @HiveField(0)
  String? distributorUserID;
  @HiveField(1)
  String? distributorSapCode;
  @HiveField(2)
  String? distributorName;
  @HiveField(3)
  String? distributorMobileNumber;
  @HiveField(4)
  String? otp;
  @HiveField(5)
  String? token;
  @HiveField(6)
  String? allowAppVersion;
  @HiveField(7)
  String? currentAppVersion;
  @HiveField(8)
  String? isActive;
  @HiveField(9)
  bool? isPinSet = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['DistributorUserID'] = distributorUserID;
    map['DistributorSapCode'] = distributorSapCode;
    map['DistributorName'] = distributorName;
    map['DistributorMobileNumber'] = distributorMobileNumber;
    map['OTP'] = otp;
    map['Token'] = token;
    map['AllowAppVersion'] = allowAppVersion;
    map['CurrentAppVersion'] = currentAppVersion;
    map['IsActive'] = isActive;
    map['IsPinSet'] = isPinSet;
    return map;
  }

  get secureNumber => (distributorMobileNumber ?? '').replaceAllMapped(RegExp(r'.(?=.{4})'), (match) => '*');
}
