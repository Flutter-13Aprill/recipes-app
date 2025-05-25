import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes_app/screen/auth/bloc/auth_bloc.dart';
import 'package:recipes_app/screen/auth/sign_in_screen.dart';
import 'package:recipes_app/theme/app_colors.dart';
import 'package:recipes_app/widget/auth/card/checked_characters_card.dart';
import 'package:recipes_app/widget/auth/card/checked_num_card.dart';
import 'package:recipes_app/widget/auth/card/unchecked_characters_card.dart';
import 'package:recipes_app/widget/auth/card/unchecked_num_card.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String passValue = "";
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AuthBloc>();
          return Form(
            key: bloc.formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 24),

              child: Column(
                children: [
                  TextFormField(
                    controller: bloc.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "eamil is empty";
                      } else if (!value.contains(
                        RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$',
                        ),
                      )) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Email or phone number",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff9FA5C0),
                      ),
                      contentPadding: EdgeInsets.all(3),
                      prefixIcon: Icon(
                        Icons.mark_email_unread_outlined,
                        color: AppColors.mainText,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD0DBEA)),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: bloc.passController,
                    onChanged: (value) {
                      passValue = value;
                      bloc.add(CheckCharactersPassword(value: value));
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is Empty";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters long. Please try again";
                      } else if (!value.contains(RegExp(r'\d'))) {
                        return "not Contains a number";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xff9FA5C0),
                      ),
                      contentPadding: EdgeInsets.all(3),
                      prefixIcon: Icon(
                        Icons.lock_open_outlined,
                        color: AppColors.mainText,
                      ),

                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xff9FA5C0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffD0DBEA)),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Password must contain:",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            color: Color(0xff3E5481),
                          ),
                        ),
                        SizedBox(height: 16),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            if (state is SuccessCharactersPasswordState &&
                                state is SuccessnumberPasswordState) {
                              return Column(
                                spacing: 16,
                                children: [
                                  CheckedCharactersCard(),
                                  CheckedNumCard(),
                                ],
                              );
                            } else if (state is SuccessnumberPasswordState) {
                              if (passValue.length >= 6) {
                                return Column(
                                  spacing: 16,
                                  children: [
                                    CheckedCharactersCard(),
                                    CheckedNumCard(),
                                  ],
                                );
                              }
                              return Column(
                                spacing: 16,
                                children: [
                                  UncheckedCharactersCard(),
                                  CheckedNumCard(),
                                ],
                              );
                            } else if (state
                                is SuccessCharactersPasswordState) {
                              return Column(
                                spacing: 16,
                                children: [
                                  CheckedCharactersCard(),
                                  UncheckedNumCard(),
                                ],
                              );
                            }

                            return Column(
                              spacing: 16,
                              children: [
                                UncheckedCharactersCard(),
                                UncheckedNumCard(),
                              ],
                            );
                          },
                        ),

                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 72),
                  TextButton(
                    onPressed: () {
                      if (bloc.formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      height: 56,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
