
import 'package:flutter/material.dart';
import 'package:recipes_app/views/onBoarding/onboarding_view.dart';
// import 'package:recipes_app/views/onBoarding/onboarding_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: OnboardingView()
      home: OnboardingView(),
    );
  }
}
