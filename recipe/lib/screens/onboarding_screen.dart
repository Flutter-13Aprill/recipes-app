import 'package:flutter/material.dart';
import 'package:recipe/cusom_widget/main_buttom.dart';
import 'package:recipe/screens/signin/singin_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsetsGeometry.only(top: 30)),
              Image.asset(
                'assets/images/Onboarding.png',
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40),
              Text(
                'Start Cooking',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Let’s join our community \nto cook better food!',
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: MainButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignInScreen()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
