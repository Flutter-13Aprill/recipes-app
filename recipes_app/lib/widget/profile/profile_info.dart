import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          alignment: Alignment.centerRight,
          child: Icon(Icons.share_rounded),
        ),
        SizedBox(height: 10),
        Image.asset("images/Avatar.png"),
        SizedBox(height: 70),
        Row(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "32",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: AppColors.mainText,
                  ),
                ),
                Text(
                  "Recipes",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff9FA5C0),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "782",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: AppColors.mainText,
                  ),
                ),
                Text(
                  "Following",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff9FA5C0),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "1.287",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: AppColors.mainText,
                  ),
                ),
                Text(
                  "Followers",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: Color(0xff9FA5C0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
