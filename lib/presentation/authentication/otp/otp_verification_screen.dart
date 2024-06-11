import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/authentication/otp/provider/otp_verification_provider.dart';
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

import 'package:provider/provider.dart';

@RoutePage()
class OtpVerificationScreen extends StatelessWidget {
  String _otp = '';

  final ValueNotifier<int> _secondsRemaining = ValueNotifier(0);

  final _otpVerificationProvider = OTPVerificationProvider();

  Timer? _timer;

  OTPVerificationType? screenType = OTPVerificationType.login;
  String sentOTP = '';

  OtpVerificationScreen({this.screenType, required this.sentOTP, super.key}) {
    if (screenType == OTPVerificationType.forgotPin) {
      _sendOTP(false);
    }
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
                      Text(
                        storage.userDetails.otpSentMessage ?? '',
                        style: TextStyles.regular13.copyWith(color: AppColor.textSecondary),
                      ),
                      const Spacer(),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.current.astralCode,
                              style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                            ),
                            10.verticalSpace,
                            PinPutWidget(
                              onChange: (String otpStr) {
                                _otp = otpStr;
                                _otpVerificationProvider.isDisable.value = _otp.length < 4;
                                if (_otp.length == 4) _onPressVerifyOTP();
                              },
                            ),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      ValueListenableBuilder(
                          valueListenable: _secondsRemaining,
                          builder: (context, value, Widget? child) {
                            return ChangeNotifierProvider.value(
                              value: _otpVerificationProvider,
                              child: Consumer<OTPVerificationProvider>(builder: (context, provider, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (value == 0
                                        ? _buildResendOTPWidget()
                                        : Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                '${AppLocalizations.current.resendOtp} in',
                                                style: TextStyles.regular12.copyWith(color: AppColor.textSecondary),
                                              ),
                                              Text(
                                                ' $value',
                                                style: TextStyles.bold12.copyWith(color: AppColor.textSecondary),
                                              ),
                                            ],
                                          )),
                                    10.verticalSpace,
                                    ValueListenableBuilder(
                                        valueListenable: _otpVerificationProvider.isDisable,
                                        builder: (context, _, __) {
                                          return AppButton(
                                            onPressed: _onPressVerifyOTP,
                                            text: AppLocalizations.current.verify,
                                            isDisable: _otpVerificationProvider.isDisable.value,
                                            isLoading: _otpVerificationProvider.isButtonLoading,
                                          );
                                        }),
                                  ],
                                );
                              }),
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

  Widget _buildResendOTPWidget() {
    return _otpVerificationProvider.isResendOTPButtonLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ))
        : Text(
            storage.userDetails.otpResendMessage ?? AppLocalizations.current.resendOtp,
            style: TextStyles.regular12.copyWith(color: AppColor.primaryColor, decoration: TextDecoration.underline),
          ).addGesture(
            () async {
              await _sendOTP(true);
              _startTimer();
            },
          );
  }

  Future<void> _sendOTP(bool isShowMessage) async {
    sentOTP = await _otpVerificationProvider.sendOTP(isShowMessage: isShowMessage);
  }

  void _startTimer() {
    _secondsRemaining.value = 59;
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

  Future<void> _onPressVerifyOTP() async {
    if (_otp == sentOTP) {
      if (screenType == OTPVerificationType.forgotPin) {
        appRouter.replace(SetPinRoute());
      } else {
        final result = await _otpVerificationProvider.callSubmitUserInfo();
        if (result) {
          if (storage.userDetails.isPinSet ?? false) {
            storage.isLogin = true;
            appRouter.pushAndPopUntil(
              VerifyPinRoute(),
              predicate: (route) => false,
            );
          } else {
            appRouter.replace(SetPinRoute());
          }
        }
      }
    } else {
      errorToast(AppLocalizations.current.theEnteredOtpIsInvalid);
    }
  }
}

enum OTPVerificationType { login, forgotPin }
