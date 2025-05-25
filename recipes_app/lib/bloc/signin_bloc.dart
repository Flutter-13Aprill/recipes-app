import 'package:flutter_bloc/flutter_bloc.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class AuthBloc extends Bloc<SigninEvent, SigninState> {
  AuthBloc() : super(SigninStateInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(SigninStateLoading());

      if (event.emailOrPhone.isEmpty || event.password.isEmpty) {
        emit(SigninStateError("The field must not be empty."));
      } else if (event.password.length < 6) {
        emit(SigninStateError("Password must be at least 6 characters."));
      } else {
        emit(SigninStateAuthenticated());
      }
    });
  }
}
