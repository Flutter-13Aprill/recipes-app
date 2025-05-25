import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              "All",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xffF4F5F7),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              "Food",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xff9FA5C0),
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
              color: Color(0xffF4F5F7),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              "Drink",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xff9FA5C0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
