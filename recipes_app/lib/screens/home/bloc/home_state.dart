part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
// SuccessState state representing the currently selected tab index.

class SuccessState extends HomeState {
  final int selectedIndex;
  SuccessState(this.selectedIndex);
}
