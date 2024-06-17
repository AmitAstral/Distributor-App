import 'package:distributor_empower/constants/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final bool? inAsyncCall;
  final double? opacity;
  final Color? color;
  final Widget? progressIndicator;
  final Offset? offset;
  final bool? dismissible;
  final Widget? child;

  const ProgressWidget({
    super.key,
    @required this.inAsyncCall,
    this.opacity = 0,
    this.color = AppColor.grey,
    this.progressIndicator = const CircularProgressIndicator(color: AppColor.primaryColor),
    this.offset,
    this.dismissible = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall!) return child!;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(child: progressIndicator);
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: progressIndicator!,
      );
    }

    return Stack(
      children: [
        child!,
        Opacity(
          opacity: opacity!,
          child: ModalBarrier(dismissible: dismissible!, color: color),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}
