import 'package:flutter/material.dart';
import 'package:recipes_app/style/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.buttonColor,

    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 20,
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
      ),

      bodyMedium: TextStyle(fontSize: 16, color: AppColors.secondary),
    ),
  );
}
