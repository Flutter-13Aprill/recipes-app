part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class PasswordInputStarted extends SignUpState {}

final class PasswordHasSixChar extends SignUpState {}

final class PasswordHasNumber extends SignUpState {}

final class PasswordValid extends SignUpState {}
