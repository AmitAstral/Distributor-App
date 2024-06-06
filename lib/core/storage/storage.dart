import 'dart:convert';

import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/core/storage/storage_constants.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/model/user_response.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StorageService {
  final _box = Hive.box(box);

  bool hasData(String key) => _box.containsKey(key);

  void _put(String key, value) => _box.put(key, value);

  dynamic _get(String key, {defaultValue}) => _box.get(key, defaultValue: defaultValue) ?? '';

  String get authToken => _get(authTokenKey);

  set authToken(String token) {
    _put(authTokenKey, token);
    apiService.setAuthToken(token);
  }

  Locale get appLocale => Locale(_get(appLocaleKey) ?? 'en');

  set appLocale(Locale locale) => _put(appLocaleKey, locale.languageCode);

  UserResponse get userDetails => UserResponse().fromJson(json.decode(_get(userInfoKey)));

  set userDetails(UserResponse? loginModel) => _put(userInfoKey, json.encode(loginModel?.toJson()));

  String get fcmToken => _get(fcmTokenKey, defaultValue: '');

  set fcmToken(String fcmToken) => _put(fcmTokenKey, fcmToken);

  String get currentAppVersion => _get(currentAppVersionKey, defaultValue: '');

  set currentAppVersion(String version) => _put(currentAppVersionKey, version);

  bool get isLogin => _get(isLoginKey, defaultValue: false);

  set isLogin(bool isLogin) => _put(isLoginKey, isLogin);

  Future<void> clear() async => await _box.clear();

  Future<void> remove(String key) async => await _box.delete(key);

  void logout() {
    apiRep.logoutUser(req: ApiReqData(withUserInfo: true, fcmID: storage.fcmToken));
    isLogin = false;
    authToken = '';
    userDetails = null;
    appRouter.pushAndPopUntil(
      LoginRoute(),
      predicate: (route) => false,
    );
  }
}
