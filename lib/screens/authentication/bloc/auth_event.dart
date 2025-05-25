part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class IsShowPasswordEvent extends AuthEvent{}

class PasswordWrittenEvent extends AuthEvent{
  final String password;

  PasswordWrittenEvent({required this.password});
}
