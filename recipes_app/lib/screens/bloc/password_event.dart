abstract class PasswordEvent {}

class PasswordChanged extends PasswordEvent {
  final String password;
  PasswordChanged(this.password);
}
