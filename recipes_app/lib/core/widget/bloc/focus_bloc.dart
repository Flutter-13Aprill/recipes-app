import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'focus_event.dart';
part 'focus_state.dart';

class FocusBloc extends Bloc<FocusEvent, FocusState> {
  FocusBloc() : super(Unfocused()) {
    on<FocusIn>((event, emit) => emit(Focused()));
    on<FocusOut>((event, emit) => emit(Unfocused()));
  }
}
