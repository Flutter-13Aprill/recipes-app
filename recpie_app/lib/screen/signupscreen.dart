import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recpie_app/widget/custom_button.dart';
import 'package:recpie_app/widget/custom_text_field.dart';
import 'package:recpie_app/widget/main_text.dart';
import 'package:recpie_app/widget/secondary_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: MainText(text: 'Welcome!'),
          ),
          SizedBox(height: 16),
          SecondaryText(fontSize: 15, text: 'Please enter your account here'),
          SizedBox(height: 16),
          CustomTextField(
            hint: 'Email or phone number',
            svgIconPath: 'assets/icons/Message.svg',
          ),
          SizedBox(height: 16),
          CustomTextField(
            obscureText: true,
            hint: 'Password',
            svgIconPath: 'assets/icons/Lock.svg',
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: CustomButton(
              borderRadius: 32,
              text: 'Sing Up',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
