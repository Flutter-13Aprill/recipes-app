part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class IsShowPasswordState extends AuthState{
  final bool isShowPassword;

  IsShowPasswordState({required this.isShowPassword});
}

final class PasswordMetRequirementsState extends AuthState {
  final bool doesMeetRequirement; 
  
  PasswordMetRequirementsState({required this.doesMeetRequirement});
}

final class PasswordDoesNotMeetRequirementsState extends AuthState{
  final bool doesMeetRequirement;

  PasswordDoesNotMeetRequirementsState({required this.doesMeetRequirement});
}

final class SuccessPasswordValidation extends AuthState{
  final bool isValidPassword; 
  SuccessPasswordValidation({required this.isValidPassword});
}