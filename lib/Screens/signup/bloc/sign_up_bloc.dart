import 'package:bloc/bloc.dart';
import 'package:blocrecipes/Screens/navigation/nav_bar.dart';
import 'package:blocrecipes/Screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ObscurePasswordClicked>((event, emit) {
      isPasswordVisible = !isPasswordVisible;
      emit(ObscurePasswordToggled());
    });
    on<CheckPasswordStrength>((event, emit) {
      emit(PasswordStrengthChecked());
    });
    on<SignUpButtonPressed>((event, emit) {
      if (formKey.currentState!.validate()) {
        Navigator.of(
          event.context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
        emit(SignUpSuccessful()); // Reset the state after login
      } else {
        // If the form is not valid, you might want to show an error message
        ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields correctly')),
        );
        emit(SignUpFailure());
      }
    });
  }
}
