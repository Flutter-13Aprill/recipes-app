import 'package:app/screen/login/login_screen.dart';
import 'package:app/widgets/button/navigator_button.dart';
import 'package:app/widgets/container/line_conatiner.dart';
import 'package:app/widgets/stack/onboarding_stack.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: Column(
        children: [
          OnboardingStack(), // Stack of images or visual content related to onboarding
          SizedBox(height: 10),
          Text(
            // Onboarding title text
            "Start Cooking",
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff2E3E5C),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            // Subtitle encouraging user to join the cooking community
            "Let’s join our community\nto cook better food!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff9FA5C0),
              fontWeight: FontWeight.bold,
            ),
          ),

          // Button to navigate to the login screen
          NavigatorButton(title: "Get Started", page: LoginScreen()),
          SizedBox(height: 70),
          LineConatiner(), // Decorative or separating line at the bottom
        ],
      ),
    );
  }
}
