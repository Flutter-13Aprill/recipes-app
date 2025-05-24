import 'package:app/models/recipe.dart';
import 'package:app/screen/upload/bloc/upload_event.dart';
import 'package:app/screen/upload/bloc/upload_state.dart';
import 'package:bloc/bloc.dart';
 import 'package:flutter/material.dart';

import 'package:app/models/upload.dart';

class UploadFoodBloc extends Bloc<UploadFoodEvent, UploadFoodState> {
    /// Controllers for text fields to manage food name and description

  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  UploadFoodBloc() : super(UploadFoodState(uploadData: Upload())) {
       // Sync food name input
    foodNameController.addListener(() {
      final text = foodNameController.text;
      if (text != state.uploadData.foodTitle) {
        add(FoodTitleChanged(text));
      }
    });
// Sync description input
    descriptionController.addListener(() {
      final text = descriptionController.text;
      if (text != state.uploadData.description) {
        add(DescriptionChanged(text));
      }
    });

    on<ImageSelected>(_onImageSelected);
    on<FoodTitleChanged>(_onFoodTitleChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<CookingMinutesChanged>(_onCookingMinutesChanged);
    on<UploadSubmitted>(_onUploadSubmitted);
    on<UploadStatusReset>((event, emit) {// Reset upload status
      emit(state.copyWith(status: UploadStatus.initial));
    });
  }

  void _onImageSelected(ImageSelected event, Emitter<UploadFoodState> emit) {
    emit(state.copyWith(
      uploadData: state.uploadData.copyWith(image: event.image),
      errorMessage: null,
    ));
  }
/// Updates the food title when user types in the input field
  void _onFoodTitleChanged(FoodTitleChanged event, Emitter<UploadFoodState> emit) {
     if (foodNameController.text != event.title) {
      foodNameController.text = event.title;
      foodNameController.selection = TextSelection.collapsed(offset: event.title.length);
    }
    emit(state.copyWith(
      uploadData: state.uploadData.copyWith(foodTitle: event.title),
      errorMessage: null,
    ));
  }
  /// Updates the description when user types in the input field

  void _onDescriptionChanged(DescriptionChanged event, Emitter<UploadFoodState> emit) {
    if (descriptionController.text != event.description) {
      descriptionController.text = event.description;
      descriptionController.selection = TextSelection.collapsed(offset: event.description.length);
    }
    emit(state.copyWith(
      uploadData: state.uploadData.copyWith(description: event.description),
      errorMessage: null,
    ));
  }
  /// Updates the cooking time when user moves the slider

  void _onCookingMinutesChanged(CookingMinutesChanged event, Emitter<UploadFoodState> emit) {
    emit(state.copyWith(
      uploadData: state.uploadData.copyWith(cookingMinutes: event.minutes),
      errorMessage: null,
    ));
  }

  /// Handles upload submission

  Future<void> _onUploadSubmitted(UploadSubmitted event, Emitter<UploadFoodState> emit) async {
    emit(state.copyWith(status: UploadStatus.loading));
    try {
       // Create a new Recipe object based on the uploaded data

      final newRecipe = Recipe(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: state.uploadData.foodTitle,
        profileImagePath: "assets/images/12.png",
        recipeImage: state.uploadData.image?.path ?? "",
        title: state.uploadData.foodTitle,
        isFavorite: false,
      );
// Emit success state with the new recipe
      emit(state.copyWith(status: UploadStatus.success, newRecipe: newRecipe));
    } catch (e) {      // If upload fails, emit failure state with error message

      emit(state.copyWith(status: UploadStatus.failure, errorMessage: e.toString()));
    }
  }
  /// Dispose of controllers to avoid memory leaks
  @override
  Future<void> close() {
    foodNameController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
