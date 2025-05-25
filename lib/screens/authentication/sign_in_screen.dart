import 'package:flutter/material.dart';

// -- Screen
import 'package:re/screens/authentication/sign_up_screen.dart';

// -- Widgets 
import 'package:re/widgets/app_custom_button.dart';
import 'package:re/widgets/authentication/auth_text_form_filed.dart';

// -- BLoC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re/screens/authentication/bloc/auth_bloc.dart';

// -- Utilities
import 'package:re/utilities/screens/screen_sizes.dart';


class SignInScreen extends StatelessWidget {

    /// [SignInScreen]  provides the UI for user sign-in.
    /// 
    /// It includes a form with email/phone and password input fields. Password visibility is controlled via a BLoC (AuthBloc) that toggles the show/hide password state.
    /// 
    /// The screen also contains navigation to the SignUpScreen and a placeholder for the sign-in button action. 
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    

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

                    Text('Welcome Back!',style: Theme.of(context).textTheme.titleLarge,),

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
                                hintText: 'Password',
                                prefixIconPath:'assets/authentication/Lock.svg',
                                isPassword: true,
                                isShowPassword: authBloc.isShowPassword,
                                onPressed: () { authBloc.add(IsShowPasswordEvent());},
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: context.getHeight(multiplied: 0.024)),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forget Your Password ?',style: Theme.of(context).textTheme.displaySmall,),
                    ),

                    SizedBox(height: context.getHeight(multiplied: 0.072)),

                    AppCustomButton(
                      onPressed: () {},
                      label: 'Sign in',
                    ),

                    SizedBox(height: context.getHeight(multiplied: 0.032)),

                    InkWell(
                      onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => SignUpScreen(),),),
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account yet? ',
                          style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w600,),
                          children: [
                            TextSpan(
                              text: 'Sign up',
                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black,),
                            ),
                          ],
                        ),
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
