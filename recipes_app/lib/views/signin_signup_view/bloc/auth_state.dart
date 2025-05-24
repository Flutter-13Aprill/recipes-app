part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthSacsesfluly extends AuthState{}
final class AuthError extends AuthState{}