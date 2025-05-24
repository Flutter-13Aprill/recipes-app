import 'package:app/screen/navigation_bar/bottom_navigation_bar.dart';
import 'package:app/screen/signup_screen/signup_screen.dart';
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:app/widgets/button/login_button.dart';
import 'package:app/widgets/container/line_conatiner.dart';
import 'package:app/widgets/textfeild/inpu_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/screen/login/bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Helper function to build a single requirement row for email/password validation.
  // It dynamically changes icon and text color based on whether the requirement is met.
  Widget _buildRequirementRow(String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet
              ? Icons.check_circle
              : Icons
                  .circle_outlined, // Checkmark icon if met, circle outline if not.
          color:
              isMet
                  ? const Color(0xff1FCC79)
                  : const Color(0xff9FA5C0), // Green for met, grey for not.
          size: 20.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            color:
                isMet
                    ? Colors.black
                    : const Color(0xff9FA5C0), // Black for met, grey for not.
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // BlocProvider provides the LoginBloc to its descendants in the widget tree.
      create: (context) => LoginBloc(), // Create an instance of LoginBloc.
      child: Builder(
        // Builder widget to get a new BuildContext that has access to the Bloc
        builder: (context) {
          final bloc =
              context
                  .read<
                    LoginBloc
                  >(); // Access the LoginBloc instance using `context.read`.
          return Scaffold(
            // BlocListener listens for state changes in LoginBloc and performs actions (e.g., navigation, SnackBar).
            // `listenWhen` ensures the listener only triggers when the 'status' changes
            body: BlocListener<LoginBloc, LoginState>(
              listenWhen:
                  (previous, current) => previous.status != current.status,
              listener: (context, state) {
                if (state.status == LoginStatus.success) {
                  // If login is successful.
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar() // Hide any current snack bar and show a success message.
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Login successful!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  Navigator.pushReplacement(
                    // Navigate to the BottomNavigationBarr screen upon successful login,
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigationBarr(),
                    ),
                  );
                }
              },
              child: SingleChildScrollView(
                // SingleChildScrollView allows the content to be scrollable if it exceeds screen height.z
                child: Form(
                  // Form widget for handling form validation.
                  key:
                      bloc.formKey, // Associate the form with the GlobalKey from the Bloc
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center, // Center children horizontally.
                    children: [
                      SizedBox(height: context.getHight() * .1), // Top spacing.
                      const Text(
                        "Welcome Back!", // Welcome message.
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.getHight() * .01), // Spacing
                      const Text(
                        "Please enter your account here", // Subtitle text.
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff9FA5C0),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: context.getHight() * .01), // Spacing
                      BlocBuilder<LoginBloc, LoginState>(
                        // BlocBuilder for the Email input field.
                        buildWhen: // It rebuilds only when email-related validation state changes.
                            (previous, current) =>
                                previous.isEmailNotEmpty !=
                                    current.isEmailNotEmpty ||
                                previous.showEmailRequirements !=
                                    current.showEmailRequirements,
                        builder: (context, state) {
                          return InpuTextfeild(
                            // Custom text field for email.
                            prefixIcon: const Icon(Icons.email),
                            hintText: "Email or phone number",
                            formFeidController: bloc.emaileController,
                            onChanged: (value) {
                              context.read<LoginBloc>().add(
                                // Dispatch EmailInputChanged event whenever the email input changes.
                                EmailInputChanged(email: value),
                              );
                            },
                            validator: (value) {
                              // Validator for the email field.
                              // Shows an empty error space if requirements are not met and should be shown.
                              if (state.showEmailRequirements &&
                                  !state.isEmailNotEmpty) {
                                return ' '; // Return a space to create height for the error message.
                              }
                              return null; // No error.
                            },
                          );
                        },
                      ),
                      // BlocBuilder for displaying email requirements.
                      // Only rebuilds when email requirements visibility or status changes.
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen:
                            (previous, current) =>
                                previous.showEmailRequirements !=
                                    current.showEmailRequirements ||
                                previous.isEmailNotEmpty !=
                                    current.isEmailNotEmpty,
                        builder: (context, state) {
                          if (!state.showEmailRequirements) {
                            // If email requirements should not be shown, return an empty space.
                            return const SizedBox.shrink(); //not take a space
                          }
                          return Padding(
                            //add paddin
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              top: 10.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildRequirementRow(
                                  // Header for password requirements.
                                  "Email should not be empty",
                                  state.isEmailNotEmpty,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 19),

                      // BlocBuilder for the Password input field and its requirements.
                      // Rebuilds when password validation properties change.
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen:
                            (previous, current) =>
                                previous.isPasswordContainsNumber !=
                                    current.isPasswordContainsNumber ||
                                previous.isPasswordLengthValid !=
                                    current.isPasswordLengthValid ||
                                previous.showPasswordRequirements !=
                                    current.showPasswordRequirements,
                        builder: (context, state) {
                          return ValueListenableBuilder<bool>(
                            valueListenable:
                                bloc.passwordVisible, // BlocBuilder for the Password input field and its requirements.
                            // Rebuilds when password validation properties change.
                            builder: (context, isPasswordVisible, child) {
                              return Column(
                                children: [
                                  InpuTextfeild(
                                    // Custom text field for password.
                                    obscureText:
                                        !isPasswordVisible, // Obscure text if password is not visible.
                                    formFeidController:
                                        bloc.passwordController, // Controller from Bloc.
                                    onChanged: (value) {
                                      // Dispatch PasswordInputChanged event whenever password input changes.
                                      context.read<LoginBloc>().add(
                                        PasswordInputChanged(password: value),
                                      );
                                    },
                                    validator: (value) {
                                      // Validator for the password field.
                                      // Shows an empty error space if requirements are not met and should be shown.
                                      if (state.showPasswordRequirements &&
                                          (!state.isPasswordLengthValid ||
                                              !state
                                                  .isPasswordContainsNumber)) {
                                        return ' '; // Return a space to create height for the error message.
                                      }
                                      return null; // No error.
                                    },
                                    prefixIcon: const Icon(
                                      Icons.lock_open,
                                    ), // Lock icon.
                                    hintText: "Password", // No error.
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off, // Eye icon.
                                        color: const Color(0xff9FA5C0),
                                      ),
                                      onPressed: () {
                                        // Toggle password visibility via ValueNotifier.

                                        bloc.passwordVisible.value =
                                            !bloc.passwordVisible.value;
                                      },
                                    ),
                                  ),

                                  // BlocBuilder for displaying password requirements.
                                  // Only rebuilds when password requirements visibility or status changes.
                                  BlocBuilder<LoginBloc, LoginState>(
                                    buildWhen:
                                        (previous, current) =>
                                            previous.showPasswordRequirements !=
                                                current
                                                    .showPasswordRequirements ||
                                            previous.isPasswordLengthValid !=
                                                current.isPasswordLengthValid ||
                                            previous.isPasswordContainsNumber !=
                                                current
                                                    .isPasswordContainsNumber,
                                    builder: (context, state) {
                                      // If password requirements should not be shown, return an empty space.
                                      if (!state.showPasswordRequirements) {
                                        return const SizedBox.shrink();
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                          right: 16.0,
                                          top: 10.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Your Password must contain:", // Header for password requirements.
                                              style: TextStyle(
                                                //style for text
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            _buildRequirementRow(
                                              //call helper function
                                              "Atleast 6 characters",
                                              state
                                                  .isPasswordLengthValid, //give it isPasswordLengthValid
                                            ),
                                            const SizedBox(height: 8.0),
                                            _buildRequirementRow(
                                              "Contains a number",
                                              state.isPasswordContainsNumber,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      Align(
                        //textbutton to Navigat SignupScreen and give it style
                        alignment: const Alignment(0.8, 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Forgot password?",
                            style: TextStyle(color: Color(0xff3E5481)),
                          ),
                        ),
                      ),
                      // BlocBuilder for the Login button.
                      // Rebuilds when form validity or login status changes to enable/disable the button.
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen:
                            (previous, current) =>
                                previous.isFormValid != current.isFormValid ||
                                previous.status != current.status,
                        builder: (context, state) {
                          return LoginButton(
                            // Custom login button widget.
                            title: "Login", // Button text.
                            onPressed: // Button is enabled only if the form is valid and not currently loading.
                                (state.isFormValid &&
                                        state.status != LoginStatus.loading)
                                    ? () {
                                      if (bloc.formKey.currentState
                                              ?.validate() ?? // Trigger form validation. If valid, dispatch the LoginButtonPressed event.
                                          false) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            //go to BottomNavigationBarr
                                            builder:
                                                (context) =>
                                                    const BottomNavigationBarr(),
                                          ),
                                        );
                                      }
                                    }
                                    : null,
                          );
                        },
                      ),
                      SizedBox(height: context.getHight() * .48),
                      const LineConatiner(),//cutom widgets
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
