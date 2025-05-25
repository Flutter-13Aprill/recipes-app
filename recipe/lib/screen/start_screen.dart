import 'package:flutter/material.dart';
import 'package:recipe/screen/login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 16),
      body: Center(
        child: Column(
          children: [
            FittedBox(
              child: Image.asset(
                "assets/images/Onboarding.png",

                width: 600,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Start Cooking",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Let’s join our community\n    to cook better food!",
              style: TextStyle(fontSize: 16, color: Color(0xFF9FA5C0)),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1FCC79),
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
