import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:re/models/recipe_model.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {

  double sliderValue = 30;
  List<RecipeModel> recipes = [];
  File? _image;
  final ImagePicker _picker = ImagePicker();

  RecipeBloc() : super(RecipeInitial()) {
    on<RecipeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SliderChangeEvent>(sliderChange);

    on<AddRecipeEvent>(addrecipe);

  }

  FutureOr<void> sliderChange(SliderChangeEvent event, Emitter<RecipeState> emit) {
    sliderValue = event.sliderValue;
    emit(SuccessSliderChange());
  }

  FutureOr<void> addrecipe(AddRecipeEvent event, Emitter<RecipeState> emit) {

    final recipe = event.recipeModel;
    recipe.imagePath = _image!;

    
    recipes.add(event.recipeModel);
    emit(SuccessAddedRecipeState(recipes: recipes));
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  }


}
