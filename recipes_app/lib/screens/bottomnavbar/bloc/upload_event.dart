part of 'upload_bloc.dart';

@immutable
sealed class UploadEvent {}

class SavedRecipeEvent extends UploadEvent {
  final String name;
  final String desc;
  final XFile imagePath;

  SavedRecipeEvent({
    required this.name,
    required this.desc,
    required this.imagePath,
  });
}

// Defines all events that can be dispatched to the UploadBloc,
// such as saving a recipe, loading dummy data, or toggling favorite status.
class SliderChangedEvent extends UploadEvent {
  final double minutes;

  SliderChangedEvent(this.minutes);
}

class ToggleFavoriteRecipeEvent extends UploadEvent {
  final int recipeIndex;
  ToggleFavoriteRecipeEvent(this.recipeIndex);
}

class LoadDummyDataEvent extends UploadEvent {}
