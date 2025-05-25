class PasswordState {
  final bool hasMinLength;
  final bool hasNumber;

  PasswordState({required this.hasMinLength, required this.hasNumber});

  factory PasswordState.initial() => PasswordState(hasMinLength: false, hasNumber: false);
}
