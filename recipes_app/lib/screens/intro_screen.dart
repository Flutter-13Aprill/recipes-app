import 'package:flutter/material.dart';
import 'package:recipes_app/screens/login/login_screen.dart';
import 'package:recipes_app/style/app_buttons.dart';
import 'package:recipes_app/utils/extensions/screen/screen_size.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/Onboarding.png",
                    width: context.getWidth(factor: 1),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),

                  Text(
                    "Start Cooking",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 24),

                  Text(
                    "Let’s join our community",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  Text(
                    "to cook better food!",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: ElevatedButton(
                  style: AppButtons.primary(context),

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
