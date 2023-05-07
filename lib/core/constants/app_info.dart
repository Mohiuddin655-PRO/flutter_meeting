import 'package:flutter/material.dart';

class AppInfo {
  static const String name = "Meeting";
}

class AppColors {
  static const MaterialColor primary = AppMaterialColors.primary;
  static const MaterialColor secondary = AppMaterialColors.secondary;
  static const MaterialColor ternary = AppMaterialColors.ternary;
  static const Color titleColor = Colors.white;
  static const Color statusBarColor = Colors.white;
  static const Color iconColor = Colors.white;
}

class AppPixels {
  static const double titleSize = 18;
}

class AppTheme {
  static const Brightness statusBrightness = Brightness.dark;
}

class AppColorCodes {}

class AppMaterialColors {
  static const MaterialColor primary = MaterialColor(
    _primary,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_primary),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const MaterialColor secondary = MaterialColor(
    _secondary,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_secondary),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const MaterialColor ternary = MaterialColor(
    _ternary,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_ternary),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _primary = 0xFF38394D;
  static const int _secondary = 0xFF0E72EC;
  static const int _ternary = 0xFFFF742F;
}
