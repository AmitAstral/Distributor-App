import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/core/di/locator.dart';

class ApiReqData {
  int? page;
  String? email;
  String? password;
  String? sapCode;
  String? pin;
  String? confirmPin;
  int? pinType;
  UserDeviceToken? userDeviceToken;
  String? distributorUserID;
  String? mobile;
  String? pageName;
  bool? withUserInfo;
  String? fcmID;
  String? fromDate;
  String? toDate;
  String? pageNumber;
  String? orderNo;
  String? docID;
  String? entityType;
  String? timePeriod;
  String? orderId;
  String? itemId;
  String? action;
  int? menuType;

  ApiReqData({
    this.page,
    this.email,
    this.password,
    this.sapCode,
    this.pin,
    this.confirmPin,
    this.pinType,
    this.userDeviceToken,
    this.distributorUserID,
    this.mobile,
    this.pageName,
    this.withUserInfo,
    this.fcmID,
    this.fromDate,
    this.toDate,
    this.pageNumber,
    this.orderNo,
    this.docID,
    this.entityType,
    this.timePeriod,
    this.orderId,
    this.menuType,
    this.itemId,
    this.action,
  });

  static UserInfo get getUserDetails => getUserInfo;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['page'] = page;
    json['email'] = email;
    json['password'] = password;
    json['Pin'] = pin;
    json['ConfirmPin'] = confirmPin;
    json['SetPinType'] = pinType;
    json['FCM_ID'] = fcmID;
    json['FromDate'] = fromDate;
    json['ToDate'] = toDate;
    json['PageNumber'] = pageNumber;
    json['OrderNo'] = orderNo;
    json['DocID'] = docID;
    json['ItemId'] = itemId;
    json['Action'] = action;

    if (userDeviceToken != null) {
      json['userDeviceToken'] = userDeviceToken!.toJson();
    }

    if (withUserInfo ?? true) {
      json['UserInfo'] = getUserInfo;
    }

    json['DistributorUserID'] = distributorUserID;
    json['Mobile'] = mobile;
    json['PageName'] = pageName;

    json['Sapcode'] = sapCode;
    json['EntityType'] = entityType;
    json['TimePeriod'] = timePeriod;
    json['order_id'] = orderId;
    json['MenuType'] = menuType;
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
  String? sapCode;
  String? currentAppVersion;

  UserDeviceToken({
    this.uuid,
    this.osVersion,
    this.deviceType,
    this.deviceName,
    this.modelName,
    this.fcmID,
    this.sapCode,
    this.currentAppVersion,
  });

  UserDeviceToken.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    osVersion = json['os_version'];
    deviceType = json['device_type'];
    deviceName = json['device_name'];
    modelName = json['model_name'];
    fcmID = json['FCM_ID'];
    sapCode = json['Sapcode'];
    currentAppVersion = json['CurrentAppVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['os_version'] = osVersion;
    data['device_type'] = deviceType;
    data['device_name'] = deviceName;
    data['model_name'] = modelName;
    data['FCM_ID'] = fcmID;
    data['Sapcode'] = sapCode;
    data['CurrentAppVersion'] = currentAppVersion;
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
  String? gstNo;
  String? divisionID;
  bool? withUserInfo;

  UserInfo({
    this.distributorUserID,
    this.sapCode,
    this.mobile,
    this.pageName,
    this.currentAppVersion,
    this.token,
    this.withUserInfo = false,
    this.gstNo,
    this.divisionID,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    distributorUserID = json['DistributorUserID'];
    sapCode = json['Sapcode'];
    mobile = json['Mobile'];
    pageName = json['PageName'];
    currentAppVersion = json['CurrentAppVersion'];
    token = json['Token'];
    divisionID = json['DivisionID'];
    gstNo = json['GSTNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DistributorUserID'] = distributorUserID;
    data['Sapcode'] = sapCode;
    data['Mobile'] = mobile;
    data['PageName'] = pageName;
    data['CurrentAppVersion'] = currentAppVersion;
    data['Token'] = token;
    data['GSTNo'] = gstNo;
    data['DivisionID'] = divisionID;
    if (withUserInfo ?? false) {
      data['UserInfo'] = getUserInfo;
    }
    return data;
  }
}

UserInfo get getUserInfo {
  final userDetails = storage.userDetails;
  return UserInfo(
    pageName: AutoRouter.of(appContext).current.name,
    mobile: userDetails.distributorMobileNumber,
    sapCode: userDetails.distributorSapCode,
    distributorUserID: userDetails.distributorUserID,
    currentAppVersion: storage.currentAppVersion,
    token: userDetails.token,
    gstNo: userDetails.gstNo,
    divisionID: userDetails.divisionID,
  );
}
