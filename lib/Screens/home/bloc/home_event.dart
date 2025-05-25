part of 'home_bloc.dart';

// --- Bloc Events ---
sealed class HomeEvent {}

final class LoadRecipes extends HomeEvent {}

final class SelectCategory extends HomeEvent {
  final int selectedIndex;

  SelectCategory(this.selectedIndex);
}

final class LikeRecipe extends HomeEvent {}

final class RefreshScreen extends HomeEvent {}
