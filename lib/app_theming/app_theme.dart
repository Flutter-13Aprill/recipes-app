import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re/app_theming/app_colors.dart';


class AppTheme {

  static final appTheme = ThemeData(
    splashColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,


    // Text Theme
    textTheme: TextTheme(

      // For title 
      titleLarge: GoogleFonts.inter(
        color: AppColors.mainTextColor,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      ),

      // Subtitle (onboarding)
      titleMedium: GoogleFonts.inter(
        color: AppColors.secondaryTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        
      ),

      // Text Buttons & password Validation header
      displayMedium: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 20,
        letterSpacing: 0.7,
        fontWeight: FontWeight.w700,
      ),

      // Upload fields 
      labelMedium: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.uploadSectionText,
        letterSpacing: 0.5
      ),

      // For hits an input fields, forget your password text, tab bar chip, and the name of the food in recipe card, and upload recipe 
      displaySmall: GoogleFonts.inter(
        color: AppColors.hintsColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.7
      )


    ),

  );

}