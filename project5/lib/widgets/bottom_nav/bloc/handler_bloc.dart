import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';



part 'handler_event.dart';
part 'handler_state.dart';

class HandlerBloc extends Bloc<HandlerEvent, HandlerState> {
      int currentIndex = 0;
  HandlerBloc() : super(HandlerInitial()) {

    on<ClickEvent>(onClickMethod);
  }

  FutureOr<void> onClickMethod(ClickEvent event, Emitter<HandlerState> emit) {

      currentIndex = event.currentIndex;
      
    emit(SuccessState());
  
  }
}
