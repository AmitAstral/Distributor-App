import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/authentication/login/login_provider.dart';
import 'package:distributor_empower/presentation/authentication/otp/otp_verification_screen.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/app_text_form_field.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _sapCodeController = TextEditingController();

  final _loginProvider = LoginProvider();

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
                  padding: EdgeInsets.all(30.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Form(
                        key: _formKey,
                        child: AppTextFormField(
                          hintText: AppLocalizations.current.SAPCode,
                          controller: _sapCodeController,
                          textCapitalization: TextCapitalization.characters,
                          validator: (text) {
                            if ((text ?? '').isEmpty) return AppLocalizations.current.enterSAPCode;
                            return null;
                          },
                        ),
                      ),
                      30.verticalSpace,
                      ChangeNotifierProvider.value(
                        value: _loginProvider,
                        child: Consumer<LoginProvider>(
                          builder: (context, state, child) {
                            return AppButton(
                              isLoading: _loginProvider.isButtonLoading,
                              onPressed: _callLoginAPI,
                              text: AppLocalizations.current.login,
                            );
                          },
                        ),
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

  Future<void> _callLoginAPI() async {
    if (_formKey.currentState!.validate()) {
      final result = await _loginProvider.callLoginAPI(_sapCodeController.text.trim());
      if (result) {
        appRouter.push(
          OtpVerificationRoute(
            sentOTP: storage.userDetails.otp ?? '',
            screenType: OTPVerificationType.login,
          ),
        );
      }
    }
  }
}
