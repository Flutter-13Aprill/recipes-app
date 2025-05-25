import 'package:flutter/material.dart';

// -- Screens
import 'package:re/screens/authentication/sign_in_screen.dart';

// -- Widgets
import 'package:re/widgets/app_custom_button.dart';

// -- Utilities
import 'package:re/utilities/screens/screen_sizes.dart';


class OnboardingScreen extends StatelessWidget {

  /// [OnboardingScreen] introduces users to the app with a welcoming image and message.
  /// Provides a 'Get Started' button to navigate to the SignInScreen.
  /// Uses responsive sizing for layout and spacing.
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: context.getWidth(),
          child: Column(
            children: [
              Container(
                width: context.getWidth(),
                child: Image.asset('assets/onboarding/Onboarding.png', fit: BoxFit.cover,)
              ),

              SizedBox(height: context.getHeight(multiplied: 0.04)),

              Text('Start Cooking', style: Theme.of(context).textTheme.titleLarge,),

              SizedBox(height: context.getHeight(multiplied: 0.016)),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: context.getWidth(multiplied: 0.7),
                  maxHeight: context.getHeight(multiplied: 0.1),
                ),
                child: Text('Let’s join our community to cook better food!', textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),
              ),

              Spacer(),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: AppCustomButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen())),
                  label: 'Get Started'
                ),
              ),

              SizedBox(height: context.getHeight(multiplied: 0.032),)
            ],
          ),
        ),
      ),
    );
  }
}