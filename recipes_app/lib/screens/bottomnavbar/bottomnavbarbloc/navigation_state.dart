part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {}
// SuccessState state indicating the currently selected page index.

class SuccessState extends NavigationState {
  final int selectedIndex;
  SuccessState(this.selectedIndex);
}
