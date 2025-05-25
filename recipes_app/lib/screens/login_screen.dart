import 'package:flutter/material.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/screens/sign_up_screen.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/bottom_widget.dart';
import 'package:recipes_app/widgets/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static final TextEditingController usernameController =
      TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Text(
                "Welcome Back!",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(color: AppColors.mainText),
              ),
              Text(
                "Please enter your account here",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: AppColors.secondaryText,
                ),
              ),
              SizedBox(height: 16),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldWidget(
                      width: 1,
                      img: 'assets/Message.png',
                      lable: 'Please enter your account here',
                      color: Colors.transparent,
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field required';
                        } else if (value.length <= 4) {
                          return 'input too short';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFieldWidget(
                      width: 1,
                      img: 'assets/Lock.png',
                      lable: 'Password',
                      icon: Icon(
                        Icons.visibility_outlined,
                        color: AppColors.secondaryText,
                      ),
                      color: Colors.transparent,
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field required';
                        } else if (value.length < 6) {
                          return 'Input must be at least 6 characters';
                        } else if (!value.contains(RegExp(r'\d'))) {
                          return 'Input must contain at least one number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: AppColors.mainText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }
                },
                child: BottomWidget(lable: 'Login', width: 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
