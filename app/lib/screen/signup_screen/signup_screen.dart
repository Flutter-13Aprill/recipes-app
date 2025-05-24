import 'package:app/screen/navigation_bar/bottom_navigation_bar.dart';
import 'package:app/utils/extensions/screen/screen_size.dart';
import 'package:app/widgets/button/login_button.dart';
import 'package:app/widgets/container/line_conatiner.dart';
import 'package:app/widgets/textfeild/inpu_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/screen/login/bloc/login_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  // Helper function to build each requirement row
  // It dynamically changes icon and text color based on whether the requirement is met.
  Widget _buildRequirementRow(String text, bool isMet) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.circle_outlined,
          color: isMet ? const Color(0xff1FCC79) : const Color(0xff9FA5C0),
          size: 20.0,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            color: isMet ? Colors.black : const Color(0xff9FA5C0),
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<LoginBloc>(); //define bloc to add adn emiit
          return Scaffold(
            body: BlocListener<LoginBloc, LoginState>(
              // Only trigger when status changes (e.g., from idle to success)
              listenWhen:
                  (previous, current) => previous.status != current.status,
              listener: (context, state) {
                if (state.status == LoginStatus.success) {
                  //if validato true hide snack bar
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                        content: Text('Sinpu successful!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  //Navigat to BottomNavigationBarr
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigationBarr(),
                    ),
                  );
                }
              },
              child: SingleChildScrollView(
                child: Form(
                  //define from fr validation
                  key: bloc.formKey, //giveit key
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: context.getHight() * .1),
                      const Text(
                        "Welcome!", //display text and syle it
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: context.getHight() * .01), //space
                      const Text(
                        //
                        "Please enter your account here", //display text and syle it
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff9FA5C0),
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: context.getHight() * .01), //space
                      // Email input field with validation and requirements
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: //updae scren when spasifay requiremnts
                            (previous, current) =>
                                previous.isEmailNotEmpty !=
                                    current.isEmailNotEmpty ||
                                previous.showEmailRequirements !=
                                    current.showEmailRequirements,
                        builder: (context, state) {
                          return InpuTextfeild(
                            //custom widets
                            prefixIcon: const Icon(Icons.email),
                            hintText: "Email or phone number",
                            formFeidController: bloc.emaileController,
                            onChanged: (value) {
                              context.read<LoginBloc>().add(
                                EmailInputChanged(
                                  email: value,
                                ), //add value it to bloc
                              );
                            },
                            validator: (value) {
                              //check validation
                              if (state.showEmailRequirements &&
                                  !state.isEmailNotEmpty) {
                                return ' ';
                              }
                              return null; //no error rerun
                            },
                          );
                        },
                      ),
                      // BlocBuilder for the Password input field and its requirements.
                      // Rebuilds when password validation properties change.
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

                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(
                              //add paddin
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
                        buildWhen: //when all reauirments achive that your entered
                            (previous, current) =>
                                previous.isPasswordContainsNumber !=
                                    current.isPasswordContainsNumber ||
                                previous.isPasswordLengthValid !=
                                    current.isPasswordLengthValid ||
                                previous.showPasswordRequirements !=
                                    current.showPasswordRequirements,
                        builder: (context, state) {
                          return ValueListenableBuilder<bool>(
                            valueListenable: bloc.passwordVisible,
                            builder: (context, isPasswordVisible, child) {
                              // Rebuilds when password validation properties change.

                              return Column(
                                children: [
                                  InpuTextfeild(
                                    obscureText: !isPasswordVisible,
                                    formFeidController: bloc.passwordController,
                                    onChanged: (value) {
                                      context.read<LoginBloc>().add(
                                        PasswordInputChanged(password: value),
                                      );
                                    },
                                    // Validator for the password field.
                                    // Shows an empty error space if requirements are not met and should be shown.
                                    validator: (value) {
                                      if (state.showPasswordRequirements &&
                                          (!state.isPasswordLengthValid ||
                                              !state
                                                  .isPasswordContainsNumber)) {
                                        // Return a space to create height for the error message.
                                        return ' ';
                                      }
                                      return null; // No error.
                                    },
                                    prefixIcon: const Icon(Icons.lock_open),
                                    hintText: "Password",
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Lock icon.
                                        isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: const Color(0xff9FA5C0),
                                      ),
                                      onPressed: () {
                                        bloc
                                            .passwordVisible
                                            .value = // Toggle password visibility via ValueNotifier.
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
                                      if (!state.showPasswordRequirements) {
                                        // If password requirements should not be shown, return an empty space.
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
                                              // Header for password requirements andgive it style.
                                              "Your Password must contain:",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16.0,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            _buildRequirementRow(
                                              "Atleast 6 characters",
                                              state.isPasswordLengthValid,
                                            ),
                                            const SizedBox(height: 8.0),
                                            _buildRequirementRow(
                                              //call helper function  and give it isPasswordContainsNumber
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
                      // BlocBuilder for the Login button.
                      // Rebuilds when form validity or login status changes to enable/disable the button.
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen:
                            (previous, current) =>
                                previous.isFormValid != current.isFormValid ||
                                previous.status != current.status,
                        builder: (context, state) {
                          return LoginButton(
                            // Custom Sin up button widget.
                            title: "Sin Up",// Button text.
                            onPressed:// Button is enabled only if the form is valid and not currently loading.
                                (state.isFormValid &&
                                        state.status != LoginStatus.loading)
                                    ? () {
                                       if (bloc.formKey.currentState
                                              ?.validate() ??// Trigger form validation. If valid, dispatch the LoginButtonPressed event.
                                          false) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>//go to BottomNavigationBarr
                                                    const BottomNavigationBarr(),
                                          ), 
                                        );
                                      }
                                    }
                                    : null,
                          );
                        },
                      ),
                    SizedBox(height: context.getHight() * .54),
                      const LineConatiner(),
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
