import 'package:flutter/material.dart';
import 'package:recipes_app/features/auth/screens/signup_screen.dart';
import 'package:recipes_app/features/auth/widget/buttom_text.dart';
import 'package:recipes_app/features/auth/widget/title_widget.dart';
import 'package:recipes_app/features/navigation/screen/navigation_bar_screen.dart';
import 'package:recipes_app/features/widgets/buttom_widget.dart';
import 'package:recipes_app/features/widgets/text_field_widget.dart';

/// LogInScreen
/// 
/// A login form with:
/// - Email and password fields with validation
/// - "Forgot password?" and "Sign Up" options
/// - "Log In" button that navigates to the main screen on success
class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final _keyForm = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _keyForm,
              child: Builder(
                builder: (context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 16,
                    children: [
                      TitleWidget(
                        text1: 'Welcome Back!',
                        text2: 'Please enter your account here',
                      ),
                     
                      TextFieldWidget(
                        prefixIcon: Icons.mail_outline,
                        controller: emailController,
                        textHint: 'Email or phone number',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is empty';
                          } else if ((!value.contains(
                            RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                            ),
                          ))) {
                            return "Invalid Email";
                          }
                          return null;
                        },
                      ),
          
                      TextFieldWidget(
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.remove_red_eye,
                        controller: passwordController,
                        textHint: 'Password',
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "passwordRequired";
                          } else if ((!value.contains(
                            RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                            ),
                          ))) {
                            return "Invalid password";
                          }
                          return null;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ButtomText(text: 'Forgot password?'),
                      ),
               
                      ButtomWidget(
                        onTab: () {
                          if (_keyForm.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NavigationBarScreen(),
                              ),
                            );
                          }
                        },
                        textElevatedButton: 'Log In',
                      ),
                      ButtomText(
                        text: 'Sing Up',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
