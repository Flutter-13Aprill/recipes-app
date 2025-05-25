class AuthenticationState {
  final String email;
  final String password;
  final bool isEmailValid;
  final bool hasSixCharacters;
  final bool hasNumber;
  final bool submitted;
  final bool emailTouched;
  final bool passwordTouched;

  AuthenticationState({
    this.email = '',
    this.password = '',
    this.isEmailValid = false,
    this.hasSixCharacters = false,
    this.hasNumber = false,
    this.submitted = false,
    this.emailTouched = false,
    this.passwordTouched = false,
  });

  AuthenticationState copyWith({
    String? email,
    String? password,
    bool? isEmailValid,
    bool? hasSixCharacters,
    bool? hasNumber,
    bool? submitted,
    bool? emailTouched,
    bool? passwordTouched,
  }) {
    return AuthenticationState(
      email: email ?? this.email,
      password: password ?? this.password,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      hasSixCharacters: hasSixCharacters ?? this.hasSixCharacters,
      hasNumber: hasNumber ?? this.hasNumber,
      submitted: submitted ?? this.submitted,
      emailTouched: emailTouched ?? this.emailTouched,
      passwordTouched: passwordTouched ?? this.passwordTouched,
    );
  }
}
