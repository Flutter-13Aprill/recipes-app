import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unnecessary_import
import 'package:meta/meta.dart';
import 'package:recipes_app/features/upload/models/upload_model.dart';
part 'uplaod_event.dart';
part 'uplaod_state.dart';

/// Bloc to manage uploading recipes, including image picking,
/// recipe data input, and cooking duration.
///
/// - Holds controllers for food name and description input.
/// - Maintains cooking duration with snapping logic (10, 30, or 60).
/// - Manages a list of uploaded recipes and locally picked images.
/// - Handles events to update cooking duration, add recipes, and pick images.
class UplaodBloc extends Bloc<UplaodEvent, UplaodState> {
  TextEditingController foodNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  double cookingDuration = 30;
  final formKey = GlobalKey<FormState>();
  final List<UploadModel> uploadList = [];
  // List to hold locally picked images
  List<File> imagePick = [];

  UplaodBloc() : super(SuccessListState([])) {
    on<UplaodEvent>((event, emit) {});
    on<UpdateCookingDurationEvent>(updateCookingDurationMethode);
    on<AddRecioeEvent>(addRecioeMethode);
    on<PickImageEvent>(pickImageMethode);
  }

  FutureOr<void> updateCookingDurationMethode(
    UpdateCookingDurationEvent event,
    Emitter<UplaodState> emit,
  ) {
    cookingDuration = snapDuration(event.duration);
    emit(UpdateCookingDurationState());
  }

  double snapDuration(double val) {
    if (val <= 20) {
      return 10;
    } else if (val <= 45) {
      return 30;
    } else {
      return 60;
    }
  }

  FutureOr<void> addRecioeMethode(
    AddRecioeEvent event,
    Emitter<UplaodState> emit,
  ) async {
    uploadList.add(event.recipes);
    emit(SuccessListState(List.from(uploadList)));
  }

  FutureOr<void> pickImageMethode(
    PickImageEvent event,
    Emitter<UplaodState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final response = await picker.pickImage(source: ImageSource.gallery);
    if (response != null) {
      imagePick.add(File(response.path));
    }
    emit(ImagePickedState());
  }
}
