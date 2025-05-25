import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Screen/Login_Screen.dart';
import 'package:flutter_recipes_app/Screen/Navigator_Screen.dart';
import 'package:flutter_recipes_app/Screen/bloc/authentication/authentication_bloc.dart';
import 'package:flutter_recipes_app/Screen/bloc/authentication/authentication_event.dart';
import 'package:flutter_recipes_app/Screen/bloc/authentication/authentication_state.dart';
import 'package:flutter_recipes_app/Widget/SignUp_Critria_Widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthenticationBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                final showEmailCriteria = state.emailTouched || state.submitted;
                final showPasswordCriteria =
                    state.passwordTouched || state.submitted;

                final emailBorderColor =
                    showEmailCriteria && !state.isEmailValid
                        ? Colors.red
                        : const Color(0xFFD0DBEA);
                final emailFocusColor =
                    showEmailCriteria && !state.isEmailValid
                        ? Color(0xFF3FD28B)
                        : Color(0xFF3FD28B);

                final passwordBorderColor =
                    showPasswordCriteria &&
                            (!state.hasSixCharacters || !state.hasNumber)
                        ? Colors.red
                        : const Color(0xFFD0DBEA);
                final passwordFocusColor =
                    showPasswordCriteria &&
                            (!state.hasSixCharacters || !state.hasNumber)
                        ? const Color(0xFF3FD28B)
                        : Color(0xFF3FD28B);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3E5481),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Please enter your account here',
                      style: TextStyle(fontSize: 14, color: Color(0xFF9A9DB0)),
                    ),
                    const SizedBox(height: 36),

                    Focus(
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          context.read<AuthenticationBloc>().add(FieldFocused('email'));
                        }
                      },
                      child: TextField(
                        onChanged:
                            (value) => context.read<AuthenticationBloc>().add(
                              EmailChanged(value),
                            ),
                        decoration: InputDecoration(
                          hintText: 'Email or phone number',
                          hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9FA5C0)),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Color(0xFF9A9DB0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(
                              color: emailBorderColor,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(
                              color: emailBorderColor,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide: BorderSide(
                              color: emailFocusColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (showEmailCriteria)
                      SignupCritriaWidget(
                        text: 'Valid email format OR phone number',
                        met: state.isEmailValid,
                      ),
                    const SizedBox(height: 10),

                    Focus(
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          context.read<AuthenticationBloc>().add(
                            FieldFocused('password'),
                          );
                        }
                      },
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          bool obscure = true;

                          return TextField(
                            obscureText: obscure,
                            onChanged:
                                (value) => context.read<AuthenticationBloc>().add(
                                  PasswordChanged(value),
                                ),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF9FA5C0)),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Color(0xFF9A9DB0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscure
                                      ? Icons.visibility_off_outlined
                                      // ignore: dead_code
                                      : Icons.visibility_outlined,
                                  color: const Color(0xFF9A9DB0),
                                ),
                                onPressed:
                                    () => setState(() {
                                      obscure = !obscure;
                                    }),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(
                                  color: passwordBorderColor,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(
                                  color: passwordBorderColor,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                                borderSide: BorderSide(
                                  color: passwordFocusColor,
                                  width: 2,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    if (showPasswordCriteria) ...[
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Your Password must contain:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF3E5481),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      SignupCritriaWidget(
                        text: 'At least 6 characters',
                        met: state.hasSixCharacters,
                      ),
                      const SizedBox(height: 6),
                      SignupCritriaWidget(
                        text: 'Contains a number',
                        met: state.hasNumber,
                      ),
                    ],

                    const SizedBox(height: 30),

                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthenticationBloc>().add(SignUpSubmitted());
                        if (state.isEmailValid &&
                            state.hasSixCharacters &&
                            state.hasNumber) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NavigatorScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              content: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3FD28B),
                                      Color(0xFF2BB673),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.greenAccent.withOpacity(
                                        0.4,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Signed up successfully!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3FD28B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                     const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Have an account?",
                          style: TextStyle(
                            color: Color(0xFF9A9DB0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>  LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF3FD28B),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  
                );
                
              },
            ),
          ),
        ),
      ),
    );
  }
}
