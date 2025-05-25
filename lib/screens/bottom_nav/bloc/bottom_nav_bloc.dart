import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {

  int currentIndex = 0;

  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeScreenEvent>(chnageScreen);
  }

  FutureOr<void> chnageScreen(ChangeScreenEvent event, Emitter<BottomNavState> emit) {
    currentIndex = event.index;

    // This emit is not using but in case if someone want to reach they can find it 
    emit(SuccessChangingScreenState(index: currentIndex)); 
  }
}
