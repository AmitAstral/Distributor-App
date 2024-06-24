import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final int duration;
  final String? text;
  final TextStyle? textStyle;
  final bool isLoading;
  final double? horizontalPadding;
  final double? verticalPadding;
  final bool isDisable;
  final Color bgColor;
  final double? width;

  const AppButton({super.key,
    this.textStyle,
    this.onPressed,
    this.duration = 100,
    this.isDisable = false,
    this.text,
    this.isLoading = false,
    this.width,
    this.bgColor = AppColor.primaryColor,
    this.horizontalPadding,
    this.verticalPadding,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 0.5.sw,
        child: ElevatedButton(
          onPressed: (isDisable || isLoading) ? () {} : onPressed ?? () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(bgColor.withOpacity(isDisable ? 0.4 : 1)),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: AppColor.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  text ?? '',
                  style: textStyle ?? TextStyles.semiBold16,
                ),
        ),
      ),
    );
  }
}
