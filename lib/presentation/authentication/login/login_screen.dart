import 'package:auto_route/annotations.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:distributor_empower/generated/l10n.dart';
import 'package:distributor_empower/presentation/home/components/order_details_widget1.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:distributor_empower/widgets/app_button.dart';
import 'package:distributor_empower/widgets/app_text_form_field.dart';
import 'package:distributor_empower/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              _buildTopView(),
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
                          validator: (text) {
                            if ((text ?? '').isEmpty) return AppLocalizations.current.enterSAPCode;
                            return null;
                          },
                        ),
                      ),
                      30.verticalSpace,
                      AppButton(
                          onPressed: () async {
                            _formKey.currentState!.validate();
                          },
                          text: AppLocalizations.current.login),
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

  Container _buildTopView() {
    return Container(
      height: 0.5.sh,
      color: AppColor.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.current.welcomeToAstral,
            style: TextStyles.semiBold16,
          ),
          SizedBox(height: 10.h),
          Hero(tag: "SplashLogo", transitionOnUserGestures: true, child: Center(child: Assets.images.splashLogo.image(height: 70.h))),
        ],
      ),
    );
  }
}
