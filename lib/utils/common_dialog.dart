import 'dart:io';

import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/api/api_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CommonDialog {
  static void showCommonDialog({
    required String title,
    required String positiveTitle,
    required String negativeTitle,
    required Function onPositivePressed,
    Function? onNegativePressed,
  }) {
    showDialog(
      context: appContext,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: Text(
                  title,
                  style: TextStyles.regular16.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      negativeTitle,
                      style: TextStyles.regular14.copyWith(color: AppColor.primaryColor),
                    ),
                    onPressed: () {
                      appRouter.maybePop();
                      if (onNegativePressed != null) onNegativePressed();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      positiveTitle,
                      style: TextStyles.regular14.copyWith(color: AppColor.primaryColor),
                    ),
                    onPressed: () {
                      appRouter.maybePop();
                      onPositivePressed();
                    },
                  ),
                ],
              )
            : AlertDialog(
                title: Text(
                  title,
                  style: TextStyles.regular16.copyWith(
                    color: AppColor.textSecondary,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      negativeTitle,
                      style: TextStyles.regular14.copyWith(color: AppColor.primaryColor),
                    ),
                    onPressed: () {
                      appRouter.maybePop();
                      if (onNegativePressed != null) onNegativePressed();
                    },
                  ),
                  TextButton(
                    child: Text(
                      positiveTitle,
                      style: TextStyles.regular14.copyWith(color: AppColor.primaryColor),
                    ),
                    onPressed: () {
                      appRouter.maybePop();
                      onPositivePressed();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showUpdateAppDialog() {
    showCommonDialog(
      title: AppLocalizations.current.newUpdateIsAvailable,
      positiveTitle: AppLocalizations.current.updateNow,
      negativeTitle: AppLocalizations.current.cancel,
      onPositivePressed: () async {
        await launchUrlString(await ApiConstants.getAppURL);
        exit(0);
      },
      onNegativePressed: () => exit(0),
    );
  }
}
