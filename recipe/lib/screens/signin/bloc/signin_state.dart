part of 'signin_bloc.dart';

@immutable
abstract class SignInState {
  final bool isPasswordVisible;
  const SignInState({required this.isPasswordVisible});
}

class SignInInitial extends SignInState {
  const SignInInitial({required super.isPasswordVisible});
}

class SignInLoading extends SignInState {
  const SignInLoading({required super.isPasswordVisible});
}

class SignInSuccess extends SignInState {
  const SignInSuccess({required super.isPasswordVisible});
}

class SignInError extends SignInState {
  final String message;
  const SignInError({required this.message, required super.isPasswordVisible});
}
