import 'package:blocrecipes/CustomWidgets/AuthScreens/email_field.dart';
import 'package:blocrecipes/CustomWidgets/AuthScreens/password_field.dart';
import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Screens/login/bloc/login_bloc.dart';
import 'package:blocrecipes/Screens/signup/sign_up_screen.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Assume you have a LoginBloc that exposes emailController, passwordController, and a login() method

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                var bloc = context.read<LoginBloc>();
                return Form(
                  key: bloc.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 48),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: mainText,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Please enter your account here',
                              style: TextStyle(
                                fontSize: 16,
                                color: secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      EmailField(
                        controller: bloc.emailController,
                        hintText: 'Email or phone number',
                      ),
                      const SizedBox(height: 16),
                      BlocProvider<LoginBloc>.value(
                        value: bloc,
                        child: PasswordField(
                          controller: bloc.passwordController,
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(color: mainText, fontSize: 14),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: context.screenHeight * 0.06,
                        child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed: () {
                            bloc.add(LoginButtonPressed(context: context));
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
                      RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(color: secondaryText, fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'Sign Up',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to Sign Up screen
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => SignUpScreen(),
                                        ),
                                      );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
