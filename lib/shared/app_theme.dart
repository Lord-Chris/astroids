import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_textstyles.dart';

class AppTheme {
  static final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary, brightness: Brightness.dark),
    fontFamily: AppTextStyles.inter,
    scaffoldBackgroundColor: AppColors.black,
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColors.white,
    //   selectedItemColor: AppColors.primary,
    //   unselectedItemColor: AppColors.frameHeader,
    //   selectedLabelStyle: AppTextStyles.medium12,
    //   unselectedLabelStyle: AppTextStyles.medium12,
    //   landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.all(16),
    //   border: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.strokeFinal),
    //   ),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.strokeFinal),
    //   ),
    //   disabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(width: .5),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(width: .5),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.errorRed, width: .5),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColors.errorRed, width: .5),
    //   ),
    //   errorStyle: AppTextStyles.regular12.copyWith(color: AppColors.errorRed),
    //   // hintStyle: AppTextStyles.regular16.copyWith(color: AppColors.gray400),
    // ),
    // cupertinoOverrideTheme: const CupertinoThemeData(
    //   primaryColor: AppColors.primary,
    //   applyThemeToAll: true,
    //   brightness: Brightness.light,
    //   scaffoldBackgroundColor: AppColors.white,
    // ),
  );
}
