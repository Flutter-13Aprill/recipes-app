import 'package:flutter/material.dart';

// -- Screens
import 'package:re/screens/bottom_nav/bottom_nav_screen.dart';

// -- Widgets 
import 'package:re/widgets/authentication/auth_text_form_filed.dart';
import 'package:re/widgets/authentication/password_validation.dart';
import 'package:re/widgets/app_custom_button.dart';

// -- BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re/screens/authentication/bloc/auth_bloc.dart';


// -- Utilities
import 'package:re/utilities/screens/screen_sizes.dart';


class SignUpScreen extends StatelessWidget {

  /// [SignUpScreen]  for user registration with email and password inputs.
  /// Uses AuthBloc to manage password visibility and validation state.
  /// Includes password strength feedback via PasswordValidation widget.
  /// Navigates to BottomNavScreen on successful sign-up.
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final FocusNode passwordFocus = FocusNode();

    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final authBloc = context.read<AuthBloc>();

          return Scaffold(
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: context.getHeight(multiplied: 0.1)),

                    Text('Welcome!',style: Theme.of(context).textTheme.titleLarge,),

                    SizedBox(height: context.getHeight(multiplied: 0.008)),

                    Text('Please enter your account here',style: Theme.of(context).textTheme.titleMedium,),

                    SizedBox(height: context.getHeight(multiplied: 0.032)),

                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          AuthTextFormFiled(
                            controller: emailController,
                            hintText: 'Email or Phone Number',
                            prefixIconPath: 'assets/authentication/Message.svg',
                          ),

                          SizedBox(height: context.getHeight(multiplied: 0.016),),

                          // -- To make the password visible or not 
                          BlocBuilder<AuthBloc, AuthState>(
                            builder: (context, state) {
                              return AuthTextFormFiled(
                                controller: passwordController,
                                focusNode: passwordFocus,
                                hintText: 'Password',
                                prefixIconPath:'assets/authentication/Lock.svg',
                                isPassword: true,
                                isShowPassword: authBloc.isShowPassword,
                                onPressed: () {
                                  authBloc.add(IsShowPasswordEvent());
                                },
                                
                                // -- To listen to the focus of textfield, if it lost its focus then the PasswordWrittenEvent will be added
                                onChanged: (value) {
                                  passwordFocus.addListener(() {
                                    authBloc.add(PasswordWrittenEvent(password: passwordController.text,),
                                    );
                                  });
                                },
                              );
                            },
                          ),

                          SizedBox(height: context.getHeight(multiplied: 0.016),),

                          PasswordValidation(authBloc: authBloc),

                          SizedBox(height: context.getHeight(multiplied: 0.024),),

                          AppCustomButton(label: 'Sign up', onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
