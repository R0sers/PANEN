import 'package:flutter/material.dart';

class AppColors {
  static const hijauTua = Color(0xFF1B5E20);
  static const hijau = Color(0xFF2E7D32);
  static const hijauMuda = Color(0xFF66BB6A);
  static const hijauPucat = Color(0xFFE8F5E9);
  static const emas = Color(0xFFF9A825);
  static const merah = Color(0xFFC62828);
}

class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppColors.hijau,
      primary: AppColors.hijau,
      secondary: AppColors.emas,
      brightness: Brightness.light,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: const Color(0xFFF6FAF6),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.hijau,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: AppColors.hijauPucat,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.hijau,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0xFFDCEBDD)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.hijau,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
