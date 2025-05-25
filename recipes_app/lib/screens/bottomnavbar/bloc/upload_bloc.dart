import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipes_app/models/recipes_info_model.dart';

part 'upload_event.dart';
part 'upload_state.dart';

// Bloc responsible for managing recipe upload and related UI state.
// It handles loading dummy data, saving recipes with images,
// and toggling favorite status for individual recipes.
class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final List<RecipesInfoModel> dummyRecipes = [
    RecipesInfoModel(
      name: 'Fresh Salad',
      desc: ' Salad',
      imagePath: 'assets/images/salad.png',
      minutes: 10,
      isFavorite: false,
      isMine: false,
      avatarPath: 'assets/images/avatar1.png',
      username: "Eilif Sonas",
    ),
    RecipesInfoModel(
      name: 'Greek Salad',
      desc: ' Salad',
      imagePath: 'assets/images/salad2.png',
      minutes: 12,
      isFavorite: true,
      isMine: false,
      avatarPath: 'assets/images/avatar2.png',
      username: "Calum Lewis",
    ),
    RecipesInfoModel(
      name: 'Pancakes',
      desc: ' Pancakes',
      imagePath: 'assets/images/pancake.png',
      minutes: 9,
      isFavorite: true,
      isMine: false,
      avatarPath: 'assets/images/avatar3.png',
      username: "Elena Shelby",
    ),
    RecipesInfoModel(
      name: 'Pancakes',
      desc: 'Pancakes',
      imagePath: 'assets/images/pancake2.png',
      minutes: 18,
      isFavorite: false,
      isMine: false,
      avatarPath: 'assets/images/avatar4.png',
      username: "Elena Shelby",
    ),
    RecipesInfoModel(
      name: 'Tiramisu',
      desc: ' dessert',
      imagePath: 'assets/images/Tiramisu.jpg',
      minutes: 30,
      isFavorite: true,
      isMine: false,
      avatarPath: 'assets/images/avatar1.png',
      username: "Elena Shelby",
    ),
  ];

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final ImagePicker picker = ImagePicker();

  UploadBloc() : super(UploadInitial()) {
    on<LoadDummyDataEvent>((event, emit) {
      emit(SuccessState(savedRecipes: dummyRecipes, minutes: 0));
    });
    on<SavedRecipeEvent>(onSaveRecipe);

    on<SliderChangedEvent>((event, emit) {
      List<RecipesInfoModel> currentRecipe = [];

      currentRecipe =
          (state is SuccessState) ? (state as SuccessState).savedRecipes : [];

      emit(SuccessState(savedRecipes: currentRecipe, minutes: event.minutes));
    });

    on<ToggleFavoriteRecipeEvent>((event, emit) {
      if (state is SuccessState) {
        final currentState = state as SuccessState;
        List<RecipesInfoModel> currentRecipe = List.from(
          (state as SuccessState).savedRecipes,
        );

        final oldRecipe = currentRecipe[event.recipeIndex];
        currentRecipe[event.recipeIndex] = RecipesInfoModel(
          name: oldRecipe.name,
          desc: oldRecipe.desc,
          imagePath: oldRecipe.imagePath,
          minutes: oldRecipe.minutes,
          isFavorite: !oldRecipe.isFavorite,
        );

        emit(
          SuccessState(
            savedRecipes: currentRecipe,
            minutes: currentRecipe[event.recipeIndex].minutes,
          ),
        );
      }
    });
  }

  Future<void> onSaveRecipe(
    SavedRecipeEvent event,
    Emitter<UploadState> emit,
  ) async {
    final directory = await getApplicationDocumentsDirectory();
    final String imagePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

    List<RecipesInfoModel> currentRecipe = [];
    if (state is SuccessState) {
      currentRecipe = List.from((state as SuccessState).savedRecipes);
    }
    currentRecipe.add(
      RecipesInfoModel(
        name: event.name,
        desc: event.desc,
        imagePath: (await File(event.imagePath.path).copy(imagePath)).path,
        minutes: (state is SuccessState) ? (state as SuccessState).minutes : 0,
      ),
    );
    emit(
      SuccessState(
        savedRecipes: currentRecipe,
        minutes: (state is SuccessState) ? (state as SuccessState).minutes : 0,
      ),
    );
  }
}
