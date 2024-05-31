import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

extension StrExtensions on String {}

extension WidgetsExtensions on Widget {
  Widget addGesture(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

void hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
