import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
 UploadBloc() : super(const UploadState()) {
  on<UpdateImage>((event, emit) {
    emit(state.copyWith(imagePath: event.imagePath));
  });

  on<UpdateTitle>((event, emit) {
    emit(state.copyWith(title: event.title));
  });

  on<UpdateDescription>((event, emit) {
    emit(state.copyWith(description: event.description));
  });

  on<UpdateDuration>((event, emit) {
    emit(state.copyWith(duration: event.duration));
  });

  on<SubmitRecipe>((event, emit) {
    print("Submitted: ${state.title}, ${state.description}, ${state.duration}, ${state.imagePath}");
  });
  
}

}
  
