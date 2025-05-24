part of 'signin_bloc.dart';

@immutable
@immutable
abstract class SignInEvent {}

class SubmitLogin extends SignInEvent {
  final String email;
  final String password;

  SubmitLogin(this.email, this.password);
}

class TogglePasswordVisibility extends SignInEvent {}
