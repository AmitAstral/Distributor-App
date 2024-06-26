import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerEffect.rectangular({
    required this.height,
    super.key,
    this.width = double.infinity,
  }) : this.shapeBorder = const RoundedRectangleBorder();

  const ShimmerEffect.circular({
    required this.height,
    super.key,
    this.width = double.infinity,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade400,
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey.shade300,
            shape: shapeBorder == const RoundedRectangleBorder()
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                : shapeBorder,
          ),
        ),
      );
}
