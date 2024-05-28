import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final int duration;
  final String? text;
  final TextStyle? textStyle;
  final bool? isLoading;
  final double? horizontalPadding;
  final double? verticalPadding;

  const AppButton(
      {super.key,
      this.child,
      this.textStyle,
      this.onPressed,
      this.duration = 100,
      this.text,
      this.isLoading,
      this.horizontalPadding,
      this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 0.5.sw,
        child: ElevatedButton(
          onPressed: onPressed ?? () {},
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColor.primaryColor),
          ),
          child: Text(
            text ?? '',
            style: textStyle ?? TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
