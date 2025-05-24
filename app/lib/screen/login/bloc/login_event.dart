 part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
// Event dispatched when the login button is pressed.
 class LoginButtonPressed extends LoginEvent {
  final String email;// The email entered by the user.
  final String password; // The password entered by the user.
  // Constructor for LoginButtonPressed event.
  LoginButtonPressed({required this.email, required this.password});
}

//  event for email input changes
class EmailInputChanged extends LoginEvent {
  final String email;// The current value of the email input field.
  EmailInputChanged({required this.email});
}

//   event for password input changes
class PasswordInputChanged extends LoginEvent {
  final String password;  // Constructor for PasswordInputChanged event.
  PasswordInputChanged({required this.password});  // Constructor for PasswordInputChanged event.

}