import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/screens/bottomnavbar/bottom_navbar_screen.dart';
import 'package:recipes_app/screens/login/bloc/login_bloc.dart';
import 'package:recipes_app/style/app_buttons.dart';
import 'package:recipes_app/style/app_colors.dart';
import 'package:recipes_app/style/app_spacing.dart';
import 'package:recipes_app/widgets/custom_text_field_widget.dart';
import 'package:recipes_app/widgets/signup_text_widget.dart';
import 'package:recipes_app/widgets/welcome_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),

      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>();

          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WelcomeTextWidget(
                        title: "Welcome Back!",
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

                              const SizedBox(height: 16),

                              CustomTextFieldWidget(
                                controller: bloc.passController,
                                label: 'Password',
                                prefixIcon: Icons.lock_outline_rounded,
                                suffixIcon: Icons.visibility_off_outlined,
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }

                                  return null;
                                },
                              ),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Forgot password?",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: AppColors.primary),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 56),
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
                          "Login",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AppSpacing.h16,

                      SignupTextWidget(),

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
