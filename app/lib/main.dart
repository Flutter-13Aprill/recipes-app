import 'package:app/screen/navigation_bar/bottom_navigation_bar.dart';
import 'package:app/screen/login/login_screen.dart';
import 'package:app/screen/onboarding_screen.dart';
import 'package:app/screen/signup_screen/signup_screen.dart';
import 'package:app/screen/upload/upload_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:OnboardingScreen()
    );
  }
}
