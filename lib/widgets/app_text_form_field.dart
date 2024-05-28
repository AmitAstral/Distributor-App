import 'package:distributor_empower/constants/all_constants.dart';
import 'package:distributor_empower/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? margin;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final double borderRadius;
  final bool isDisabled;
  final void Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obsecure;

  const AppTextFormField({
    required this.hintText,
    required this.controller,
    super.key,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.margin,
    this.maxLength,
    this.inputFormatters,
    this.maxLines,
    this.borderRadius = 16,
    this.isDisabled = false,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.obsecure = false,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.symmetric(vertical: 4.h),
      child: TextFormField(
        readOnly: widget.isDisabled,
        onTap: widget.onTap,
        maxLines: widget.maxLines ?? 1,
        obscureText: widget.obsecure ?? false,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        onChanged: (value) {
          if (widget.onChanged != null) widget.onChanged!(value);
          setState(() {});
        },
        controller: widget.controller,
        style: TextStyles.regular16.copyWith(color: AppColor.textSecondary),
        validator: widget.validator,
        cursorColor: AppColor.primaryColor,
        textAlignVertical: TextAlignVertical.center,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          counter: const SizedBox.shrink(),
          alignLabelWithHint: true,
          errorStyle: TextStyles.regular12.copyWith(height: 0, color: AppColor.red),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          hintText: widget.hintText,
          labelText: widget.hintText,
          labelStyle: TextStyles.regular14.copyWith(color: AppColor.textSecondary),
          hintStyle: TextStyles.regular14.copyWith(color: AppColor.grey),
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.primaryColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.controller.text.isEmpty ? AppColor.red : Colors.red,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.controller.text.isEmpty ? AppColor.red : Colors.red,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }
}
