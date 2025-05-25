import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/sign_up_screen.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  OnboardingScreen(),
        '/signup': (_) =>  SignUpScreen(),
        '/signin': (context) => SignInScreen(),
      },
    );
  }
}

