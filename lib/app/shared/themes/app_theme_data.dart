import 'package:flutter/material.dart';

import './app_colors.dart';

class AppThemeData {

  static ThemeData themeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
    primaryColor: AppColors.primary,
    backgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.background,
      ),
    ),
  );

}