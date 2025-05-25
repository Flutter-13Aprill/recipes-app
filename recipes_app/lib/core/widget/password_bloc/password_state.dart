part of 'password_bloc.dart';

@immutable
sealed class PasswordState {}

final class PasswordInitial extends PasswordState {}


class PasswordHidden extends PasswordState {}

class PasswordShow extends PasswordState {}



