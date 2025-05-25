import 'package:flutter/material.dart';
import 'package:project5/extensions/sizes.dart';
import 'package:project5/extensions/theme_text.dart';
import 'package:project5/screens/login/login_screen.dart';
import 'package:project5/screens/signup/bloc/signup_bloc.dart';
import 'package:project5/widgets/authorize_text_field.dart';
import 'package:project5/widgets/bottom_nav/bottom_nav_handler.dart';
import 'package:project5/widgets/chekc_box_signup.dart';
import 'package:project5/widgets/green_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              width: context.getWidth(),
              height: context.getHeight() * 0.65,
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  final bloc = context.read<SignupBloc>();

                  return Form(
                    key: bloc.formKey,
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Welcome!', style: context.titleL()),
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
                          onPressed: () => {bloc.add(VisibleEvent())},
                          isVisable: bloc.isVisable,
                          isPassword: true,
                          onChanged:
                              (p0) => {
                                if (p0.length >= 6)
                                  {bloc.add(CorrectLengthEvent())}
                                else
                                  {bloc.add(WrongLengthEvent())},

                                if (RegExp(r'^(?=.*\d).+$').hasMatch(p0))
                                  {bloc.add(ContainNumberEvent())}
                                else
                                  {bloc.add(DontContainNumberEvent())},
                              },

                          valid: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              bloc.correctLength = false;
                              return 'Incorrect Password';
                            } else if (!RegExp(
                              r'^(?=.*\d).+$'
                            ).hasMatch(p0) && p0.length<6) {
                              return 'Incorrect Passowrd';
                            } else {
                              return null;
                            }
                          },
                          controller: bloc.passwordController,
                          setHint: 'Password',
                          preIcon: 'assets/icons/lock.png',
                        ),
                        Container(
                          width: context.getWidth() * 0.7,
                          child: Text(
                            'Your Password must contain:',
                            textAlign: TextAlign.left,
                            style: context.bodyM()!.copyWith(
                              color: Color.fromARGB(255, 62, 84, 129),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        ChekcBoxSignup(
                          isCorrect: bloc.correctLength,
                          setText: 'Atleast 6 charcters',
                        ),
                        ChekcBoxSignup(
                          isCorrect: bloc.containNumber,
                          setText: 'Contain Number',
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
                              'Signup',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        GreenButton(pageRoute: LoginScreen(), setText: 'Login'),
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
