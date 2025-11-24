import 'package:flutter/material.dart';

class AppTheme {
  /// 🎨 PRIMARY — Biru Tech Elegan
  static const Color _primaryBlue = Color(0xFF2962FF); // Royal Tech Blue
  static const Color _primaryBlueDark = Color(0xFF0039CB); // Deep Tech Blue

  /// 🌤 LIGHT THEME — Clean, Futuristic, Premium
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryBlue,
      brightness: Brightness.light,
      primary: _primaryBlue,
      secondary: const Color(0xFF90CAF9), // Soft Light Blue
      tertiary: const Color(0xFF42A5F5),
    ),

    scaffoldBackgroundColor: const Color(0xFFF5F7FB),
    cardColor: Colors.white,
    shadowColor: Colors.black.withOpacity(0.10),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.black87,
    ),

    navigationBarTheme: NavigationBarThemeData(
      height: 70,
      indicatorColor: _primaryBlue.withOpacity(0.15),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    dialogBackgroundColor: Colors.white,
  );

  /// 🌙 DARK THEME — Premium Midnight Tech
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: _primaryBlueDark,
      brightness: Brightness.dark,
      primary: _primaryBlueDark,
      secondary: const Color(0xFF64B5F6),
      tertiary: const Color(0xFF1E88E5),
    ),

    scaffoldBackgroundColor: const Color(0xFF0D0F14), // Premium Midnight
    cardColor: const Color(0xFF151820),
    shadowColor: Colors.black.withOpacity(0.30),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Colors.white,
    ),

    navigationBarTheme: NavigationBarThemeData(
      height: 70,
      indicatorColor: _primaryBlueDark.withOpacity(0.20),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    dialogBackgroundColor: const Color(0xFF1A1D25),
  );
}
