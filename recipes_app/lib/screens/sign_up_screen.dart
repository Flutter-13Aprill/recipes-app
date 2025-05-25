import 'package:flutter/material.dart';
import 'package:recipes_app/screens/bloc/password_bloc.dart';
import 'package:recipes_app/screens/bloc/password_event.dart';
import 'package:recipes_app/screens/bloc/password_state.dart';
import 'package:recipes_app/screens/home_screen.dart';
import 'package:recipes_app/style/app_color.dart';
import 'package:recipes_app/widgets/bottom_widget.dart';
import 'package:recipes_app/widgets/check_validation_widget.dart';
import 'package:recipes_app/widgets/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static final TextEditingController usernameController =
      TextEditingController();
  static final TextEditingController passwordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PasswordBloc(),
      child: Builder(
        builder: (context) {
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
                          onChanged: (value) {
                            context.read<PasswordBloc>().add(
                              PasswordChanged(value),
                            );
                          },
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
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Your Password must contain:",
                        style: Theme.of(context).textTheme.displayMedium!
                            .copyWith(color: AppColors.mainText),
                      ),
                    ],
                  ),
        
                  BlocBuilder<PasswordBloc, PasswordState>(
  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckValidationWidget(
          lable: 'Atleast 6 characters',
          icon: Icon(
            Icons.check_circle,
            color: state.hasMinLength ? Colors.green : AppColors.secondaryText,
          ),
        ),
        CheckValidationWidget(
          lable: 'Contains a number',
          icon: Icon(
            Icons.check_circle,
            color: state.hasNumber ? Colors.green : AppColors.secondaryText,
          ),
        ),
      ],
    );
  },
),
                  SizedBox(height: 8),
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
      ),
    );
  }
}
