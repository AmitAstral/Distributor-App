import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/pin_put_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerifyPinScreen extends StatelessWidget {
  final ValueNotifier<bool> _isDisable = ValueNotifier(true);
  String _pin = '';

  VerifyPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressWidget(
        inAsyncCall: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AuthTopLogoWidget(),
              SizedBox(
                height: 0.5.sh,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '+91 635123412',
                            style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                          ),
                          5.horizontalSpace,
                          Text(
                            AppLocalizations.current.logout,
                            style: TextStyles.semiBold12.copyWith(color: AppColor.primaryColor),
                          ).addGesture(() {
                            CommonDialog.showCommonDialog(
                              title: AppLocalizations.current.messageAreYouSureLogout,
                              positiveTitle: AppLocalizations.current.yes,
                              negativeTitle: AppLocalizations.current.no,
                              onPositivePressed: () {
                                storage.logout();
                              },
                            );
                          }),
                        ],
                      ),
                      20.verticalSpace,
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.current.pin,
                              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                            ),
                            5.verticalSpace,
                            PinPutWidget(
                              onChange: (String otp) {
                                _pin = otp;
                                _isDisable.value = !(_pin.length == 4);
                              },
                              isObscureText: true,
                            ),
                            10.verticalSpace,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                AppLocalizations.current.forgotPin,
                                style: TextStyles.regular12.copyWith(color: AppColor.primaryColor),
                              ),
                            ).addGesture(
                              () {
                                appRouter.push(OtpRoute());
                              },
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      ValueListenableBuilder(
                          valueListenable: _isDisable,
                          builder: (context, _, __) {
                            return AppButton(
                              onPressed: _validateAndContinue,
                              text: AppLocalizations.current.verify,
                              isDisable: _isDisable.value,
                            );
                          }),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validateAndContinue() {
    storage.isLogin = true;
    appRouter.replace(const DashboardRoute());
  }
}
