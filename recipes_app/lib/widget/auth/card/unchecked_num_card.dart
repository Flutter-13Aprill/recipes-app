import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UncheckedNumCard extends StatelessWidget {
  const UncheckedNumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Image.asset("images/Unchecked Circle.png"),
        Text(
          "Contains a number",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xff9FA5C0),
          ),
        ),
      ],
    );
  }
}
