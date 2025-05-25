import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Screens/login/login_Screen.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: context.screenHeight * 0.05),
          Image.asset("assets/images/dishes.png"),
          // Title and subtitle
          const SizedBox(height: 16),
          Text(
            'Start Cooking',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: mainText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Let's join our community\nto cook better food!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: secondaryText),
          ),
          const Spacer(),
          // Get Started button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
            child: SizedBox(
              width: double.infinity,
              height: context.screenHeight * 0.07,
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: context.screenHeight * 0.1),
        ],
      ),
    );
  }
}
