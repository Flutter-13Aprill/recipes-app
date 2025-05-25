abstract class AuthenticationEvent {}

class EmailChanged extends AuthenticationEvent {
  final String email;
  EmailChanged(this.email);
}

class PasswordChanged extends AuthenticationEvent {
  final String password;
  PasswordChanged(this.password);
}

class SignUpSubmitted extends AuthenticationEvent {}

class FieldFocused extends AuthenticationEvent {
  final String field;
  FieldFocused(this.field);
}
