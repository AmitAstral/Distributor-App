import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/presentation/authentication/pin/provider/user_pin_provider.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/common_dialog.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
import 'package:distributor_empower/utils/extensions.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/utils/toast.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/pin_put_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class VerifyPinScreen extends StatefulWidget {
  const VerifyPinScreen({super.key});

  @override
  State<VerifyPinScreen> createState() => _VerifyPinScreenState();
}

class _VerifyPinScreenState extends State<VerifyPinScreen> {
  final ValueNotifier<bool> _isDisable = ValueNotifier(true);

  String _pin = '';

  final _userPinProvider = UserPinProvider();

  @override
  void dispose() {
    _isDisable.dispose();
    _userPinProvider.dispose();
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
              Stack(
                children: [
                  const AuthTopLogoWidget(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _buildLogoutButton(),
                  )
                ],
              ),
              SizedBox(
                height: 0.5.sh,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      40.verticalSpace,
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
                                if (!_isDisable.value) {
                                  _validateAndContinue();
                                }
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
                                appRouter.push(
                                  OtpVerificationRoute(
                                    sentOTP: '',
                                    screenType: OTPVerificationType.forgotPin,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      ValueListenableBuilder(
                          valueListenable: _isDisable,
                          builder: (context, _, __) {
                            return ChangeNotifierProvider.value(
                              value: _userPinProvider,
                              child: Consumer<UserPinProvider>(
                                builder: (context, provider, child) {
                                  return AppButton(
                                    onPressed: _validateAndContinue,
                                    text: AppLocalizations.current.verifyPin,
                                    isDisable: _isDisable.value,
                                    isLoading: provider.isButtonLoading,
                                  );
                                },
                              ),
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

  Widget _buildLogoutButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20).h,
        child: const Icon(
          Icons.logout,
          color: AppColor.white,
        ),
      ),
    ).addGesture(
      () {
        CommonDialog.showCommonDialog(
          title: AppLocalizations.current.messageAreYouSureLogout,
          positiveTitle: AppLocalizations.current.yes,
          negativeTitle: AppLocalizations.current.no,
          onPositivePressed: () {
            storage.logout();
          },
        );
      },
    );
  }

  Future<void> _validateAndContinue() async {
    if (!_isDisable.value) {
      final result = await _userPinProvider.verifyUserPin(ApiReqData(
        pin: _pin,
        withUserInfo: true,
        pinType: SetPinType.verifyPin.index,
      ));

      if (result) {
        appRouter.pushAndPopUntil(
          const DashboardRoute(),
          predicate: (route) => false,
        );
      }
    } else {
      errorToast(AppLocalizations.current.validatePinAndConfirmPin);
    }
  }
}
