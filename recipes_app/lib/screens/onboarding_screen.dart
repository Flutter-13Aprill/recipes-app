import 'package:flutter/material.dart';
import 'sign_up_screen.dart'; 

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            //Stack and function to draw a circular image
            Positioned.fill(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      bottom: 400,
                      left: 90,
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: _circleImage('assets/pic/food7.png'))),
                  Positioned(
                      top: 80,
                      left: 60,
                      child: SizedBox(
                          width: 120,
                          height: 120,
                          child: _circleImage('assets/pic/food1.png'))),
                  Positioned(
                      top: 50,
                      right: 60,
                      child: SizedBox(
                          width: 140,
                          height: 120,
                          child: _circleImage('assets/pic/food2.png'))),
                  Positioned(
                      bottom: 540,
                      right: -15,
                      child: SizedBox(
                          width: 130,
                          height: 100,
                          child: _circleImage('assets/pic/food3.png'))),
                  Positioned(
                      bottom: 458,
                      left: -8,
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: _circleImage('assets/pic/food88.png'))),
                  Positioned(
                      bottom: 300,
                      left: 180,
                      child: SizedBox(
                          width: 130,
                          height: 120,
                          child: _circleImage('assets/pic/food6.png'))),
                  Positioned(
                      bottom: 400,
                      right: 10,
                      child: SizedBox(
                          width: 120,
                          height: 130,
                          child: _circleImage('assets/pic/food4.png'))),
                  Positioned(
                      bottom: 340,
                      left: 20,
                      child: SizedBox(
                          width: 112,
                          height: 100,
                          child: _circleImage('assets/pic/food5.png'))),
                ],
              ),
            ),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32.0, bottom: 60.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Start Cooking',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Let's join our community  \nto cook better food!",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text('Get Started',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleImage(String path) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image:
            DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }
}
