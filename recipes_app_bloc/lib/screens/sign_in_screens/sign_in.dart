import 'package:flutter/material.dart';
import 'package:recipes_app_bloc/screens/sign_in_screens/bloc/sign_up_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipes_app_bloc/style/color_pallete.dart';
import 'package:recipes_app_bloc/style/font_style.dart';
import 'package:recipes_app_bloc/widgets/text_form.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 190),
                  Text("Welcome Back!", style: AppTextStyle.fontStyleOne),
                  SizedBox(height: 16),
                  Text(
                    "Please enter your account here",
                    style: AppTextStyle.fontStyleThree,
                  ),
                  SizedBox(height: 48),
                  buildTextField(
                    hintText: "Email or phone number",
                    textType: "email",
                    iconName: "Message",
                    controller: emailController,
                  ),
                  SizedBox(height: 16),
                  buildTextField(
                    hintText: "Password",
                    textType: "password",
                    iconName: "Lock",
                    controller: passwordController,
                    isPassword: true,
                    onChanged:
                        (value) => context.read<SignUpBloc>().add(
                          PasswordChanged(value),
                        ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 247),
                      Text(
                        "Forget password?",
                        style: AppTextStyle.fontStyleFour,
                      ),
                    ],
                  ),
                   SizedBox(height: 16),
                   if (state is PasswordInputStarted ||
    state is PasswordHasSixChar ||
    state is PasswordHasNumber ||
    state is PasswordValid)
  Row(
    children: [
      SizedBox(width: 60),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Password must contain",
            style: AppTextStyle.fontStyleFive,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (state is PasswordHasSixChar || state is PasswordValid)
                      ? Color(0XFFE3FFF1)
                      : ColorPallete.grey,
                ),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color:  (state is PasswordHasSixChar || state is PasswordValid)
                      ? ColorPallete.green
                      : ColorPallete.bluishGrey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "At least 6 characters",
                style: TextStyle(
                  color: (state is PasswordHasSixChar || state is PasswordValid)
                      ? ColorPallete.darkBlue
                      : ColorPallete.bluishGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (state is PasswordHasNumber || state is PasswordValid)
                      ? Color(0XFFE3FFF1)
                      : ColorPallete.grey,
                ),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color:  (state is PasswordHasNumber || state is PasswordValid)
                      ? ColorPallete.green
                      : ColorPallete.bluishGrey,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "Contains a number",
                style: TextStyle(
                  color: (state is PasswordHasNumber || state is PasswordValid)
                      ? ColorPallete.darkBlue
                      : ColorPallete.bluishGrey,
                  fontWeight: FontWeight.w500,
                  fontSize:17 ,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  ),

                  SizedBox(height: 100),

                  SizedBox(
                    width: 327,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: state is PasswordValid
                    ? () {
                        Navigator.pushNamed(context, '/home');
                      }
                    : null,

                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: ColorPallete.green,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Login", style: AppTextStyle.buttonText),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
