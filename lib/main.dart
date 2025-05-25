import 'package:flutter/material.dart';
import 'package:flutter_recipes_app/Provider/Recipe_Provider%20.dart';

import 'package:flutter_recipes_app/Screen/Onboarding_Screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RecipeProvider(),
      child:  MainApp(),
    ),
  );
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}
