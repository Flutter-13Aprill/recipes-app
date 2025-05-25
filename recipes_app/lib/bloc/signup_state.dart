// sign_up_state.dart
class SignUpState {
  final String email;
  final String password;
  final bool obscurePassword;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;

  SignUpState({
    this.email = '',
    this.password = '',
    this.obscurePassword = true,
    this.isEmailValid = false,
    this.isPasswordValid = false,
    this.isFormValid = false,
  });

  SignUpState copyWith({
    String? email,
    String? password,
    bool? obscurePassword,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isFormValid,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isFormValid: isFormValid ?? this.isFormValid,
    );
  }
}
