part of 'layout_bloc.dart';

@immutable
sealed class LayoutState {}

final class LayoutInitial extends LayoutState {}
final class ChangePageSuccessful extends LayoutState {}
final class ChangeSliderSuccessful extends LayoutState {}
final class ChangeFavoriteSuccessful extends LayoutState {}
final class CreateRecipeSuccessful extends LayoutState {}
