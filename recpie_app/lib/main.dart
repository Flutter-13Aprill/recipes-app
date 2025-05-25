import 'package:flutter/material.dart';
import 'package:recpie_app/screen/home_screen.dart';
import 'package:recpie_app/screen/signupscreen.dart';
import 'package:recpie_app/screen/splash_screen.dart';
import 'package:recpie_app/theme/theme_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeApp.lightTheme, home: HomeScreen());
  }
}
