import 'package:flutter/material.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/extensions/screen_size.dart';
import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/views/signin_signup_view/signin_signup_view.dart';
import 'package:recipes_app/widgets/mainButton_widget.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // image
            Image.asset(
              width: context.getWight(),
              height: context.getHight(pre: 0.40),
              "assets/images/onBoarding/Onboarding.png",
            ),
            // StyleApp.sizeH48,
            SizedBox(
              child: Column(
                children: [
                  Text(
                    "Start Cooking",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  StyleApp.sizeH16,
                  //sub title
                  Text(
                    "Let’s join our community\n to cook better food!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textHint,
                    ),
                  ),

                  // StyleApp.sizeH48,
                ],
              ),
            ),
            MainButtonWidget(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninSignupView()),
                );
              },
              text: "Get Started",
            ),
          ],
        ),
      ),
    );
  }
}
