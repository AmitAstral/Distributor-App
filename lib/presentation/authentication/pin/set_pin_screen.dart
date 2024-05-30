import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/pin_put_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SetPinScreen extends StatelessWidget {
  final ValueNotifier<bool> _isDisable = ValueNotifier(true);
  String _pin = '';
  String _confirmPin = '';

  SetPinScreen({super.key});

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
                      const Spacer(),
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
                                _isDisable.value = !(_pin.length == 4 && _confirmPin.length == 4);
                              },
                              isObscureText: true,
                            ),
                            15.verticalSpace,
                            Text(
                              AppLocalizations.current.confirmPin,
                              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                            ),
                            5.verticalSpace,
                            PinPutWidget(
                              onChange: (String otp) {
                                _confirmPin = otp;
                                _isDisable.value = !(_pin.length == 4 && _confirmPin.length == 4);
                              },
                              isObscureText: true,
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
                              text: AppLocalizations.current.login,
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
    if (!_isDisable.value && _pin == _confirmPin) {
      storage.isLogin = true;
      appRouter.pushAndPopUntil(
        const DashboardRoute(),
        predicate: (route) => false,
      );
    } else {
      errorToast(AppLocalizations.current.validatePinAndConfirmPin);
    }
  }
}
