import 'package:flutter/cupertino.dart';

extension StrExtensions on String {}

extension WidgetsExtensions on Widget {
  Widget addGesture(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}
