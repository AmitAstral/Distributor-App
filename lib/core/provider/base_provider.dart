import 'dart:convert';

import 'package:distributor_empower/core/api/api_repositry.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class BaseProvider extends ChangeNotifier {
  late Function(String errorRes) onApiError;
  bool isShowErrorMessage = true;
  bool isButtonLoading = false;
  final apiRep = GetIt.I<ApiRepository>();

  BaseProvider() {
    onApiError = (error) {
      var message = '';
      try {
        message = jsonDecode(jsonEncode(error))['meta']['message'];
      } catch (e) {
        message = error.toString();
      }
      if (isShowErrorMessage) {
        errorToast(message);
      } else {
        isShowErrorMessage = true;
      }
    };
  }
}
