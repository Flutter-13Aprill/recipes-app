part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckCharactersPassword extends AuthEvent {
  final String value;

  CheckCharactersPassword({required this.value});
}
