import 'package:flutter/material.dart';

class ProjectTheme {
  static final themeDefault = ThemeData(
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 46, 62, 92),
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 159, 165, 192),
        fontSize: 17,
      ),
      bodySmall: TextStyle(
        color: Color.fromARGB(255, 159, 165, 192),
        fontSize: 12,
      ),
    ),
  );
}
