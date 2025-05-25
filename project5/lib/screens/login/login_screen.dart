import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/screens/login/bloc/login_bloc.dart';
import 'package:project5/screens/signup/signup_screen.dart';
import 'package:project5/widgets/authorize_text_field.dart';
import 'package:project5/widgets/bottom_nav/bottom_nav_handler.dart';
import 'package:project5/widgets/green_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: context.getWidth(),
              height: context.getHeight() * 0.55,
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  final bloc = context.read<LoginBloc>();
                  return Form(
                    key: bloc.formKey,
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Welcome Back!', style: context.titleL()),
                        Text(
                          'Please enter your account here',
                          style: context.bodyM(),
                        ),
                        AuthorizeTextField(
                          valid: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Please Enter Your Email';
                              //input is an eamil
                            } else if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                            ).hasMatch(p0)) {
                              return 'Please Enter A Valid Email';
                            } else {
                              return null;
                            }
                          },
                          controller: bloc.eamilController,
                          isPassword: false,
                          setHint: 'Email',
                          preIcon: 'assets/icons/message.png',
                        ),
                        AuthorizeTextField(
                          valid: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Empty Password';
                            } else if (!RegExp(
                              r'^(?=.*\d).+$'
                            ).hasMatch(p0) || p0.length<6) {
                              return 'Incorrect Passowrd';
                            } else {
                              return null;
                            }
                          },
                          controller: bloc.passwordController,
                          onPressed: () => {
                            bloc.add(Visable())
                          },
                          isVisable: bloc.isVisable,
                          isPassword: true,
                          setHint: 'Password',
                          preIcon: 'assets/icons/lock.png',
                        ),
                        Container(
                          width: context.getWidth() * 0.90,
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.right,
                            style: context.bodyM()!.copyWith(
                              color: Color.fromARGB(255, 62, 84, 129),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),

                        Container(
                          width: context.getWidth() * 0.76,
                          height: context.getHeight() * 0.058,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Color.fromARGB(255, 31, 204, 121),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if (bloc.formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BottomNavHandler(),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GreenButton(
                          pageRoute: SignupScreen(),
                          setText: 'SignUp',
                        ),
                      ],
                    ),
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
