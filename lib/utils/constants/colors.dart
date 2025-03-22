import 'package:flutter/material.dart';
import 'package:test_project/utils/helpers.dart';

class AppColors {
  // Primary Gradient Colors
  static const Color primaryGradientStart = Color(0xFF22DA70);
  static const Color primaryGradientEnd = Color(0xFF22C4AF);

  // Box Shadow Color
  static const Color boxShadowColor = Color(0x9494946B);

  // Define a LinearGradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryGradientStart, primaryGradientEnd],
  );

  // Colors
  static const Color primaryColor = Color(0xFF000000); // Default to start color
  static const Color primaryTextColor = Color(0xFF989898);
  static const Color darkprimaryTextColor = Color(0xFF2F2F2F);
  static const Color languageButtonColor = Color(0xFFF3F3F4);
  static const Color profileContainerColor = Color(0xFFF0F0F0);
  static const Color buttonGreyColor = Color(0xFFB2B1B9);
  static const Color inputFieldBorderColor = Color(0xFFEEEEEE);
  static const Color secondaryTextColor = Color(0xFF7C8894);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color dividerColor = Color(0xFFC5C5C5);
  static const Color selectedButtonColor = Color(0xFFD90864);
  static const Color SecondaryButton = Color(0xFF1A2130);
  static const Color primary50Color = Color(0xFFFFF5ED);
  static const Color ContainerGreyColor = Color(0xFFE7E7E7);
  static const Color dotColor = Color(0xFFD9D9D9);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color dottedColor = Color(0xFFC5C5C5);
  static const Color iconColor = Color(0xFF1C274C);
  static const Color textColor = Color(0xFF555555);
  static const Color deactivateTextColor = Color(0xFFFF7979);
  static const Color customTextButtonColor = Color(0xFF00A3FF);

  static const Color containerBackColor = Color(0xFFF7F7F7);

  static const Color lineShapeColor = Color(0xFFEBEDF9);

  static const Color bodyTextColor = Color(0xFF404D64);
  static const Color shimmerBaseColor = AppColors.bodyTextColor;
  static const Color shimmerHighlightColor = AppColors.lineShapeColor;
// Box Shadow
  static final List<BoxShadow> boxShadow = [
    BoxShadow(
      color: boxShadowColor,
      offset: Offset(0, 5), // X, Y offset
      blurRadius: 10,
      spreadRadius: 0,
    ),
  ];
  static final MaterialColor primaryMaterialColor =
      Helper.generateMaterialColor(AppColors.primaryColor);
  static const bool production = false;
}
