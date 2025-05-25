import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_event.dart';
part 'password_state.dart';


class PasswordShowBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordShowBloc() : super(PasswordHidden()) {
    on<TogglePasswordShow>((event, emit) {
      if (state is PasswordHidden) {
        emit(PasswordShow());
      } else {
        emit(PasswordHidden());
      }
    });
  }
}