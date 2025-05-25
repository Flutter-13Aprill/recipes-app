import 'package:recipes_app/core/extensions/navigation/navigation.dart';
import 'package:recipes_app/core/extensions/screen/screen_size.dart';
import 'package:recipes_app/core/text/app_text.dart';
import 'package:recipes_app/core/theme/app_palette.dart';
import 'package:recipes_app/core/widget/custom_elevated_button.dart';
import 'package:recipes_app/features/Forget_password/page/forget_password_page.dart';
import 'package:recipes_app/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/core/widget/password_bloc/password_bloc.dart';
import 'package:recipes_app/features/auth/pages/widget/checked_rule.dart';
import 'package:recipes_app/features/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  final signupFormkey = GlobalKey<FormState>();
  final TextEditingController usernameLoginController = TextEditingController();
  final TextEditingController passwordLoginController = TextEditingController();
   final emailRegExp = RegExp(
  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
);
 final phoneRegExp = RegExp(
  r'^\d{10}$',
);
final numberRegExp = RegExp(r'\d');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordShowBloc(),
      child: Scaffold(
        backgroundColor: AppPalette.whiteColor,
        body: Padding(
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
                key: signupFormkey,
                child: Column(
                  children: [
                    CustomTextField(
                      hint: 'Email or Phone number',
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
                        }else if(!numberRegExp.hasMatch(value)){
                          return 'Password Should contain a number ';
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
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      context.push(ForgetPassword());
                    },
                    child: Text(
                      AppText.passwordcontain,
                      style: TextStyle(color: AppPalette.greydark,fontWeight: FontWeight.bold,fontSize: context.getShortest(per: 0.5)),
                    ),
                  ),
                               ),
               ),
             CheckedRule(
  text: 'At least 6 characters',
  controller: passwordLoginController,
  condtion: (value) {
    if (value!.length > 6) {
      return null;
    } else {
      return '';
    }
    
  },
),CheckedRule(
  text: 'Contains a number',
  controller: passwordLoginController,
  condtion: (value) {
    if (!numberRegExp.hasMatch(value!) ) {
      return '';
    } else {
      return null;
    }
    
  },
),

                
              SizedBox(height: 40),
              CustomElevatedButton(
                onPressed: () async {
                  if (signupFormkey.currentState!.validate()) {
                    context.replacement(SplashScreen());
                  }
                },
                text: AppText.logIn, width: context.getShortest(per: 8), height: context.getShortest(per: 1.5),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
