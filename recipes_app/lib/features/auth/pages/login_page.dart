import 'package:recipes_app/core/extensions/navigation/navigation.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';
import 'package:recipes_app/core/text/app_text.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/core/widget/custom_elevated_button.dart';
import 'package:recipes_app/features/Forget_password/page/forget_password_page.dart';
import 'package:recipes_app/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/widget/password_bloc/password_bloc.dart';
import 'package:recipes_app/features/auth/pages/signup_page.dart';
import 'package:recipes_app/features/navigation_controller/bottom_navigation_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginFormkey = GlobalKey<FormState>();
  final TextEditingController usernameLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
   final emailRegExp = RegExp(
  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
);
 final phoneRegExp = RegExp(
  r'^\d{10}$',
);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordShowBloc(),
      child: Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.getShortest(per: 2.5),
            ),
            child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.getShortest(per: 0.8),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Please enter your account here',
                    style: TextStyle(fontSize: context.getShortest(per: 0.43)),
                  ),
                ),
                Form(
                  key: loginFormkey,
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: 'Email or phone number',
                        lefticon: Icons.mail_outline_rounded,
                        text: AppText.userName,
                        controllers: usernameLoginController,
                        condition: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This Field is required';
                          } else if (value.length < 7) {
                            return 'should be more than 7 character ';
                          }else if (!emailRegExp.hasMatch(value)&&!phoneRegExp.hasMatch(value)) {
                      return 'Email Or Phone not correct ';
                    }
                          return null;
                        },
                      ),
                      CustomTextField(
                        hint: 'Password',
                        lefticon: Icons.lock_outline,
                        isPassword: true,
                        text: AppText.password,
                        controllers: passwordLoginController,
                        condition: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password should be more than 6 character ';
                          }
          
                          FocusScope.of(context).unfocus();
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.2)),
                   child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        context.push(ForgetPassword());
                      },
                      child: Text(
                        AppText.forgot,
                        style: TextStyle(color: AppPalette.greydark),
                      ),
                    ),
                                 ),
                 ),
                  
                SizedBox(height: 40),
                CustomElevatedButton(
                  onPressed: () async {
                    if (loginFormkey.currentState!.validate()) {
                      context.replacement(BottomNavigationController());
                    }
                  },
                  text: AppText.logIn, width: context.getShortest(per: 8), height: context.getShortest(per: 1.5),
                ),
                Padding(
                   padding:  EdgeInsets.symmetric(horizontal: context.getShortest(per: 0.2)),
                   child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        context.push(SignupPage());
                      },
                      child: Text(
                        AppText.signUp,
                        style: TextStyle(color: AppPalette.greydark),
                      ),
                    ),
                                 ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
