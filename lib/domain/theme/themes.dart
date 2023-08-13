import 'package:app_laundry/domain/theme/theme_mapping.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes {
  static final ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.green,
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme(
      primary: AppColors.primaryColor,
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
      titleLarge: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      displayLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w300,
        color: AppColors.text,
      ),
      headlineMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: AppColors.text,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.text,
      ),
      labelLarge: TextStyle(
        fontSize: 26,
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

  final Map<AvailableThemesEnum, ThemeData> availableThemes =
      <AvailableThemesEnum, ThemeData>{
    AvailableThemesEnum.lightGreenTheme: defaultTheme,
    AvailableThemesEnum.defaultTheme: defaultTheme,
  };
}
