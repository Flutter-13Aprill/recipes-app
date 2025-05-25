part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
// SuccessState state reflecting current password and validation results.

class SuccessState extends SignupState {
  final String password;
  final bool hasMinLength;
  final bool hasNumber;

  SuccessState({
    this.password = '',
    this.hasMinLength = false,
    this.hasNumber = false,
  });
}
