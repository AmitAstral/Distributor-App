import 'package:distributor_empower/presentation/home/components/order_details_widget1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static final TextStyle _bold = GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.w700));

  static final TextStyle _semiBold = GoogleFonts.poppins(textStyle: const TextStyle(fontWeight: FontWeight.w500));

  static final TextStyle _regular = GoogleFonts.poppins();

  static TextStyle get regular41 => _regular.copyWith(
        fontSize: 41.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular28 => _regular.copyWith(
        fontSize: 28.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular22 => _regular.copyWith(
        fontSize: 22.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular20 => _regular.copyWith(
        fontSize: 20.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular17 => _regular.copyWith(
        fontSize: 17.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular16 => _regular.copyWith(
        fontSize: 16.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular15 => _regular.copyWith(
        fontSize: 15.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular13 => _regular.copyWith(
        fontSize: 13.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular12 => _regular.copyWith(
        fontSize: 12.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular11 => _regular.copyWith(
        fontSize: 11.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular14 => _regular.copyWith(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular10 => _regular.copyWith(
        fontSize: 10.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular8 => _regular.copyWith(
        fontSize: 8.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get regular9 => _regular.copyWith(
        fontSize: 9.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get bold15 => _bold.copyWith(
        fontSize: 15.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get semiBold15 => _semiBold.copyWith(
        fontSize: 15.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get semiBold12 => _semiBold.copyWith(
        fontSize: 12.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get semiBold14 => _semiBold.copyWith(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get semiBold13 => _semiBold.copyWith(
        fontSize: 13.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get semiBold11 => _semiBold.copyWith(
        fontSize: 11.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );

  static TextStyle get semiBold16 => _semiBold.copyWith(
        fontSize: 16.sp,
        color: AppColors.textPrimary,
        overflow: TextOverflow.ellipsis,
      );
}
