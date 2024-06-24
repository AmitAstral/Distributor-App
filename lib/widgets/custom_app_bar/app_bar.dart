import 'package:auto_route/auto_route.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/constants/fonts/font_family.dart';
import 'package:distributor_empower/constants/fonts/font_weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  final String? titleText;
  final Widget? title;
  final Color? shadowColor;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? elevation;
  final Widget? flexibleSpace;
  final double? toolbarHeight;
  final TextStyle? textStyle;
  final PreferredSizeWidget? bottomWidget;
  final double? flexibleSpaceRadius;
  final Widget? leading;
  final double? leadingWidth;
  final double? shapeRadius;
  final double? titleSpacing;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const AppBarWidget({
    super.key,
    this.titleText,
    this.title,
    this.shadowColor,
    this.backgroundColor,
    this.actions,
    this.centerTitle,
    this.elevation,
    this.flexibleSpace,
    this.toolbarHeight,
    this.textStyle,
    this.bottomWidget,
    this.flexibleSpaceRadius,
    this.leading,
    this.leadingWidth,
    this.shapeRadius,
    this.titleSpacing,
    this.systemOverlayStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: shadowColor,
      backgroundColor: backgroundColor ?? AppColor.primaryColor,
      systemOverlayStyle: systemOverlayStyle ??
          const SystemUiOverlayStyle(
            statusBarColor: AppColor.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
      elevation: elevation ?? 0,
      toolbarHeight: toolbarHeight ?? AppBar().preferredSize.height,
      centerTitle: centerTitle ?? true,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      // bottomOpacity: 0.0,
      // scrolledUnderElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(shapeRadius ?? 0),
        ),
      ),
      leading: leading ??
          const AutoLeadingButton(
            color: AppColor.white,
          ),
      title: title ??
          Text(
            titleText ?? '',
            style: textStyle ?? googleFontMontserrat.copyWith(color: AppColor.white, fontSize: 17.sp, fontWeight: GoogleFontWeight.extraBold),
          ),
      actions: actions,
      flexibleSpace: flexibleSpace,
      // ??
      // Container(
      //   decoration: BoxDecoration(
      //     color: AppColor.primaryColor,
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(flexibleSpaceRadius ?? 0),
      //       bottomRight: Radius.circular(flexibleSpaceRadius ?? 0),
      //     ),
      //   ),
      // ),
      automaticallyImplyLeading: false,
      bottom: bottomWidget ??
          const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: SizedBox.shrink(),
          ),
    );
  }
}
