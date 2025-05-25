import 'package:bloc/bloc.dart';
import 'package:blocrecipes/Screens/navigation/nav_bar.dart';
import 'package:blocrecipes/Screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginButtonPressed>((event, emit) {
      if (formKey.currentState!.validate()) {
        Navigator.of(
          event.context,
        ).pushReplacement(MaterialPageRoute(builder: (context) => NavBar()));
        emit(LoginSuccessful()); // Reset the state after login
      } else {
        // If the form is not valid, you might want to show an error message
        ScaffoldMessenger.of(formKey.currentContext!).showSnackBar(
          const SnackBar(content: Text('Please fill in all fields correctly')),
        );
        emit(LoginFailure());
      }
    });
    on<ObscurePasswordClicked>((event, emit) {
      isPasswordVisible = !isPasswordVisible;
      emit(ObscurePasswordToggled());
    });
  }
}
