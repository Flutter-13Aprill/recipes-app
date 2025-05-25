part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

class SuccessState extends ProfileState {
  final int selectedIndex;
  SuccessState(this.selectedIndex);
}
