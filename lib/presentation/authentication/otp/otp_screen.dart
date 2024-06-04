import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/authentication/pin/provider/user_pin_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/pin_put_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

@RoutePage()
class OtpScreen extends StatelessWidget {
  final ValueNotifier<bool> _isDisable = ValueNotifier(true);
  String _otp = '';

  final ValueNotifier<int> _secondsRemaining = ValueNotifier(0);

  final _userPinProvider = UserPinProvider();

  Timer? _timer;

  OTPVerificationType? screenType = OTPVerificationType.login;
  String sentOTP = '';

  OtpScreen({this.screenType, required this.sentOTP, super.key}) {
    if (screenType == OTPVerificationType.forgotPin) _sendOTP(false);
  }

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${AppLocalizations.current.weSentOtpOn} ",
                            style: TextStyles.regular13.copyWith(color: AppColor.textSecondary),
                          ),
                          Text(
                            storage.userDetails.secureNumber,
                            style: TextStyles.semiBold13.copyWith(color: AppColor.primaryColor),
                          )
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.current.enterOTP,
                              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                            ),
                            10.verticalSpace,
                            PinPutWidget(
                              onChange: (String otpStr) {
                                _otp = otpStr;
                                _isDisable.value = _otp.length < 4;
                              },
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      ValueListenableBuilder(
                          valueListenable: _secondsRemaining,
                          child: Center(
                            child: Text(
                              AppLocalizations.current.resendOtp,
                              style: TextStyles.regular12.copyWith(color: AppColor.primaryColor, decoration: TextDecoration.underline),
                            ),
                          ).addGesture(
                            () {
                              _sendOTP(true);
                              startTimer();
                            },
                          ),
                          builder: (context, value, Widget? child) {
                            return value == 0
                                ? child!
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.current.resendOtpIn,
                                        style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                                      ),
                                      Text(
                                        ' $value',
                                        style: TextStyles.bold12.copyWith(color: AppColor.textSecondary),
                                      ),
                                    ],
                                  );
                          }),
                      10.verticalSpace,
                      ValueListenableBuilder(
                          valueListenable: _isDisable,
                          builder: (context, _, __) {
                            return AppButton(
                              onPressed: () async {
                                if (_otp == sentOTP) {
                                  if (screenType == OTPVerificationType.forgotPin) {
                                    appRouter.replace(SetPinRoute());
                                    return;
                                  }
                                  _userPinProvider.generateJWTToken();
                                  if (storage.userDetails.isPinSet ?? false) {
                                    storage.isLogin = true;
                                    appRouter.pushAndPopUntil(
                                      VerifyPinRoute(),
                                      predicate: (route) => false,
                                    );
                                  } else {
                                    appRouter.replace(SetPinRoute());
                                  }
                                } else {
                                  errorToast(AppLocalizations.current.theEnteredOtpIsInvalid);
                                }
                              },
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

  Future<void> _sendOTP(bool isShowMessage) async {
    sentOTP = await _userPinProvider.sendOTP(isShowMessage: isShowMessage);
  }

  void startTimer() {
    _secondsRemaining.value = 30;
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_secondsRemaining.value == 0) {
          _timer?.cancel();
        } else {
          _secondsRemaining.value = _secondsRemaining.value - 1;
        }
      },
    );
  }
}

enum OTPVerificationType { login, forgotPin }
