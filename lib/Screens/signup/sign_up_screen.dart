import 'package:blocrecipes/CustomWidgets/AuthScreens/email_field.dart';
import 'package:blocrecipes/CustomWidgets/AuthScreens/signup_password_field.dart';
import 'package:blocrecipes/Helper/auth_methods.dart';
import 'package:blocrecipes/Helper/screen_extension.dart';
import 'package:blocrecipes/Screens/signup/bloc/sign_up_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                final bloc = context.read<SignUpBloc>();
                final password = bloc.passwordController.text;
                final isLong = isLongEnough(password);
                final hasNum = hasNumber(password);

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
                              'Create Account',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: mainText,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Sign up to get started',
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
                      BlocProvider<SignUpBloc>.value(
                        value: bloc,
                        child: SignupPasswordField(
                          controller: bloc.passwordController,
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      Text(
                        "Your password must contain:",
                        style: TextStyle(color: mainText, fontSize: 14),
                      ),
                      SizedBox(height: context.screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline_outlined,
                            color: isLong ? primaryColor : secondaryText,
                          ),
                          Text(
                            "At least 6 characters",
                            style: TextStyle(color: secondaryText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline_outlined,
                            color: hasNum ? primaryColor : secondaryText,
                          ),
                          Text(
                            "A number",
                            style: TextStyle(color: secondaryText),
                          ),
                        ],
                      ),
                      SizedBox(height: context.screenHeight * 0.02),
                      SizedBox(
                        width: double.infinity,
                        height: context.screenHeight * 0.06,
                        child: ElevatedButton(
                          onPressed: () {
                            bloc.add(SignUpButtonPressed(context));
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'Already have an account? Login',
                            style: TextStyle(color: primaryColor, fontSize: 14),
                          ),
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
