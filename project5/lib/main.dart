import 'package:flutter/material.dart';
import 'package:project5/screens/onboarding_screen.dart';
import 'package:project5/theme/project_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ProjectTheme.themeDefault,
      home: OnboardingScreen()
    );
  }
}
