import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/screens/bottomnavbar/bottom_navbar_screen.dart';
import 'package:recipes_app/screens/signup/bloc/signup_bloc.dart';
import 'package:recipes_app/style/app_buttons.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/widgets/custom_text_field_widget.dart';
import 'package:recipes_app/widgets/welcome_text_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  // SignupScreen lets users register with email/phone and password.
  // It validates input and shows password requirements dynamically.
  // On successful validation, it navigates to the main app screen.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SignupBloc>();

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WelcomeTextWidget(
                        title: "Welcome!",
                        subTitle: "Please enter your account here",
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                          horizontal: 8,
                        ),
                        child: Form(
                          key: bloc.formKey,
                          child: Column(
                            children: [
                              CustomTextFieldWidget(
                                controller: bloc.emailContrller,
                                label: 'Email or phone number',
                                prefixIcon: Icons.email_outlined,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email or phone number';
                                  }

                                  final emailRegex = RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  );
                                  final phoneRegex = RegExp(r'^05\d{8}$');

                                  if (!emailRegex.hasMatch(value) &&
                                      !phoneRegex.hasMatch(value)) {
                                    return 'Enter a valid email or phone number (05xxxxxxxx)';
                                  }

                                  return null;
                                },
                              ),

                              SizedBox(height: 16),

                              CustomTextFieldWidget(
                                controller: bloc.passController,
                                onChanged: (value) {
                                  bloc.add(PasswordChangedEvent(value));
                                },
                                label: 'Password',
                                prefixIcon: Icons.lock_outline_rounded,
                                suffixIcon: Icons.visibility_off_outlined,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }

                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }

                                  if (!RegExp(r'\d').hasMatch(value)) {
                                    return 'Password must contain at least one number';
                                  }

                                  return null;
                                },
                              ),

                              SizedBox(height: 16),
                              BlocBuilder<SignupBloc, SignupState>(
                                builder: (context, state) {
                                  if (state is SuccessState) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Your Password must contain:",
                                          style: TextStyle(
                                            color: AppColors.lightrimary,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color:
                                                  state.hasMinLength
                                                      ? AppColors.buttonColor
                                                      : AppColors
                                                          .lightSecondary,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "At least 6 characters",
                                              style: TextStyle(
                                                color:
                                                    state.hasMinLength
                                                        ? AppColors.primary
                                                        : AppColors.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color:
                                                  state.hasNumber
                                                      ? AppColors.buttonColor
                                                      : AppColors
                                                          .lightSecondary,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              "Contains a number",
                                              style: TextStyle(
                                                color:
                                                    state.hasNumber
                                                        ? AppColors.primary
                                                        : AppColors.secondary,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }

                                  return SizedBox.shrink();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 32),
                      ElevatedButton(
                        style: AppButtons.primary(context),

                        onPressed: () {
                          if (bloc.formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavbarScreen(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 72),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
