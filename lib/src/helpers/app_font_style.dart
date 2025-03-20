import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headline Styles
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimaryLight,
  );

  // Subtitle Styles
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondaryLight,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryLight,
  );

  // Body Text Styles
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryLight,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryLight,
  );

  // Button Text Styles
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Caption & Small Text
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondaryLight,
  );

  // Dark Mode Variants
  static const TextStyle headline1Dark = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryDark,
  );

  static const TextStyle bodyText1Dark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryDark,
  );
}
