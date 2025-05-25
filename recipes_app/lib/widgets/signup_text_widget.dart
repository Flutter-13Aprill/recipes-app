import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/screens/signup/signup_screen.dart';
import 'package:recipes_app/style/app_colors.dart';

class SignupTextWidget extends StatelessWidget {
  const SignupTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        style: TextStyle(color: AppColors.primary),
        children: [
          TextSpan(
            text: 'Sign up',
            style: TextStyle(
              color: AppColors.buttonColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
