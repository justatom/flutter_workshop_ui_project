import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFFF99A1C);
  static const primaryLight = Color(0xFFFFF1D6);
  static const textDark = Color(0xFF1E1E1E);
  static const textGrey = Color(0xFF7A7A7A);
  static const border = Color(0xFFD9D9D9);
  static const otpFill = Color(0xFFE6E6E6);
  static const white = Colors.white;
}

class AppImages {
  AppImages._();

  static const _dir = 'assets/images';
  static const icon = '$_dir/icon.png';
  static const orange1 = '$_dir/img_orange1.png';
  static const orange2 = '$_dir/img_orange2.png';
  static const orange3 = '$_dir/img_orange3.png';
  static const google = '$_dir/img_g.png';
  static const facebook = '$_dir/img_f.png';
  static const apple = '$_dir/img_a.png';
}

class AppTextStyles {
  AppTextStyles._();

  static const title = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );
  static const subtitle = TextStyle(fontSize: 15, color: AppColors.textDark);
  static const caption = TextStyle(fontSize: 13, color: AppColors.textGrey);
  static const link = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}

class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final fieldRadius = BorderRadius.circular(8);
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
      ),
      scaffoldBackgroundColor: AppColors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          minimumSize: const Size.fromHeight(52),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          minimumSize: const Size(0, 40),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        hintStyle: const TextStyle(color: AppColors.textGrey, fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: fieldRadius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: fieldRadius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: fieldRadius,
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
