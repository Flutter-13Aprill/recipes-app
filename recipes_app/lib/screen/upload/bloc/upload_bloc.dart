import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:recipes_app/data/recipes_data.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  File? image;
  Future pickImge() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemporary = File(image.path);
    this.image = imageTemporary;
  }

  UploadBloc() : super(UploadInitial()) {
    on<UploadImgfromGallery>(uploadImgfromGalleryMethod);
    on<AddedRecipe>(addedRecipeMethod);
  }

  Future<void> uploadImgfromGalleryMethod(
    UploadImgfromGallery event,
    Emitter<UploadState> emit,
  ) async {
    await pickImge();
    emit(SuccessUploadImg(image: image!));
  }

  FutureOr<void> addedRecipeMethod(
    AddedRecipe event,
    Emitter<UploadState> emit,
  ) {
    RecipesData.recipesdata.add({
      "name": event.name,
      "description": event.description,
      "img": image,
    });
  }
}
