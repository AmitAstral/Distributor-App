import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmerEffectWidget extends StatelessWidget {
  const HomeShimmerEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildShimmerEffect(
            child: Container(
              height: 205.h,
              width: 1.sw,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).w,
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)).r, color: AppColor.white),
            ),
          ),
          _buildShimmerEffect(
            child: Container(
              height: 180.h,
              width: 1.sw,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).w,
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)).r, color: AppColor.white),
            ),
          ),
          _buildShimmerEffect(
            child: Container(
              height: 180.h,
              width: 1.sw,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).w,
              decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)).r, color: AppColor.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerEffect({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.grey.withOpacity(0.1),
      child: child,
    );
  }
}
