import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController eamilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisable = true;
  LoginBloc() : super(LoginInitial()) {
    on<Visable>(checkMethod);
  }

  FutureOr<void> checkMethod(Visable event, Emitter<LoginState> emit) {

    isVisable = !isVisable;

    emit(SuccessState());
  }
}
