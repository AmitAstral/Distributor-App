import 'package:flutter/material.dart';

class Init {
  static Init? _instance;
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  factory Init() => _instance ?? Init._internal();

  Init._internal() {
    _instance = this;
  }

  BuildContext? get currentContext => !hasCurrentContext ? null : scaffoldMessengerKey!.currentContext!;

  bool get hasCurrentContext => scaffoldMessengerKey!.currentContext != null;
}
