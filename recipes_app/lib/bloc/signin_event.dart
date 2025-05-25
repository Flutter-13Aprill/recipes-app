abstract class SigninEvent {}

class SignInRequested extends SigninEvent {
  final String emailOrPhone;
  final String password;

  SignInRequested(this.emailOrPhone, this.password);
}
