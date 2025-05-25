import 'package:flutter/material.dart';
import 'package:recipes_app/features/onboarding_screens.dart';
import 'package:recipes_app/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures proper initialization

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.defaultTheme,
      home: const OnboardingScreens(),
    );
  }
}
