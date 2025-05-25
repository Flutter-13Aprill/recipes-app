import 'package:flutter/material.dart';
import 'package:recpie_app/widget/custom_button.dart';
import 'package:recpie_app/widget/main_text.dart';
import 'package:recpie_app/widget/secondary_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Image.asset('assets/images/Onboarding.png', fit: BoxFit.contain),
            SizedBox(height: 16),
            MainText(text: 'Start Cooking'),
            SizedBox(height: 16),
            SecondaryText(
              fontSize: 17,
              text: '''Let’s join our community
     to cook better food!''',
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: CustomButton(
                borderRadius: 32,
                text: 'Get Started',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
