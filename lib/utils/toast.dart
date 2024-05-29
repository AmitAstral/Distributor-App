import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

void successToast(String toastMessage) {
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

errorToast(String toastMessage) {
  ScaffoldMessenger.of(appContext).showSnackBar(
    SnackBar(
      content: Text(
        toastMessage,
        style: TextStyles.regular14,
      ),
      backgroundColor: AppColor.red,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.only(bottom: 20 /*1.sh - 0.11.sh*/, right: 20, left: 20),
    ),
  );
}

warningToast(String toastMessage) {
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
