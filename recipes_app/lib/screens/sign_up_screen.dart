import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_event.dart';
import '../bloc/signup_state.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
            child: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          'Welcome!',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          'Please enter your account here',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextField(
                        onChanged: (value) {
                          context.read<SignUpBloc>().add(EmailChanged(value));
                        },
                        decoration: InputDecoration(
                          labelText: 'Email or phone number',
                          errorText: state.isEmailValid || state.email.isEmpty
                              ? null
                              : 'Invalid email or phone',
                          prefixIcon: const Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      TextField(
                        onChanged: (value) {
                          context.read<SignUpBloc>().add(PasswordChanged(value));
                        },
                        obscureText: state.obscurePassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: state.isPasswordValid || state.password.isEmpty
                              ? null
                              : 'Enter your Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              context.read<SignUpBloc>().add(PasswordVisibilityToggled());
                            },
                            child: Icon(
                              state.obscurePassword ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Your password must contain:',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFDFF5E2),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.check, size: 14, color: Colors.green),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Atleast 6 characters',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.check, size: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Contain a number',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
                      const SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            if (state.isFormValid) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sign Up successful!')),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Please enter valid data')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.green),
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      //Log In
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                           },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(color: Colors.green),
                            ),
                          ),
                          child: const Text(
                            'Log In',
                            style: TextStyle(fontSize: 14, color: Colors.green),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),
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
