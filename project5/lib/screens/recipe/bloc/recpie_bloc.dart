import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project5/models/recpies_model.dart';

part 'recpie_event.dart';
part 'recpie_state.dart';

class RecpieBloc extends Bloc<RecpieEvent, RecpieState> {
  double sliderIndex = 0;
  List<Widget> list = [];
  RecpieBloc() : super(RecpieInitial()) {
    on<SliderEvnt>(sliderMethod);
    on<AddEvent>(addEvent);
  }

  FutureOr<void> sliderMethod(SliderEvnt event, Emitter<RecpieState> emit) {
    sliderIndex = event.index;

    emit(SuccessState());
  }

  FutureOr<void> addEvent(AddEvent event, Emitter<RecpieState> emit) {

  list.add(event.recpie);
    print(list);
    emit(NewRecpie(recpies: list));

  }
}
