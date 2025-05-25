part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

// SuccessState state representing the currently selected tab index.

class SuccessState extends ProfileState {
  final int selectedIndex;
  SuccessState(this.selectedIndex);
}
