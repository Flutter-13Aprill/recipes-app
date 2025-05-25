part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

/// Defines events for SignupBloc.
/// Currently supports an event for when the password input changes.
class PasswordChangedEvent extends SignupEvent {
  final String password;

  PasswordChangedEvent(this.password);
}
