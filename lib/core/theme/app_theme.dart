import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class AppTheme {
  static MacosThemeData get light {
    return MacosThemeData.light().copyWith(
      typography: MacosTypography(
        body: const TextStyle(fontSize: 14, fontFamily: 'SF Pro Text'),
      ),
    );
  }

  static MacosThemeData get dark {
    return MacosThemeData.dark().copyWith(
      typography: MacosTypography(
        body: const TextStyle(fontSize: 14, fontFamily: 'SF Pro Text'),
      ),
    );
  }
}