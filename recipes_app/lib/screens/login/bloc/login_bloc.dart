import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

// Bloc to manage login form state and events.
// Includes form key and text controllers for email and password inputs.

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passController = TextEditingController();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
  }
}
