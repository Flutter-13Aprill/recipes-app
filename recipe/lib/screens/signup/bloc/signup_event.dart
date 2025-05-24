part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent {}

@immutable
class EmailChanged extends SignUpEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends SignUpEvent {
  final String password;
  PasswordChanged(this.password);
}

class TogglePasswordVisibility extends SignUpEvent {}

class SubmitSignUp extends SignUpEvent {}
