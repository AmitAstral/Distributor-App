import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

extension StrExtensions on String? {
  String? get ifBlank => (this == null || this!.isEmpty) ? null : this;

  String get formatWithCurrency {
    var format = NumberFormat.currency(
      locale: 'HI',
      symbol: '₹ ',
      decimalDigits: int.tryParse(this ?? '0') != null ? 0 : 2,
    );
    return format.format(int.tryParse(this ?? '0') ?? double.tryParse(this ?? '0') ?? '0');
  }

  Color get getColorFromColorString => HexColor.fromHex(this ?? '#fff');
}

extension WidgetsExtensions on Widget {
  Widget addGesture(Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

void hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}
