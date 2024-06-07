import 'package:distributor_empower/core/di/locator.dart';
import 'package:distributor_empower/widgets/cache_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  double? height;
  double? width;

  ProfileWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ).h,
      child: CachedNetworkImageWidget(
        imageUrl: storage.userDetails.getUserProfile,
        height: height ?? 45.h,
        width: width ?? 45.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
