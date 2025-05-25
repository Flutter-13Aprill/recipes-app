part of 'recipes_bloc.dart';

@immutable
sealed class RecipesEvent {}

class passwordvisibility extends RecipesEvent {
  final bool isobscure;

  passwordvisibility({required this.isobscure});
}

class passwordchange extends RecipesEvent {
  final String password;
  passwordchange({required this.password});
}
