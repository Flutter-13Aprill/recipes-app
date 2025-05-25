import 'package:flutter/material.dart';
import 'package:recipes_app/screens/onboarding_screen.dart';
import 'package:recipes_app/screens/profile_screen.dart';
import 'package:recipes_app/style/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomThemeApp.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
