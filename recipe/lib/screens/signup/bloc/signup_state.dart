part of 'signup_bloc.dart';

class SignUpState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool hasMinLength;
  final bool hasNumber;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isPasswordVisible;
  final String? errorMessage;

  bool get isValid => isEmailValid && hasMinLength && hasNumber;

  const SignUpState({
    required this.email,
    required this.password,
    required this.isEmailValid,
    required this.hasMinLength,
    required this.hasNumber,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isPasswordVisible = false,
    this.errorMessage,
  });

  SignUpState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? hasMinLength,
    bool? hasNumber,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isPasswordVisible,
    String? errorMessage,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasNumber: hasNumber ?? this.hasNumber,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      errorMessage: errorMessage,
    );
  }
}
