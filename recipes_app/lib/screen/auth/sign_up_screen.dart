import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/theme/app_colors.dart';
import 'package:recipes_app/widget/auth/sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 107),
            Center(
              child: Text(
                "Welcome!",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: AppColors.mainText,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter your account here",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Color(0xff9FA5C0),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            SignUpWidget(),
          ],
        ),
      ),
    );
  }
}
