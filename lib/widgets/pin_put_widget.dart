import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatelessWidget {
  final _defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyles.semiBold16.copyWith(color: AppColor.textSecondary),
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.grey),
      borderRadius: BorderRadius.circular(15),
    ),
  );

  PinTheme get focusedPinTheme => _defaultPinTheme.copyDecorationWith(
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(8),
      );

  final Function(String) onChange;
  final bool isObscureText;

  PinPutWidget({
    required this.onChange,
    super.key,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      onChanged: onChange,
      obscureText: isObscureText,
      defaultPinTheme: _defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
