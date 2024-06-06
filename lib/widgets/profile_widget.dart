import 'package:distributor_empower/core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  double? height;
  double? width;

  ProfileWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45.h,
      width: width ?? 45.h,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(storage.userDetails.getUserProfile),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
