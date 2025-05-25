import 'package:flutter/material.dart';
import 'package:recipes/exstenshon/exstenshon.dart';
import 'package:recipes/screens/enter_screens/log_in.dart';
import 'package:recipes/widget/button_one.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/Onboarding.png", width: context.getWidth()),
          Text("Start Cooking"),
          SizedBox(height: 12),
          Text("Let’s join our community \n to cook better food!"),
          SizedBox(height: 30),
          ButtonOne(
            text: "Get Started",
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                ),
          ),
         
        ],
      ),
    );
  }
}
