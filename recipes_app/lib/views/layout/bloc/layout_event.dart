part of 'layout_bloc.dart';

@immutable
sealed class LayoutEvent {}

class ChangePage extends LayoutEvent {
  final int index;
  ChangePage({required this.index});
}

class ChangeFavorite extends LayoutEvent {
  final int indexFood;
  ChangeFavorite({required this.indexFood});
}

class ChangeSlider extends LayoutEvent {
  final double value;
  ChangeSlider({required this.value});
}
class CreateRecipe extends LayoutEvent {

}
