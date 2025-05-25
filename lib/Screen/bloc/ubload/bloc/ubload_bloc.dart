import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recipes_app/Screen/bloc/ubload/bloc/ubload_event.dart';
import 'package:flutter_recipes_app/Screen/bloc/ubload/bloc/ubload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc() : super(UploadState()) {
    on<CoverImagePicked>((event, emit) {
      emit(state.copyWith(image: event.image));
    });

    on<FoodNameChanged>((event, emit) {
      emit(state.copyWith(foodName: event.name, isValid: _validate(event.name, state.description)));
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description, isValid: _validate(state.foodName, event.description)));
    });

    on<DurationChanged>((event, emit) {
      emit(state.copyWith(duration: event.duration));
    });

    on<UploadSubmitted>((event, emit) {
      // Save data or move to next screen logic can go here
    });
  }

  bool _validate(String name, String desc) {
    return name.isNotEmpty && desc.isNotEmpty;
  }
}
