import 'package:flutter/material.dart';

class CustomThemeApp {
  static final lightTheme = ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,),
      displayMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,),
      displaySmall: TextStyle(fontSize: 15,),
      bodyLarge: TextStyle(fontSize: 17,),
      bodyMedium: TextStyle(fontSize: 15,),
      bodySmall: TextStyle(fontSize: 12),
    ));
}
