import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blocrecipes/Models/recipe.dart';
import 'package:blocrecipes/Repo/data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descController = TextEditingController();
  double sliderValue = 0.0;
  FileImage? file;
  UploadBloc() : super(UploadInitial()) {
    on<UploadEvent>((event, emit) {});
    on<SliderClicked>((event, emit) {
      sliderValue = event.value;
      emit(SliderChanged());
    });
    on<PickImageEvent>((event, emit) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      file = pickedFile != null ? FileImage(File(pickedFile.path)) : null;
      if (pickedFile != null) {
        emit(UploadInProgress());
      }
    });
    on<SubmitRecipe>((event, emit) {
      if (formKey.currentState!.validate()) {
        Recipe recipe = Recipe(
          duration: '${(sliderValue * 60).toStringAsFixed(0)} min',
          foodImage: file,
          foodName: nameController.text.trim(),
          profileImagePath: recipes[0].profileImagePath,
          userName: recipes[0].userName,
          isFromFile: true,
        );
        uploaded.add(recipe);
        nameController.clear();
        descController.clear();
        file = null;

        // Here you would typically call a repository to save the recipe
        emit(UploadSuccess());
      } else {
        emit(UploadError());
      }
    });
  }
}
