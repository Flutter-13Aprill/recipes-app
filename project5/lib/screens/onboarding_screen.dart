import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/screens/login/login_screen.dart';
import 'package:project5/widgets/green_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: context.getWidth(),
                height: context.getHeight() * 0.65,
                child: Image.asset(
                  'assets/images/onboarding.png',
                  fit: BoxFit.fill,
                ),
              ),
              Text('Start Cooking', style: context.titleL()),
              SizedBox(
                width: context.getWidth() * 0.5,
                child: Text(
                  textAlign: TextAlign.center,
                  'Let\'s join our community to cook better food!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 25,),
          GreenButton(pageRoute: LoginScreen(), setText: 'Get Started')
            ],
          ),
        ),
      ),
    );
  }
}
