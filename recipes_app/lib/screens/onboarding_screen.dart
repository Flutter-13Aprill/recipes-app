import 'package:flutter/material.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/login_screen.dart';
import 'package:recipes_app/screens/sign_up_screen.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/bottom_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/Onboarding.png'),
              Text(
                'Start Cooking',
                style: Theme.of(context).textTheme.displayLarge!
                .copyWith(color:  AppColors.mainText,),
              ),
              Text(
                'Let’s join our community\nto cook better food!',
                style: Theme.of(context).textTheme.displayMedium!
                .copyWith(color:  AppColors.secondaryText,), 
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: BottomWidget(lable: 'Login', width: 0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
