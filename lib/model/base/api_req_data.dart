import 'package:distributor_empower/utils/device_info.dart';

class ApiReqData {
  int? page;
  String? email;
  String? password;
  String? sapCode;
  String? pin;
  String? confirmPin;
  int? pinType;
  UserDeviceToken? userDeviceToken;
  UserInfo? userInfo;
  String? distributorUserID;
  String? mobile;
  String? pageName;
  bool? withUserInfo;
  String? fcmID;

  ApiReqData({
    this.page,
    this.email,
    this.password,
    this.sapCode,
    this.pin,
    this.confirmPin,
    this.pinType,
    this.userInfo,
    this.userDeviceToken,
    this.distributorUserID,
    this.mobile,
    this.pageName,
    this.withUserInfo,
    this.fcmID,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['page'] = page;
    json['email'] = email;
    json['password'] = password;
    json['Pin'] = pin;
    json['ConfirmPin'] = confirmPin;
    json['SetPinType'] = pinType;
    json['FCM_ID'] = fcmID;

    if (userDeviceToken != null) {
      json['userDeviceToken'] = userDeviceToken!.toJson();
    }

    if (userInfo != null) {
      json['UserInfo'] = userInfo!.toJson();
    } else if (withUserInfo ?? false) {
      json['UserInfo'] = getUserInfo;
    }

    json['DistributorUserID'] = distributorUserID;
    json['Mobile'] = mobile;
    json['PageName'] = pageName;

    json['Sapcode'] = sapCode;
    json.removeWhere((key, value) => value == null);
    return json;
  }
}

class UserDeviceToken {
  String? uuid;
  String? osVersion;
  String? deviceType;
  String? deviceName;
  String? modelName;
  String? fcmID;

  UserDeviceToken({this.uuid, this.osVersion, this.deviceType, this.deviceName, this.modelName, this.fcmID});

  UserDeviceToken.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    osVersion = json['os_version'];
    deviceType = json['device_type'];
    deviceName = json['device_name'];
    modelName = json['model_name'];
    fcmID = json['FCM_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['os_version'] = osVersion;
    data['device_type'] = deviceType;
    data['device_name'] = deviceName;
    data['model_name'] = modelName;
    data['FCM_ID'] = fcmID;

    return data;
  }
}

class UserInfo {
  String? distributorUserID;
  String? sapCode;
  String? mobile;
  String? pageName;
  String? currentAppVersion;
  String? token;

  UserInfo({this.distributorUserID, this.sapCode, this.mobile, this.pageName, this.currentAppVersion, this.token});

  UserInfo.fromJson(Map<String, dynamic> json) {
    distributorUserID = json['DistributorUserID'];
    sapCode = json['Sapcode'];
    mobile = json['Mobile'];
    pageName = json['PageName'];
    currentAppVersion = json['CurrentAppVersion'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DistributorUserID'] = distributorUserID;
    data['Sapcode'] = sapCode;
    data['Mobile'] = mobile;
    data['PageName'] = pageName;
    data['CurrentAppVersion'] = currentAppVersion;
    data['Token'] = token;
    return data;
  }
}
