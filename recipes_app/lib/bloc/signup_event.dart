// sign_up_event.dart
abstract class SignUpEvent {}

class EmailChanged extends SignUpEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends SignUpEvent {
  final String password;
  PasswordChanged(this.password);
}

class PasswordVisibilityToggled extends SignUpEvent {}
