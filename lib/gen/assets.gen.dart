/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsBottomBarIconsGen {
  const $AssetsBottomBarIconsGen();

  /// File path: assets/bottom_bar_icons/darwer.svg
  SvgGenImage get darwer =>
      const SvgGenImage('assets/bottom_bar_icons/darwer.svg');

  /// File path: assets/bottom_bar_icons/darwer_selected.svg
  SvgGenImage get darwerSelected =>
      const SvgGenImage('assets/bottom_bar_icons/darwer_selected.svg');

  /// File path: assets/bottom_bar_icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/bottom_bar_icons/home.svg');

  /// File path: assets/bottom_bar_icons/home_selected.svg
  SvgGenImage get homeSelected =>
      const SvgGenImage('assets/bottom_bar_icons/home_selected.svg');

  /// File path: assets/bottom_bar_icons/offers.svg
  SvgGenImage get offers =>
      const SvgGenImage('assets/bottom_bar_icons/offers.svg');

  /// File path: assets/bottom_bar_icons/offers_selected.svg
  SvgGenImage get offersSelected =>
      const SvgGenImage('assets/bottom_bar_icons/offers_selected.svg');

  /// File path: assets/bottom_bar_icons/wecare.svg
  SvgGenImage get wecare =>
      const SvgGenImage('assets/bottom_bar_icons/wecare.svg');

  /// File path: assets/bottom_bar_icons/wecare_selected.svg
  SvgGenImage get wecareSelected =>
      const SvgGenImage('assets/bottom_bar_icons/wecare_selected.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        darwer,
        darwerSelected,
        home,
        homeSelected,
        offers,
        offersSelected,
        wecare,
        wecareSelected
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/about_us.svg
  SvgGenImage get aboutUs => const SvgGenImage('assets/icons/about_us.svg');

  /// File path: assets/icons/cart.svg
  SvgGenImage get cart => const SvgGenImage('assets/icons/cart.svg');

  /// File path: assets/icons/faq.svg
  SvgGenImage get faq => const SvgGenImage('assets/icons/faq.svg');

  /// File path: assets/icons/filter.svg
  SvgGenImage get filter => const SvgGenImage('assets/icons/filter.svg');

  /// File path: assets/icons/log_out.svg
  SvgGenImage get logOut => const SvgGenImage('assets/icons/log_out.svg');

  /// File path: assets/icons/menu.svg
  SvgGenImage get menu => const SvgGenImage('assets/icons/menu.svg');

  /// File path: assets/icons/need_help.svg
  SvgGenImage get needHelp => const SvgGenImage('assets/icons/need_help.svg');

  /// File path: assets/icons/profile_app_logo.svg
  SvgGenImage get profileAppLogo =>
      const SvgGenImage('assets/icons/profile_app_logo.svg');

  /// File path: assets/icons/rate_us.svg
  SvgGenImage get rateUs => const SvgGenImage('assets/icons/rate_us.svg');

  /// File path: assets/icons/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/share.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        aboutUs,
        cart,
        faq,
        filter,
        logOut,
        menu,
        needHelp,
        profileAppLogo,
        rateUs,
        share
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [splashLogo];
}

class $AssetsStaticImagesGen {
  const $AssetsStaticImagesGen();

  /// File path: assets/static_images/product_image.png
  AssetGenImage get productImage =>
      const AssetGenImage('assets/static_images/product_image.png');

  /// File path: assets/static_images/profile.png
  AssetGenImage get profile =>
      const AssetGenImage('assets/static_images/profile.png');

  /// File path: assets/static_images/profile_pic.png
  AssetGenImage get profilePic =>
      const AssetGenImage('assets/static_images/profile_pic.png');

  /// List of all assets
  List<AssetGenImage> get values => [productImage, profile, profilePic];
}

class Assets {
  Assets._();

  static const $AssetsBottomBarIconsGen bottomBarIcons =
      $AssetsBottomBarIconsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsStaticImagesGen staticImages = $AssetsStaticImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
