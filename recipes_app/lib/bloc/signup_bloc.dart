// sign_up_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<EmailChanged>((event, emit) {
      final isEmailValid = _validateEmailOrPhone(event.email);
      final isFormValid = isEmailValid && state.isPasswordValid;
      emit(state.copyWith(
        email: event.email,
        isEmailValid: isEmailValid,
        isFormValid: isFormValid,
      ));
    });

    on<PasswordChanged>((event, emit) {
      final isPasswordValid = _validatePassword(event.password);
      final isFormValid = isPasswordValid && state.isEmailValid;
      emit(state.copyWith(
        password: event.password,
        isPasswordValid: isPasswordValid,
        isFormValid: isFormValid,
      ));
    });

    on<PasswordVisibilityToggled>((event, emit) {
      emit(state.copyWith(obscurePassword: !state.obscurePassword));
    });
  }

  bool _validateEmailOrPhone(String input) {
    if (input.isEmpty) return false;

    // email validation
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    final phoneRegex = RegExp(r'^\+?\d{7,15}$');

    return emailRegex.hasMatch(input) || phoneRegex.hasMatch(input);
  }

  bool _validatePassword(String password) {
    if (password.length < 6) return false;
    final digitRegex = RegExp(r'\d');
    return digitRegex.hasMatch(password);
  }
}
