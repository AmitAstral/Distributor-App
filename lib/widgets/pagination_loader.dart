import 'package:distributor_empower/constants/all_constants.dart';
import 'package:flutter/material.dart';

class PaginationLoader extends StatelessWidget {
  const PaginationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.verticalSpace,
        CircularProgressIndicator(
          color: AppColor.primaryColor,
          strokeWidth: 3.r,
        ),
        10.verticalSpace,
      ],
    );
  }
}
