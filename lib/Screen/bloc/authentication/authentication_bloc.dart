import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState()) {
    on<EmailChanged>((event, emit) {
      final isValidEmail = _validateEmail(event.email);
      emit(state.copyWith(
        email: event.email,
        isEmailValid: isValidEmail,
      ));
    });

    on<PasswordChanged>((event, emit) {
      final hasSix = event.password.length >= 6;
      final hasNum = event.password.contains(RegExp(r'[0-9]'));
      emit(state.copyWith(
        password: event.password,
        hasSixCharacters: hasSix,
        hasNumber: hasNum,
      ));
    });

    on<FieldFocused>((event, emit) {
      if (event.field == 'email') {
        emit(state.copyWith(emailTouched: true));
      } else if (event.field == 'password') {
        emit(state.copyWith(passwordTouched: true));
      }
    });

    on<SignUpSubmitted>((event, emit) {
      emit(state.copyWith(submitted: true));
    });
  }

  bool _validateEmail(String input) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final phoneRegex = RegExp(r'^\d{10,}$');
    return emailRegex.hasMatch(input) || phoneRegex.hasMatch(input);
  }
}
