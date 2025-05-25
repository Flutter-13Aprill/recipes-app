import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  // bool isobscure = true;
  RecipesBloc() : super(RecipesInitial()) {
    on<passwordvisibility>(passwordvisibilitybloc);
    on<passwordchange>(onpasswordchange);
  }

  FutureOr<void> passwordvisibilitybloc(
    passwordvisibility event,
    Emitter<RecipesState> emit,
  ) {
    final newvalue = !event.isobscure;

    emit(visavilstate(obscureText: newvalue));
  }

  FutureOr<void> onpasswordchange(
    passwordchange event,
    Emitter<RecipesState> emit,
  ) {
    final password = event.password;
    final bool hasminlength = password.length >= 6;
    final bool hasnumber = password.contains(RegExp(r'[0-9]'));
    emit(
      Passwordvalidatestate(hasminlength: hasminlength, hasnumber: hasnumber),
    );
  }
}
