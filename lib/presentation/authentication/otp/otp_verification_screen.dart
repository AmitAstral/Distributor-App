import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/authentication/otp/provider/otp_verification_provider.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
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
class OtpVerificationScreen extends BaseStatefulWidget {
  OTPVerificationType? screenType = OTPVerificationType.login;
  String sentOTP = '';

  OtpVerificationScreen({required this.sentOTP, this.screenType, super.key});

  @override
  BaseState<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends BaseState<OtpVerificationScreen> {
  String _otp = '';

  final _secondsRemaining = ValueNotifier(0);

  final _otpVerificationProvider = OTPVerificationProvider();

  Timer? _timer;
  String? _message;

  @override
  void initState() {
    _forgotPinSendOTP();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _secondsRemaining.dispose();
    _otpVerificationProvider.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
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
                        storage.userDetails.otpSentMessage ?? _message ?? '',
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
                            child: Consumer<OTPVerificationProvider>(
                              builder: (context, provider, child) {
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
    final response = await _otpVerificationProvider.sendOTP(isShowMessage: isShowMessage);
    widget.sentOTP = response?.otp ?? '';
    _message = response?.message ?? '';
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
        appRouter.replace(const SetPinRoute());
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
            appRouter.replace(const SetPinRoute());
          }
        }
      }
    } else {
      errorToast(AppLocalizations.current.theEnteredOtpIsInvalid);
    }
  }

  void _forgotPinSendOTP() {
    if (widget.screenType == OTPVerificationType.forgotPin) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await _sendOTP(isShowMessage: false);
          setState(() {});
        },
      );
    }
  }
}
