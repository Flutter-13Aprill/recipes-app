import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  TextEditingController eamilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool correctLength = false;
  bool containNumber = false;
  bool isVisable = true;
  SignupBloc() : super(SignupInitial()) {
    on<CorrectLengthEvent>(correctLengthMethod);
    on<WrongLengthEvent>(wrongLengthMethod);
    on<ContainNumberEvent>(submitMethod);
    on<DontContainNumberEvent>(wrongMethod);
    on<VisibleEvent>(visibleMethod);
  }

  FutureOr<void> correctLengthMethod(
    CorrectLengthEvent event,
    Emitter<SignupState> emit,
  ) {
    correctLength = true;

    emit(SuccessState());
  }

  FutureOr<void> wrongLengthMethod(
    WrongLengthEvent event,
    Emitter<SignupState> emit,
  ) {
    correctLength = false;
    emit(ErrorState());
  }

  FutureOr<void> submitMethod(
    ContainNumberEvent event,
    Emitter<SignupState> emit,
  ) {
    containNumber = true;
    emit(SuccessState());
  }

  FutureOr<void> wrongMethod(
    DontContainNumberEvent event,
    Emitter<SignupState> emit,
  ) {
    containNumber = false;
    emit(ErrorState());
  }

  FutureOr<void> visibleMethod(VisibleEvent event, Emitter<SignupState> emit) {
    isVisable = !isVisable;
    emit(SuccessState());
  }
}
