import 'package:flutter/material.dart';
import 'package:recipes_app/features/auth/screens/login_screen.dart';
import 'package:recipes_app/features/widgets/buttom_widget.dart';

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Onboarding image
            Image.asset('assets/images/Onboarding.png', fit: BoxFit.contain),
            // Onboarding title
            Text(
              'Start Cooking',
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            // Onboarding subtitle
            Text(
              'Let’s join our community to cook better food!',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),

            // Continue Button
            ButtomWidget(
              textElevatedButton: 'Get Started',
              onTab: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LogInScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
