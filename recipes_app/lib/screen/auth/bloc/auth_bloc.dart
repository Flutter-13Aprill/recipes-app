import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  AuthBloc() : super(AuthInitial()) {
    on<CheckCharactersPassword>(checkCharactersPasswordMethod);
  }

  FutureOr<void> checkCharactersPasswordMethod(
    CheckCharactersPassword event,
    Emitter<AuthState> emit,
  ) {
    if (event.value.length >= 6) {
      emit(SuccessCharactersPasswordState());
    }
    if (event.value.contains(RegExp(r'\d'))) {
      emit(SuccessnumberPasswordState());
    }

    return null;
  }
}
