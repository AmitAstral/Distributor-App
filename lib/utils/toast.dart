import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void successToast(String toastMessage) {
  Fluttertoast.showToast(
    msg: toastMessage,
    backgroundColor: AppColor.primaryColor,
    fontSize: 16,
    textColor: AppColor.white,
    gravity: ToastGravity.BOTTOM,
  );
}

void errorToast(String toastMessage, {BuildContext? context}) {
  Fluttertoast.showToast(
    msg: toastMessage,
    backgroundColor: AppColor.red,
    fontSize: 16,
    textColor: AppColor.white,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}

void warningToast(String toastMessage) {
  ScaffoldMessenger.of(appContext).showSnackBar(
    SnackBar(
      content: Text(
        toastMessage,
        style: TextStyles.regular14,
      ),
      backgroundColor: AppColor.primaryColor,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.only(bottom: 20 /*1.sh - 0.11.sh*/, right: 20, left: 20),
    ),
  );
}
