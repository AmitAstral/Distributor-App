import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/custom_app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(preferredSize: Size.zero, child: AppBarWidget()),
      body: Column(
        children: [
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(Assets.lotties.noInternet, height: 250.h, width: 288.w, alignment: Alignment.center),
              Text(
                AppLocalizations.current.noInternetConnection,
                style: TextStyles.semiBold16.copyWith(color: AppColor.primaryColor),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                width: 0.4.sw,
                onPressed: () {
                  appRouter.replace(SplashRoute());
                },
                text: AppLocalizations.current.refresh,
              ),
              AppButton(
                  width: 0.4.sw,
                  onPressed: () {
                    exit(0);
                  },
                  text: AppLocalizations.current.close),
            ],
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
