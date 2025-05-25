import 'package:flutter/material.dart';
import 'package:recipes_app/screens/intro_screen.dart';
import 'package:recipes_app/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,

      home: IntroScreen(),
    );
  }
}
