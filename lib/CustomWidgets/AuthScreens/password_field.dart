import 'package:blocrecipes/Helper/auth_methods.dart';
import 'package:blocrecipes/Screens/login/bloc/login_bloc.dart';
import 'package:blocrecipes/Styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  PasswordField({super.key, required this.controller, required this.hintText});
  final TextEditingController controller;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        var bloc = context.read<LoginBloc>();
        return TextFormField(
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !hasNumber(value) ||
                !isLongEnough(value)) {
              return 'Please enter your password';
            }
            // Add more validation logic if needed
            return null;
          },
          controller: controller,
          obscureText: bloc.isPasswordVisible,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(Icons.lock_outline, color: mainText),
            suffixIcon: IconButton(
              onPressed: () {
                bloc.add(ObscurePasswordClicked());
              },
              icon: Icon(
                bloc.isPasswordVisible
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: secondaryText,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: secondaryText),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: secondaryText),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        );
      },
    );
  }
}
