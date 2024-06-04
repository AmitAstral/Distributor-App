import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/api/custom_log_interceptor.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/providers/common_provider.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _moveToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1.sw,
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
              Hero(tag: "SplashLogo", transitionOnUserGestures: true, child: Center(child: Assets.images.splashLogo.image(height: 80.h))),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    final isConnected = await checkInternetConnectivity();

    if (isConnected) {
      final commonProvider = CommonProvider();

      final result = await commonProvider.checkServerStatus();

      if (result == true) {
        appRouter.replace(const MaintenanceRoute());
        return;
      }

      if (storage.isLogin) {
        await commonProvider.getAllSetting();
        appRouter.replace(VerifyPinRoute());
      } else {
        appRouter.replace(LoginRoute());
      }
    } else {
      appRouter.replace(const NoInternetRoute());
    }
  }
}
