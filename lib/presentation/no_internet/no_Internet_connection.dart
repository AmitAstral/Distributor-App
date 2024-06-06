import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh / 3,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Icon(
              Icons.wifi_off,
              color: AppColor.red,
              size: 100,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.current.noInternetConnection,
                style: TextStyles.bold20.copyWith(color: Colors.red),
              )),
          SizedBox(
            height: 20.h,
          ),
          Container(
              //    margin: EdgeInsets.only(left: 2.h, right: 2.h),
              alignment: Alignment.center,
              child: Text(
                AppLocalizations.current.somethingWentWrongPleaseConnectWithInternetToUseApplication,
                style: TextStyles.semiBold18.copyWith(color: AppColor.red),
              )),
        ],
      ),
    );
  }
}
