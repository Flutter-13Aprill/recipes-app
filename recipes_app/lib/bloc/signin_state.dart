abstract class SigninState {}

class SigninStateInitial extends SigninState {}

class SigninStateLoading extends SigninState {}

class SigninStateAuthenticated extends SigninState {}

class SigninStateError extends SigninState {
  final String message;
  SigninStateError(this.message);
}
