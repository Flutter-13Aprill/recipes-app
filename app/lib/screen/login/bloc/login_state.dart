part of 'login_bloc.dart';

// Enum to represent the different possible statuses of the login process.
enum LoginStatus {
  initial,// Enum to represent the different possible statuses of the login process.
  loading, // The state when a login attempt is in progress.
  success,// The state when login is successful.
  failure,// The state when a login attempt fails.
  validationUpdated, // A specific status for when only validation changes
}
//class representing the overall state of the Login feature.
@immutable
class LoginState {
  final LoginStatus status; // The current status of the login process.
  final bool isEmailNotEmpty; // Indicates if the email input field is not empty.
  final bool isPasswordLengthValid; // Indicates if the password meets the minimum length requirement.
  final bool isPasswordContainsNumber;// Indicates if the password contains at least one number.
  final bool showEmailRequirements;// Indicates if the password contains at least one number.
  final bool showPasswordRequirements; // Controls whether to display password validation requirements in the UI.
  final String? errorMessage;  // Optional string to hold an error message for failed login attempts or validation issues.

  // Constructor for the LoginState.
  // All properties have default values to ensure a consistent initial state.
  const LoginState({
    this.status = LoginStatus.initial,
    this.isEmailNotEmpty = false,
    this.isPasswordLengthValid = false,
    this.isPasswordContainsNumber = false,
    this.showEmailRequirements = false,
    this.showPasswordRequirements = false,
    this.errorMessage,
  });
  // Getter to easily check if the entire form is valid based on all current validation rules.

  bool get isFormValid => isEmailNotEmpty && isPasswordLengthValid && isPasswordContainsNumber;

  // copyWith method to create a new LoginState instance with updated values. 
// Optional new values.
  LoginState copyWith({
    LoginStatus? status,
    bool? isEmailNotEmpty,
    bool? isPasswordLengthValid,
    bool? isPasswordContainsNumber,
    bool? showEmailRequirements,
    bool? showPasswordRequirements,
    String? errorMessage,
  }) {
    return LoginState( // Use new values if provided, otherwise retain current.
      status: status ?? this.status,
      isEmailNotEmpty: isEmailNotEmpty ?? this.isEmailNotEmpty,
      isPasswordLengthValid: isPasswordLengthValid ?? this.isPasswordLengthValid,
      isPasswordContainsNumber: isPasswordContainsNumber ?? this.isPasswordContainsNumber,
      showEmailRequirements: showEmailRequirements ?? this.showEmailRequirements,
      showPasswordRequirements: showPasswordRequirements ?? this.showPasswordRequirements,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}