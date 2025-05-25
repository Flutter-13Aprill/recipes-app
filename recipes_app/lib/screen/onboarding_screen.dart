import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/screen/auth/sign_up_screen.dart';
import 'package:recipes_app/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/Onboarding.png"),
          Text(
            "Start Cooking",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: AppColors.mainText,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Let’s join our community\nto cook better food!",
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Color.fromRGBO(159, 165, 192, 1),
            ),
          ),
          SizedBox(height: 72),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignUpScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 56,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: AppColors.primary,
              ),
              child: Text(
                "Get Started",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
