import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const accent = Color(0xFFFF5A45);
  static const background = Color(0xFF0B0D12);
  static const surface = Color(0xFF151820);
  static const border = Color(0xFF2A2F3B);
  static const muted = Color(0xFFA7ADBB);

  static ThemeData buildTheme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final bg = dark ? background : const Color(0xFFF8FAFC);
    final card = dark ? surface : Colors.white;
    final text = dark ? const Color(0xFFE8E9ED) : const Color(0xFF0F172A);
    final outline = dark ? border : const Color(0xFFE2E8F0);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: brightness,
        primary: dark ? const Color(0xFFFF765F) : const Color(0xFFD94835),
        surface: card,
        onSurface: text,
        outline: outline,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: text,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: dark ? Brightness.light : Brightness.dark,
        ),
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: dark ? 8 : 2,
        shadowColor: Colors.black.withValues(alpha: dark ? 0.35 : 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: outline),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: outline),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(color: text, fontWeight: FontWeight.w800),
        titleLarge: TextStyle(color: text, fontWeight: FontWeight.w800),
        bodyMedium: TextStyle(color: muted),
      ),
    );
  }
}
