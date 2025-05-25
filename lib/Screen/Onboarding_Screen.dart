import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_recipes_app/Screen/Login_Screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Enable transparent status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // 🟡 Food Images - matched to the second version
            Positioned(
              left: 48,
              top: 48,
              child: buildBubble('assets/food1.png', 88),
            ),
            Positioned(
              right: 70,
              top: 12,
              child: buildBubble('assets/food2.png', 104),
            ),
            Positioned(
              left: -20,
              top: 179,
              child: buildCenterBubble('assets/food3.png', 104, 104),
            ),
            Positioned(
              left: 124,
              top: 147,
              child: buildCenterBubble('assets/food_center.png', 160, 160),
            ),
            Positioned(
              right: -20,
              top: 147,
              child: buildCenterBubble('assets/food4.png', 72, 72),
            ),
            Positioned(
              right: 30,
              top: 259,
              child: buildBubble('assets/food5.png', 56),
            ),
            Positioned(
              left: 48,
              top: 329,
              child: buildBubble('assets/food7.png', 72),
            ),
            Positioned(
              left: 181,
              top: 330,
              child: buildBubble('assets/food6.png', 88),
            ),

            Positioned(
              top: 499,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: const [
                    Text(
                      'Start Cooking',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333366),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Let's join our community\nto cook better food!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        height: 1.58,
                        color: Color(0xFF9A9DB0),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 🟢 Get Started Button
            Positioned(
              bottom: 120,
              left: 24,
              right: 24,
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3FD28B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///  Simple Circular Image Bubble
  Widget buildBubble(String imagePath, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(2, 2),
          ),
        ],
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }

  Widget buildCenterBubble(String imagePath, double width, double height) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover)),
    );
  }
}
