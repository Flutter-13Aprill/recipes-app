import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

part 'checked_event.dart';
part 'checked_state.dart';
String value ='';
class CheckedBloc extends Bloc<CheckedEvent, CheckedState> {
  CheckedBloc() : super(CheckedInitial()) {
    on<CheckedEvent>((event, emit) {
      
    });
  
  
    on<CheckRuleEvent>((event, emit) {
 value = event.controller.text;
  final result = event.condition(value);

  if (result == null) {
    emit(TrueState());
  } else {
    emit(FalseState());
  }
     
    });
  }
}
