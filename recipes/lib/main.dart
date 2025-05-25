import 'package:flutter/material.dart';
import 'package:recipes/screens/main_navigation.dart';
import 'package:recipes/screens/enter_screens/log_in.dart';
import 'package:recipes/screens/profile.dart';
import 'package:recipes/screens/recipeListScreen.dart';
import 'package:recipes/screens/enter_screens/onbording.dart';
import 'package:recipes/screens/enter_screens/sign_up.dart';
import 'package:recipes/theems/theem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomeTheem.recipes,
      home: SignUp(),
    );
  }
}
