import 'package:flutter/material.dart';
import 'package:recpie_app/theme/colors_app.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsApp.primary,
    scaffoldBackgroundColor: ColorsApp.white,
    fontFamily: 'Alexandria',

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ColorsApp.mainText, fontSize: 16),
      bodyMedium: TextStyle(color: ColorsApp.secondryText, fontSize: 14),
      titleLarge: TextStyle(color: ColorsApp.secondryText, fontSize: 12),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsApp.white,
      elevation: 0,
      iconTheme: IconThemeData(color: ColorsApp.mainText),
      titleTextStyle: TextStyle(
        color: ColorsApp.mainText,
        fontSize: 16,
        fontFamily: 'Alexandria',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
