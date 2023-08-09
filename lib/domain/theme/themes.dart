import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes {
  final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: AppColors.primaryGreen,
    colorScheme: const ColorScheme(
      primary: AppColors.primaryGreen,
      onPrimary: AppColors.contrast,
      secondary: AppColors.text,
      onSecondary: AppColors.contrast,
      error: AppColors.error,
      onError: AppColors.contrast,
      background: AppColors.background,
      onBackground: AppColors.mediumGrey,
      surface: AppColors.contrast,
      onSurface: AppColors.lightGrey,
      shadow: AppColors.darkGrey,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryGreen,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryGreen,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryGreen,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.contrast,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final ThemeData themeBlue = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppColors.primaryBlue,
    colorScheme: const ColorScheme(
      primary: AppColors.primaryBlue,
      onPrimary: AppColors.contrast,
      secondary: AppColors.text,
      onSecondary: AppColors.contrast,
      error: AppColors.error,
      onError: AppColors.contrast,
      background: AppColors.background,
      onBackground: AppColors.mediumGrey,
      surface: AppColors.contrast,
      onSurface: AppColors.lightGrey,
      shadow: AppColors.darkGrey,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryBlue,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.contrast,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  final ThemeData themeRed = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: AppColors.primaryRed,
    colorScheme: const ColorScheme(
      primary: AppColors.primaryRed,
      onPrimary: AppColors.contrast,
      secondary: AppColors.text,
      onSecondary: AppColors.contrast,
      error: AppColors.error,
      onError: AppColors.contrast,
      background: AppColors.background,
      onBackground: AppColors.mediumGrey,
      surface: AppColors.contrast,
      onSurface: AppColors.lightGrey,
      shadow: AppColors.darkGrey,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryRed,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryRed,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryRed,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.contrast,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.text,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
