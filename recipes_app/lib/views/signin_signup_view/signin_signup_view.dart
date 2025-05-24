import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/Theme/app_colors.dart';
import 'package:recipes_app/style/my_style.dart';
import 'package:recipes_app/views/layout/layout_view.dart';
import 'package:recipes_app/views/signin_signup_view/bloc/auth_bloc.dart';
import 'package:recipes_app/widgets/auth/text_filed_auth_widget.dart';
import 'package:recipes_app/widgets/mainButton_widget.dart';

class SigninSignupView extends StatelessWidget {
  SigninSignupView({super.key, this.isSignin = true});
  final bool isSignin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocProvider(
          create: (context) => AuthBloc(),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final bloc = context.read<AuthBloc>();
                  return SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StyleApp.sizeH107,
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        StyleApp.sizeH8,

                        Text(
                          "Please enter your account here",
                          style: TextStyle(
                            color: AppColors.textHint,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 42),
                        Form(
                          key: bloc.formKey,
                          child: Column(
                            children: [
                              TextFiledAuthWidget(
                                validator: bloc.validatorEmail,
                                onChange: (p0) {
                                  bloc.email;
                                  bloc.add(Validate());
                                },
                                hintText: "Email or phone number",
                                prefixIcon: Icons.email_outlined,
                              ),

                              SizedBox(height: 32),
                              TextFiledAuthWidget(
                                validator: bloc.validatorPassword,
                                onChange: (p0) {
                                  bloc.password;
                                  bloc.add(Validate());
                                },
                                hintText: "Enter your password",
                                prefixIcon: Icons.lock_outline,
                                obscureText: true,
                                suffixIcon: Icons.remove_red_eye,
                              ),

                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 32),
                              if (state is AuthError)
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    bloc.errors.join('\n'),
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),

                              SizedBox(height: 32),
                              MainButtonWidget(
                                onTap: () {
                                  if (bloc.isValid!) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            LayoutView(),
                                      ),
                                    );
                                  }
                                },
                                text: isSignin ? "Sign in" : "Sign Up",
                              ),
                              isSignin
                                  ? TextButton(
                                      child: Text(
                                        "signup",
                                        style: TextStyle(
                                          color: AppColors.textHint,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SigninSignupView(
                                                  isSignin: false,
                                                ),
                                          ),
                                        );
                                      },
                                    )
                                  : Text(""),
                              // TextButton(
                              //   child: Text(
                              //     "Skip for testing",
                              //     style: TextStyle(
                              //       color: AppColors.textHint,
                              //       fontSize: 14,
                              //       fontWeight: FontWeight.bold,
                              //     ),
                              //   ),
                              //   onPressed: () {
                              //     Navigator.pushReplacement(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => LayoutView(),
                              //       ),
                              //     );
                              //   },
                              // ),
                              // SizedBox(height: 32),
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
      ),
    );
  }
}
