import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/authentication/otp/provider/otp_verification_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/pin_put_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
// ignore: must_be_immutable
class OtpVerificationScreen extends StatefulWidget {
  OTPVerificationType? screenType = OTPVerificationType.login;
  String sentOTP = '';

  OtpVerificationScreen({required this.sentOTP, this.screenType, super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String _otp = '';

  final ValueNotifier<int> _secondsRemaining = ValueNotifier(0);

  final _otpVerificationProvider = OTPVerificationProvider();

  Timer? _timer;

  @override
  void initState() {
    if (widget.screenType == OTPVerificationType.forgotPin) {
      _sendOTP(isShowMessage: false);
    }
    super.initState();
  }

  @override
  void dispose() {
    _timer = null;
    _secondsRemaining.dispose();
    _otpVerificationProvider.dispose();
    super.dispose();
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
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
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
            ),
          )
        : Text(
            storage.userDetails.otpResendMessage ?? AppLocalizations.current.resendOtp,
            style: TextStyles.regular12.copyWith(color: AppColor.primaryColor, decoration: TextDecoration.underline),
          ).addGesture(
            () async {
              await _sendOTP(isShowMessage: true);
              _startTimer();
            },
          );
  }

  Future<void> _sendOTP({required bool isShowMessage}) async {
    widget.sentOTP = await _otpVerificationProvider.sendOTP(isShowMessage: isShowMessage);
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
    if (_otp == widget.sentOTP) {
      if (widget.screenType == OTPVerificationType.forgotPin) {
        appRouter.replace(SetPinRoute());
      } else {
        final result = await _otpVerificationProvider.callSubmitUserInfo();
        if (result) {
          if (storage.userDetails.isPinSet ?? false) {
            storage.isLogin = true;
            appRouter.pushAndPopUntil(
              const VerifyPinRoute(),
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
