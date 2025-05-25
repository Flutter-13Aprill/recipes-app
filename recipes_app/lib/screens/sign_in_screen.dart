import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/signin_bloc.dart';
import '/bloc/signin_event.dart';
import '/bloc/signin_state.dart';
import 'home_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
                      child: BlocConsumer<AuthBloc, SigninState>(
                        listener: (context, state) {
                          if (state is SigninStateError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message)),
                            );
                          } else if (state is SigninStateAuthenticated) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => HomeScreen()),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  'Welcome Back!',
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

                              // Email
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email or phone number',
                                  labelStyle: const TextStyle(fontSize: 12, color: Colors.black),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Password
                              ValueListenableBuilder<bool>(
                                valueListenable: _obscurePassword,
                                builder: (context, obscure, child) {
                                  return TextField(
                                    controller: _passwordController,
                                    obscureText: obscure,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: const TextStyle(fontSize: 12, color: Colors.black),
                                      prefixIcon: const Icon(Icons.lock_outline),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          obscure ? Icons.visibility : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          _obscurePassword.value = !obscure;
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),

                              // Forgot Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                  },
                                  child: const Text(
                                    'Forgot password?',
                                    style: TextStyle(color: Colors.black, fontSize: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Login Button 
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    final email = _emailController.text.trim();
                                    final password = _passwordController.text.trim();
                                    context.read<AuthBloc>().add(
                                          SignInRequested(email, password),
                                        );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Sign Up Button
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => SignUpScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: const BorderSide(color: Colors.green),
                                    ),
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(fontSize: 14, color: Colors.green),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
