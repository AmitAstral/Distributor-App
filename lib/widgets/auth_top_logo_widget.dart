import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTopLogoWidget extends StatelessWidget {
  const AuthTopLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5.sh,
      color: AppColor.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.current.welcomeToAstral,
            style: TextStyles.semiBold16,
          ),
          SizedBox(height: 10.h),
          Hero(tag: 'SplashLogo', transitionOnUserGestures: true, child: Center(child: Assets.images.splashLogo.image(height: 70.h))),
        ],
      ),
    );
  }
}
