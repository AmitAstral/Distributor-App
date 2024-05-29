import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/routes/router.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/app_text_form_field.dart';
import 'package:distributor_empower/widgets/auth_top_logo_widget.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _sapCodeController = TextEditingController();

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
                      AppButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              appRouter.push(OtpRoute());
                            }
                          },
                          text: AppLocalizations.current.getOTP),
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
}
