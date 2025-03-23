import 'package:flutter/material.dart';
import 'package:test_project/utils/constants/colors.dart';

class AppThemeData {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Montserrat',
    primarySwatch: AppColors.primaryMaterialColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 36,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontSize: 36, color: Colors.white, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          fontSize: 22,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
      labelLarge: TextStyle(
          fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(
          fontSize: 13,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      labelSmall: TextStyle(
          fontSize: 13,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 10,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 8,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Colors.black,
          fontWeight: FontWeight.bold),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Montserrat',
    primarySwatch: AppColors.primaryMaterialColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkprimaryTextColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 36,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontSize: 36,
          color: AppColors.darkprimaryTextColor,
          fontWeight: FontWeight.w600),
      displaySmall: TextStyle(
          fontSize: 22,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
          fontSize: 18,
          color: AppColors.darkprimaryTextColor,
          fontWeight: FontWeight.w600),
      headlineMedium: TextStyle(
          fontSize: 18,
          color: AppColors.darkprimaryTextColor,
          fontWeight: FontWeight.w400),
      headlineSmall: TextStyle(
          fontSize: 14,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      labelLarge: TextStyle(
          fontSize: 13,
          color: AppColors.darkprimaryTextColor,
          fontWeight: FontWeight.w600),
      labelMedium: TextStyle(
          fontSize: 13,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w600),
      labelSmall: TextStyle(
          fontSize: 13,
          color: AppColors.darkprimaryTextColor,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontSize: 10,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontSize: 8,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'Montserrat',
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}
