import 'package:flutter/material.dart';

// -- Screens
import 'package:re/screens/onboarding/onboarding_screen.dart';

// -- App Theming
import 'package:re/app_theming/app_theme.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}