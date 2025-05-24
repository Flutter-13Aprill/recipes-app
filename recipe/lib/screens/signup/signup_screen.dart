import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/cusom_widget/main_buttom.dart';

import 'package:recipe/screens/main_layout_screen.dart';
import 'bloc/signup_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => SignUpBloc(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                final bloc = context.read<SignUpBloc>();

                if (state.isSuccess) {
                  Future.microtask(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => MainLayout()),
                    );
                  });
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),

                    const Center(
                      child: Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        "Please enter your account here",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    const SizedBox(height: 32),

                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => bloc.add(EmailChanged(val)),
                      decoration: InputDecoration(
                        hintText: "Email or phone number",
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: const Color(0xFFF6F6F6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: passwordController,
                      obscureText: !state.isPasswordVisible,
                      onChanged: (val) => bloc.add(PasswordChanged(val)),
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF4B5563),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xFF9CA3AF),
                          ),
                          onPressed: () => bloc.add(TogglePasswordVisibility()),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: state.password.isNotEmpty
                                ? Colors.green
                                : const Color(0xFFE5E7EB),
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: BorderSide(
                            color: state.password.isNotEmpty
                                ? Colors.green
                                : const Color(0xFFE5E7EB),
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Your Password must contain:",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(
                          state.hasMinLength
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: state.hasMinLength
                              ? Colors.green
                              : Colors.grey.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "At least 6 characters",
                          style: TextStyle(
                            color: state.hasMinLength
                                ? Colors.black
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          state.hasNumber
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: state.hasNumber
                              ? Colors.green
                              : Colors.grey.shade400,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Contains a number",
                          style: TextStyle(
                            color: state.hasNumber ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    state.isSubmitting
                        ? const CircularProgressIndicator()
                        : MainButton(
                            text: "Sign Up",
                            onPressed: state.isValid
                                ? () {
                                    bloc.add(SubmitSignUp());
                                  }
                                : null,
                          ),
                    const SizedBox(height: 12),
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
