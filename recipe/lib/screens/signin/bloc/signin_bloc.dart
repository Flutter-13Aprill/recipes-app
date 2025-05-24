import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  bool _isPasswordVisible = false;

  SignInBloc() : super(SignInInitial(isPasswordVisible: false)) {
    on<SubmitLogin>((event, emit) async {
      final isEmail = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(event.email);
      final isPhone = RegExp(r'^[0-9]{9,15}$').hasMatch(event.email);

      if (!isEmail && !isPhone) {
        emit(
          SignInError(
            message: "Enter a valid email or phone number.",
            isPasswordVisible: _isPasswordVisible,
          ),
        );
        return;
      }

      final hasMinLength = event.password.length >= 6;
      final hasNumber = RegExp(r'[0-9]').hasMatch(event.password);

      if (!hasMinLength || !hasNumber) {
        emit(
          SignInError(
            message:
                "Password must be at least 6 characters and contain a number.",
            isPasswordVisible: _isPasswordVisible,
          ),
        );
        return;
      }

      emit(SignInLoading(isPasswordVisible: _isPasswordVisible));
      await Future.delayed(const Duration(seconds: 2));
      emit(SignInSuccess(isPasswordVisible: _isPasswordVisible));
    });

    on<TogglePasswordVisibility>((event, emit) {
      _isPasswordVisible = !_isPasswordVisible;
      emit(SignInInitial(isPasswordVisible: _isPasswordVisible));
    });
  }
}
