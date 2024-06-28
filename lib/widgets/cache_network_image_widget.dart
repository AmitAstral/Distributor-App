import 'package:cached_network_image/cached_network_image.dart';
import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:distributor_empower/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageWidget extends CachedNetworkImage {
  final Color? loaderColor;
  final Color? errorIconColor;
  final double? loaderSize;

  CachedNetworkImageWidget({
    required super.imageUrl,
    super.key,
    super.httpHeaders,
    super.imageBuilder,
    super.placeholder,
    super.progressIndicatorBuilder,
    super.errorWidget,
    super.fadeOutDuration = const Duration(milliseconds: 1000),
    super.fadeOutCurve = Curves.easeOut,
    super.fadeInDuration = const Duration(milliseconds: 500),
    super.fadeInCurve = Curves.easeIn,
    super.width,
    super.height,
    super.fit,
    super.alignment = Alignment.center,
    super.repeat = ImageRepeat.noRepeat,
    super.matchTextDirection = false,
    super.cacheManager,
    super.useOldImageOnUrlChange = false,
    super.color,
    super.filterQuality = FilterQuality.low,
    super.colorBlendMode,
    super.placeholderFadeInDuration,
    super.memCacheWidth,
    super.memCacheHeight,
    super.cacheKey,
    super.maxWidthDiskCache,
    super.maxHeightDiskCache,
    super.errorListener,
    this.loaderColor,
    this.errorIconColor,
    this.loaderSize,
  });

  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }

  @override
  LoadingErrorWidgetBuilder? get errorWidget =>
      super.errorWidget ??
      (context, url, error) {
        return Assets.images.splashLogo.image(
          color: AppColor.grey,
        );
      };

  @override
  ProgressIndicatorBuilder? get progressIndicatorBuilder =>
      super.progressIndicatorBuilder ??
      (context, url, error) {
        return SizedBox(
          width: loaderSize ?? 30.w,
          height: loaderSize ?? 30.w,
          child: Center(
            child: CircularProgressIndicator(
              color: loaderColor ?? AppColor.primaryColor,
              strokeWidth: 2,
            ),
          ),
        );
      };
}
