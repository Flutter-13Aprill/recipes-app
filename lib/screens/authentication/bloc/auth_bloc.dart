import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  bool isPasswordMetRequirement = false;
  bool isShowPassword = false;

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<PasswordWrittenEvent>(passwordVallation);

    on<IsShowPasswordEvent>(isPasswordObscure);

  }

  FutureOr<void> passwordVallation(PasswordWrittenEvent event, Emitter<AuthState> emit) {
    final password = event.password;

    if(RegExp(r'^(?=.*\d).{6,}$').hasMatch(password)){
      isPasswordMetRequirement = true;
      emit(PasswordMetRequirementsState(doesMeetRequirement: isPasswordMetRequirement));
    }else{
      isPasswordMetRequirement = false;
      emit(PasswordDoesNotMeetRequirementsState(doesMeetRequirement: isPasswordMetRequirement));
    }
  }

  FutureOr<void> isPasswordObscure(IsShowPasswordEvent event, Emitter<AuthState> emit) {
    isShowPassword = !isShowPassword;
    emit(IsShowPasswordState(isShowPassword: isShowPassword));
  }

}
