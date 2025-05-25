part of 'recipe_bloc.dart';

@immutable
sealed class RecipeEvent {}

class PickImageEvent extends RecipeEvent {}

class SetNameEvent extends RecipeEvent {
  final String name;
  SetNameEvent(this.name);
}

class SetDescEvent extends RecipeEvent {
  final String desc;
  SetDescEvent(this.desc);
}

class SaveEvent extends RecipeEvent {}
