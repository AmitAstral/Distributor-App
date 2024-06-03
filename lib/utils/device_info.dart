import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/uuid.dart';

class DeviceInfo {
  final _deviceInfo = DeviceInfoPlugin();

  Future<String> get getUuid async {
    var uuid = const Uuid();
    String deviceId = uuid.v4();
    return deviceId;
  }

  Future<String> get getOsVersion async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.version.release;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.systemVersion;
    }
    return '';
  }

  Future<String> get getDeviceName async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.device;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.name;
    }
    return '';
  }

  Future<String> get getDeviceModelName async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
      return iosInfo.model;
    }
    return '';
  }

  String get getDeviceType {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    }
    return '';
  }
}

Future<String> getCurrentAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  storage.currentAppVersion = packageInfo.version;
  return packageInfo.version;
}

UserInfo get getUserInfo {
  final userDetails = storage.userDetails;
  return UserInfo(
    pageName: appRouter.current.name,
    mobile: userDetails.distributorMobileNumber,
    sapCode: userDetails.distributorSapCode,
    distributorUserID: userDetails.distributorUserID,
    currentAppVersion: storage.currentAppVersion,
    token: userDetails.token,
  );
}
