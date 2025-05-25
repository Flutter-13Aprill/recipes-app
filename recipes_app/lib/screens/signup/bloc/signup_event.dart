part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class PasswordChangedEvent extends SignupEvent {
  final String password;

  PasswordChangedEvent(this.password);
}
