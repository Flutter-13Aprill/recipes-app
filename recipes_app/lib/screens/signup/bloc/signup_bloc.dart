import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

// Bloc to manage signup form state and validation.
// Tracks password input and emits validation results (minimum length and number presence).

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passController = TextEditingController();
  SignupBloc() : super(SignupInitial()) {
    on<PasswordChangedEvent>((event, emit) {
      final pwd = event.password;

      final bool hasMinLength = pwd.length >= 6;
      final bool hasNumber = RegExp(r'\d').hasMatch(pwd);

      emit(
        SuccessState(
          password: pwd,
          hasMinLength: hasMinLength,
          hasNumber: hasNumber,
        ),
      );
    });
  }
}
