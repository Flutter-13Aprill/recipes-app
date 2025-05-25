import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';

class CheckedNumCard extends StatelessWidget {
  const CheckedNumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Image.asset("images/Check Circle.png"),
        Text(
          "Contains a number",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: AppColors.mainText,
          ),
        ),
      ],
    );
  }
}
