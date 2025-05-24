import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    // Text editing controllers for accessing input field values directly.
  final TextEditingController emaileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    // GlobalKey for managing the state of the form widget.
  // Used for form validation and saving.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // ValueNotifier for managing the visibility of the password.
  // This allows the UI to react to changes in password visibility.
  final ValueNotifier<bool> passwordVisible = ValueNotifier<bool>(false);
  LoginBloc() : super(const LoginState()) {  
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<EmailInputChanged>(_onEmailInputChanged);
    on<PasswordInputChanged>(_onPasswordInputChanged);
  }

 // Event handler for EmailInputChanged event.
  // Updates the validation status related to the email input.
  void _onEmailInputChanged(EmailInputChanged event, Emitter<LoginState> emit) {
    final bool isEmailNotEmpty = event.email.isNotEmpty;    // Check if the email input field is not empty.
    emit(state.copyWith(    // Emit a new state by copying the current state and updating specific properties.
      status: LoginStatus.validationUpdated, // Indicate that validation has been updated
      isEmailNotEmpty: isEmailNotEmpty, // Update email not empty status.
      showEmailRequirements: event.email.isNotEmpty,
      errorMessage: null, // Clear error message when input changes
    ));
  }

// Event handler for PasswordInputChanged event.
  // Updates the validation status related to the password input.
  void _onPasswordInputChanged(PasswordInputChanged event, Emitter<LoginState> emit) {
    final bool isPasswordLengthValid = event.password.length >= 6;    // Check if the password length is at least 6 characters.
    final bool isPasswordContainsNumber = event.password.contains(RegExp(r'[0-9]'));
    emit(state.copyWith(
      status: LoginStatus.validationUpdated, // Indicate that validation has been updated
      isPasswordLengthValid: isPasswordLengthValid,
      isPasswordContainsNumber: isPasswordContainsNumber,
      showPasswordRequirements: event.password.isNotEmpty,
      errorMessage: null, // Clear error message when input changes
    ));
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    // Re-evaluate validation to ensure latest state is used
    final bool isEmailNotEmpty = event.email.isNotEmpty;
    final bool isPasswordLengthValid = event.password.length >= 6;    // Check if the password contains at least one digit.
    final bool isPasswordContainsNumber = event.password.contains(RegExp(r'[0-9]'));    // Check if the password contains at least one digit.
    // If any validation fails, emit a failure state with updated validation info
    if (!isEmailNotEmpty || !isPasswordLengthValid || !isPasswordContainsNumber) {
      emit(state.copyWith(
        status: LoginStatus.failure,
        errorMessage: 'Please meet all input requirements.',
        isEmailNotEmpty: isEmailNotEmpty,
        isPasswordLengthValid: isPasswordLengthValid,
        isPasswordContainsNumber: isPasswordContainsNumber,
        showEmailRequirements: true, // Always show requirements on failed login attempt
        showPasswordRequirements: true, // Always show requirements on failed login attempt
      ));
      return; // Stop further processing
    }
    // If validation passes, emit a loading state to indicate that an authentication process has started.
    emit(state.copyWith(status: LoginStatus.loading, errorMessage: null));
    // Define correct login credentials for simulation purposes.
    final String correctEmail = "user@example.com";
    final String correctPassword = "password123";

    // Simulate a network request delay for authentication.
    await Future.delayed(const Duration(milliseconds: 500));

    // Check if the provided credentials match the correct ones.
    if (event.email == correctEmail && event.password == correctPassword) {
      emit(state.copyWith(status: LoginStatus.success));      // If credentials match, emit a success state.
    } else {      // If credentials do not match, emit a failure state with an error message.
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: 'Incorrect email or password.'));
    }
  }
}