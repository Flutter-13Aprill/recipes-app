import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:recipe/screens/upload/bloc/upload_state.dart';

part 'upload_event.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc()
    : super(
        UploadState(
          coverImage: null,
          foodName: '',
          description: '',
          duration: 30,
        ),
      ) {
    on<ChangeImage>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(coverImage: event.image));
    });
    on<ChangeFoodName>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(foodName: event.name));
    });
    on<ChangeDescription>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(description: event.text));
    });
    on<ChangeDuration>((event, emit) {
      // TODO: implement event handler
      emit(state.copyWith(duration: event.duration));
    });
  }
}
