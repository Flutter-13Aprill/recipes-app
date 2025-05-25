import 'package:flutter_bloc/flutter_bloc.dart';
import 'password_event.dart';
import 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordState.initial()) {
    on<PasswordChanged>((event, emit) {
      final password = event.password;
      final hasMinLength = password.length >= 6;
      final hasNumber = RegExp(r'\d').hasMatch(password);

      emit(PasswordState(hasMinLength: hasMinLength, hasNumber: hasNumber));
    });
  }
}
