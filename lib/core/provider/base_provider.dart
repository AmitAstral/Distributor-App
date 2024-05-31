import 'dart:convert';

import 'package:distributor_empower/utils/toast.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  late Function(String errorRes) onApiError;
  bool isShowErrorMessage = true;

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
