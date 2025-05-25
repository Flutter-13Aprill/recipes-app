import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {

  SignUpBloc() : super(SignUpInitial()) {
    on<PasswordChanged>((event, emit) {
      final password = event.password;

      if(password.isEmpty){
        emit(PasswordInputStarted());
      }
      if (password.length >= 6 && !RegExp(r'\d').hasMatch(password)){
        emit(PasswordHasSixChar());
      }
      if (RegExp(r'\d').hasMatch(password) && password.length < 6){
        emit(PasswordHasNumber());
      }
      if(password.length >= 6 && RegExp(r'\d').hasMatch(password)){
 emit(PasswordValid());
      }
     
    });
  }
}
