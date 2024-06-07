import 'package:cached_network_image/cached_network_image.dart';
import 'package:distributor_empower/constants/all_constants.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends CachedNetworkImage {
  Color? loaderColor;
  Color? errorIconColor;

  CachedNetworkImageWidget({
    super.key,
    required super.imageUrl,
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
  });

  @override
  LoadingErrorWidgetBuilder? get errorWidget => (context, url, error) {
        return Icon(
          Icons.error_outline,
          color: errorIconColor ?? AppColor.primaryColor,
        );
      };

  @override
  ProgressIndicatorBuilder? get progressIndicatorBuilder => (context, url, error) {
        return SizedBox(
          width: 30.w,
          height: 30.w,
          child: Center(
            child: CircularProgressIndicator(
              color: loaderColor ?? AppColor.primaryColor,
              strokeWidth: 2,
            ),
          ),
        );
      };
}
