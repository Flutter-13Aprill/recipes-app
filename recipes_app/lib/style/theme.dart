import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/style/style_color.dart';

class CustomTheme {
  static final defaultTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: StyleColor.primary,
      onPrimary: StyleColor.mainText,
      secondary: StyleColor.secondaryText,
      onSecondary: Colors.black,
      error: StyleColor.secondary,
      onError: StyleColor.secondary,
      surface: Colors.white,
      onSurface: Colors.grey,
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.inter(
        color: StyleColor.mainText,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.inter(
        color: StyleColor.mainText,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: GoogleFonts.inter(
        color: StyleColor.secondaryText,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.inter(
        color: StyleColor.mainText,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.inter(
        color: StyleColor.secondaryText,
        fontSize: 17,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.inter(
        color: StyleColor.secondaryText,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
