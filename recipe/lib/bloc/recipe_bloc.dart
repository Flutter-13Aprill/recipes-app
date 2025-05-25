import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:image_picker/image_picker.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<PickImageEvent>((event, emit) async {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (state is UploadState) {
        final current = state as UploadState;
        emit(
          UploadState(
            name: current.name,
            description: current.description,
            image: image,
          ),
        );
      } else {
        emit(UploadState(image: image));
      }
    });
  }
}
