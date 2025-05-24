import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc()
    : super(
        const SignUpState(
          email: '',
          password: '',
          isEmailValid: false,
          hasMinLength: false,
          hasNumber: false,
          isPasswordVisible: false,
        ),
      ) {
    on<EmailChanged>((event, emit) {
      final emailValid =
          RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(event.email) ||
          RegExp(r'^[0-9]{9,15}$').hasMatch(event.email);
      emit(state.copyWith(email: event.email, isEmailValid: emailValid));
    });

    on<PasswordChanged>((event, emit) {
      final pass = event.password;
      final minLen = pass.length >= 6;
      final hasNum = RegExp(r'[0-9]').hasMatch(pass);
      emit(
        state.copyWith(password: pass, hasMinLength: minLen, hasNumber: hasNum),
      );
    });

    on<TogglePasswordVisibility>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

    on<SubmitSignUp>((event, emit) async {
      if (!state.isValid) return;
      emit(state.copyWith(isSubmitting: true));
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    });
  }
}
