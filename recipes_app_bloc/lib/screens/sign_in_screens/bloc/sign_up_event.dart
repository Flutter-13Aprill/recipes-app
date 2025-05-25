part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class PasswordChanged extends SignUpEvent {
  final String password;

  PasswordChanged(this.password);
}