import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/model/base/api_req_data.dart';
import 'package:distributor_empower/presentation/authentication/pin/provider/user_pin_provider.dart';
import 'package:distributor_empower/presentation/base_stateful_widget.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/utils/enum_classes.dart';
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
class SetPinScreen extends BaseStatefulWidget {
  const SetPinScreen({super.key});

  @override
  BaseState<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends BaseState<SetPinScreen> {
  final ValueNotifier<bool> _isDisable = ValueNotifier(true);

  final _userPinProvider = UserPinProvider();

  String _pin = '';

  String _confirmPin = '';

  @override
  void dispose() {
    _isDisable.dispose();
    _userPinProvider.dispose();
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
                                if (!_isDisable.value) _validateAndContinue();
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
                                if (!_isDisable.value) _validateAndContinue();
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
                            return ChangeNotifierProvider.value(
                            value: _userPinProvider,
                            child: Consumer<UserPinProvider>(
                              builder: (context, provider, child) {
                                return AppButton(
                                  onPressed: _validateAndContinue,
                                  text: AppLocalizations.current.setPin,
                                  isDisable: _isDisable.value,
                                  isLoading: provider.isButtonLoading,
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

  Future<void> _validateAndContinue() async {
    if (!_isDisable.value && _pin == _confirmPin) {
      final result = await _userPinProvider.setUserPin(
        ApiReqData(
          pin: _pin,
          confirmPin: _confirmPin,
          pinType: ((storage.userDetails.isPinSet ?? false) ? SetPinType.resetPin : SetPinType.newPin).index,
        ),
      );

      if (result) {
        storage.isLogin = true;
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
